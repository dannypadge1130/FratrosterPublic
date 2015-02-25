package com.fratroster.jobs

import org.jets3t.service.acl.AccessControlList
import org.jets3t.service.impl.rest.httpclient.RestS3Service
import org.jets3t.service.model.S3Bucket
import org.jets3t.service.model.S3Object
import org.jets3t.service.security.AWSCredentials

import com.fratroster.S3Image
import com.fratroster.constants.AmazonS3Constants
import com.fratroster.jobqueues.ProfileImageUpload
import com.fratroster.user.User

public class S3ProfilePhotoUploadJob  {
	
	def grailsApplication
	
	static triggers = {
		cron name: 's3ProfilePhotoUploadJob', cronExpression: "2 0 * * * ?"
	}
	
	Map imageExtensionMap = [
		"png" : "image/png",
		"jpg" : "image/jpeg",
		"gif" : "image/gif"
	]
   
	def execute() {
		log.info("Running S3 profile photo sync.")
		RestS3Service s3 = new RestS3Service(new AWSCredentials(grailsApplication.config.aws.accesskey, grailsApplication.config.aws.secretkey))
		S3Bucket profilePictureBucket = s3.getOrCreateBucket(AmazonS3Constants.PROFILE_PICTURE_BUCKET_PATH, S3Bucket.LOCATION_US)
		profilePictureBucket.setAcl(AccessControlList.REST_CANNED_PUBLIC_READ)

		for(ProfileImageUpload rawProfileImageObject : ProfileImageUpload.list()) {
			try {
				User user = rawProfileImageObject.user
				def file = new File(rawProfileImageObject.filePath)
				
				def (rawFileName, fileExt) = (file.name).tokenize( '.' )
				if(file.exists() && imageExtensionMap.containsKey(fileExt)) {
					//if file exists on S3 delete it
					if(s3.isObjectInBucket(profilePictureBucket.getName(), file.name)) {
						s3.deleteObject(profilePictureBucket, user.profile.profileImage.imageName)
						log.debug("image delete from s3 bucket: "+file.name)
					}
					
					//create S3Object
					S3Object profileImageS3Object = new S3Object()
					profileImageS3Object.setAcl(AccessControlList.REST_CANNED_PUBLIC_READ)
					profileImageS3Object.setContentType(imageExtensionMap[fileExt])
					profileImageS3Object.setDataInputFile(file)
					profileImageS3Object.setKey(String.valueOf(user.id)+"."+fileExt)
					profileImageS3Object.setBucketName(profilePictureBucket.getName())
					s3.putObject(profilePictureBucket, profileImageS3Object)
					log.debug("image added to s3 bucket: "+file.name)
					
					
					//update Profile Image
					S3Image profileImage = user.profile.profileImage
					profileImage.imageUrl = AmazonS3Constants.DEFAULT_PROFILE_PICTURE_URL+profileImageS3Object.getKey()
					profileImage.imageName = profileImageS3Object.getKey()
					profileImage.save(flush: true)
					log.debug("profile image updated: "+file.name)
					
					rawProfileImageObject.delete()
					file.delete()
					log.debug("deleted raw file from disk: "+file.name)
					
				} else {
					log.error("Error: Couldnt find file on disk: "+rawProfileImageObject.filePath)
				}
			} catch (Exception e) {
				log.error("Error uploading profile image tp S3: "+rawProfileImageObject.filePath)
				log.error("Error message: "+e.getMessage())
			}
		}
		log.info("Finished running S3 profile photo sync.")
	}
}