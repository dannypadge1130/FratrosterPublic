  <%@ page import="com.fratroster.user.User" %>
  <!--Begin User's Left Nav Banner-->
  <div class="span2 main" id="leftnav">
    <div class="banner">
      <p class="bannerTitle">My Favorites</p> 
    </div>
    <!--Begin User's List-->
    <ul class="nav nav-list">
      <li class="nav-header">Profile</li>
      <li><g:link controller="userProfile"><i class="icon-user"></i> Profile</g:link></li>
      <li><a href="#"><i class="icon-calendar"></i> Events</a></li>
      <li><a href="#"><i class="icon-group"></i> Family</span></a></li>
      <g:hasAFrat>
        <hr>
	   	<%--<li class="nav-header">
			<ul class="dropdown-menu">
	        	<g:set var="user" value="${User.findByUsername(sec.loggedInUserInfo(field:'username'))}"/>
              	<g:each in="${user?.fratMemebers}" status="i" var="fratMember">
              		<li>${fratMember?.frat?.fratName}</li>
              	</g:each>
        	</ul>
        </li>
        <span id="appLinkList">
	       	<g:each in="${fratInstance.apps}" status="i" var="app">
				<li>
					<g:set var="appType" value="${app?.getApp()}"/>					            												
					<g:link controller="apps" action="${appType?.appDetails?.actionView}" id="${app?.appid}">					                    	
						<i class="${appType?.appDetails?.image}" alt="app icon">${appType?.appDetails?.appName}</i>											
					</g:link>
				</li>
			</g:each>
		</span>--%>
      </g:hasAFrat>
    </ul>
  </div>