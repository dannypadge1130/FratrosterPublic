<div id="fratdescription">
	<g:if test="${(sec.loggedInUserInfo(field:'username') == fratInstance.fratAdmin.username) && editView}">
		<g:formRemote name="myForm" update="fratdescription" url="[controller: 'frat', action:'updateFratDescription']">
			<div class="row">
				<!--Frat Banner Photo-->
		    	<div class="span10 offset1 text-center fratBannerPhoto">
		        	<img class="img-polaroid" src="${resource(dir: 'images/fratlanding', file: 'fratBannerPhoto.png')}">
		        </div>
		        <div class="span1"></div>
	        </div>
	       	<!--Frat Logo & Description-->
	       	<!--Frat Logo-->
	       	<div class="row">
	       		<!--Frat Logo-->
	        	<div class="span2 offset1 text-center fratLogo">
	            	<img class="img-polaroid" src="${resource(dir: 'images/fratlist', file: 'fratLogo.jpg')}">
	        	</div>
				<!--Frat Description-->
				<div class="span8">
	            	<g:if test="${fratInstance?.fratDescription}">
						<span class="property-value" aria-labelledby="fratDescription-label">
							<g:textArea class="span8" name="fratDescription" value="${fratInstance?.fratDescription}" rows="8" cols="60"/>
						</span>	
					</g:if>
		           	<!--Admin Update Frat Description-->
					<g:hiddenField name="id" value="${fratInstance.id}"/>
					<g:submitButton class="btn btn-primary" name="Update" value="Update"/> 
	            </div>
	            <div class="span1"></div> 
			</div>
		</g:formRemote>
	</g:if>
	<g:else>
		<div class="row">
		<!--Frat Banner Photo-->
			<div class="span10 offset1 text-center fratBannerPhoto">
		    	<img class="img-polaroid" src="${resource(dir: 'images/fratlanding', file: 'fratBannerPhoto.png')}">
		    </div>
		   	<div class="span1"></div>
	   	</div>
		<!--Frat Logo & Description-->
	    <!--Frat Logo-->
	    <div class="row">
			<div class="span2 offset1 text-center fratLogo">
		    	<img class="img-polaroid" src="${resource(dir: 'images/fratlist', file: 'fratLogo.jpg')}">
		    </div>
		<!--Frat Description-->
			<div class="span8">
				<p>
					<g:if test="${fratInstance?.fratDescription}">
						<span class="property-value" aria-labelledby="fratDescription-label"><g:fieldValue bean="${fratInstance}" field="fratDescription"/></span>	
					</g:if>
				</p>
				<g:if test="${sec.loggedInUserInfo(field:'username') == fratInstance?.fratAdmin?.username}">
					<g:remoteLink action="editFratDescription" update="fratdescription" id="${fratInstance.id}">edit description.</g:remoteLink>
				</g:if>
			</div>
			<div class="span1"></div>
		</div>
	</g:else>
</div>