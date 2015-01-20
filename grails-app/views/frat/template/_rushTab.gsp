<%@ page import="com.fratroster.pendinguser.PendingRush"%>
<%@ page import="com.fratroster.memberType.RushMember"%>

<g:if test="${rushTabMessage != null && !rushTabMessage.isEmpty()}">
	<div class="alert alert-success">
		<a class="close" data-dismiss="alert">×</a>  
		${rushTabMessage}   
	</div>  
</g:if>
<!--Rush Listing-->
<div class="row tab-information">
	<div class="col-lg-12">
		<!--rush-->
		<input type="hidden" id="totalRushCount" value="${activeRushList?.size()}" />
		<g:each in="${activeRushList}" status="rushIndex" var="rush">
              	<!--rush-->
                	<div class="col-lg-3 col-md-4 col-sm-6">            
                  	<div class="list-background">
                    		<div class="banner">
                      		<p class="banner-title">${rush?.profile?.getFullName()}</p>  
                    		</div>
                     	<!--rush container-->
                     	<div class="list-container">                                                            
                       	<div class="list-options">
                        	<!--Open Rush Preview Card-->
                        	<g:if test="${rushIndex != activeRushList.size()-1}">
                        		<g:set var="rushNext" value="${activeRushList.get(rushIndex+1)?.id}" />
                        	</g:if>
                        	<g:else>
                        		<g:set var="rushNext" value="${activeRushList.get(0)?.id}" />
                        	</g:else>
                        	<g:if test="${rushIndex != 0}">
                        		<g:set var="rushPrevious" value="${activeRushList.get(rushIndex-1)?.id}" />
                        	</g:if>
                        	<g:else>
                        		<g:set var="rushPrevious" value="${activeRushList.get(activeRushList.size()-1)?.id}" />
                        	</g:else>
							<g:remoteLink class="btn btn-default preview-rush" action="renderRushCard" params="[populateId:rush?.id, rushIndex:rushIndex]" update="rushCard" onComplete="\$('#rush-preview-modal').modal('show');">
								<i class="fa fa-search-plus fa-lg"></i>
							</g:remoteLink>   
							<input type="hidden" id="nextRush_${rushIndex}" value="${rushNext}"/> 
							<input type="hidden" id="previousRush_${rushIndex}" value="${rushPrevious}"/>                    
                       	</div> 
                        <div class="hover-mask">                                       
                        	<!--rush image-->
                          	<div class="profile-photo">
                  						<g:link controller="userProfile" action="show" id="${rush?.profile?.id}">
                  							<img class="img-thumbnail image-resize listing-logo pull-left" src="${rush?.profile?.profileImage?.imageUrl}" alt="profile picture" />
                  						</g:link>
                          	</div>              
                          	<!--rush info-->
                          	<div class="info">                                              		
                              <!--rush name-->
                        			<h4 class="listing-response">
                        				<g:link controller="userProfile" action="show" id="${rush?.profile?.id}">
                        					${rush?.profile?.getFullName()}
                        				</g:link>
                        			</h4>                          		
                          		<p class="listing-response">
                          			<g:if test="${rush?.profile?.gpa}">
	                              		<i class="fa fa-book"></i> <g:formatNumber number="${rush?.profile?.gpa}" minFractionDigits="1" maxFractionDigits="2" maxIntegerDigits="1" minIntegerDigits="1" />
	                              	</g:if>
	                              	<i class="fa fa-graduation-cap"></i>
	                              	<g:formatDate format="yyyy" date="${rush?.profile?.graduationYear}"/>
                            	</p>                             	
                            	<g:set var="revokeInvite" value="${false}" />
                            	<g:set var="denyInvite" value="${false}" />
                            	<g:isPendingRushOfUsersFrats userId="${rush.id}" invited="${true}">
                            		PENDING RUSH INVITE
                            		<g:set var="revokeInvite" value="${true}" />
                            	</g:isPendingRushOfUsersFrats>
                            	<g:isPendingRushOfUsersFrats userId="${rush.id}" invited="${false}">
                            		PENDING RUSH REQUEST
                            		<g:set var="denyInvite" value="${true}" />
                            	</g:isPendingRushOfUsersFrats>
                            	<g:ifAFratAdmin>
                            		<g:if test="${revokeInvite}"> 
                            			<g:remoteLink class="btn btn-default btn-xs" action="populateRevokeRushInviteModal" id="${rush.id}" update="revokeRushInvite" onComplete="\$('#revoke-rush-invitation-modal').modal('show');">
                							<i class="fa fa-plus"></i> Revoke Invite
                						</g:remoteLink>        
                					</g:if>
                					<g:elseif test="${denyInvite}">
                						<g:remoteLink class="btn btn-default btn-xs" action="populateRevokeRushInviteModal" id="${rush.id}" update="revokeRushInvite" onComplete="\$('#revoke-rush-invitation-modal').modal('show');">
                							<i class="fa fa-plus"></i> Deny Request
                						</g:remoteLink> 
                					</g:elseif>
                					<g:else>
										<g:isNonMemberOfUsersFrats userId="${rush.id}">
	                						<g:remoteLink class="btn btn-default btn-xs" action="populateAddRushListModal" id="${rush.id}" update="inviteRush" onComplete="\$('#add-rush-modal').modal('show');">
	                							Add Rush
	                						</g:remoteLink> 
	                					</g:isNonMemberOfUsersFrats>
                					</g:else>
                				</g:ifAFratAdmin>
                          	</div>   
                          	<g:set var="userInstance" value="${rush}"/>
                          	<g:render template="/frat/template/fratThumbnailList" bean="${userInstance}" />
                        </div>                  
                     </div>
                  </div>              
                </div><!--rush--> 
		</g:each>
	</div><!--/col-->
</div><!--/Rush Listing-->