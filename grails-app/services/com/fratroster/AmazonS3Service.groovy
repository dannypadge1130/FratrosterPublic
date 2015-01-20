package com.fratroster

import static grails.async.Promises.*
import grails.async.*

import org.springframework.web.multipart.commons.CommonsMultipartFile

import com.fratroster.constants.AmazonS3Constants
import com.fratroster.jobqueues.ProfileImageUpload;
import com.fratroster.user.User
import com.fratroster.user.UserProfile

class AmazonS3Service {
	
  def springSecurityService
	
  Map imageExtensionMap = [
	  "image/png" : ".png",
	  "image/jpeg" : ".jpg",
	  "image/gif" : ".gif"
  ]
  
  def photoUpload(CommonsMultipartFile file) {  
		def folder = new File(AmazonS3Constants.DEFAULT_LOCAL_PROFILE_PICTURE_BUCKET)
		if(!folder.exists()) {
			folder.mkdirs()
		}
		  
		if(imageExtensionMap.containsKey(file.contentType)) {
			User user = springSecurityService.currentUser
			UserProfile profile = user.profile
			
			if(profile?.profileImage?.imageName != null && !profile?.profileImage?.imageName.isEmpty()) {
				def oldFilePath = AmazonS3Constants.DEFAULT_LOCAL_PROFILE_PICTURE_BUCKET+profile.profileImage.imageName
				File oldFile = new File(oldFilePath)
				oldFile.delete()
			}
			
			String newFilePath = AmazonS3Constants.DEFAULT_LOCAL_PROFILE_PICTURE_BUCKET+user.id+imageExtensionMap[file.contentType]
			File newFile = new File(newFilePath)
			file.transferTo(newFile)
			
			S3Image profileImage = new S3Image()
			profileImage.imageUrl = AmazonS3Constants.DEFAULT_LOCAL_PROFILE_PICTURE_URL+newFile.name
			profileImage.imageName = user.id+imageExtensionMap[file.contentType]
			profileImage.save(flush: true)
			profile.profileImage = profileImage
			profile.save(flush: true)
			
			ProfileImageUpload newItemForQueue = new ProfileImageUpload()
			newItemForQueue.user = user
			newItemForQueue.filePath = newFilePath
			newItemForQueue.save(flush: true)
		} else {
			log.error("ProfileImage Upload - invalid image type: "+file.contentType)
		}	
	}
}