<%@ page import="com.fratroster.user.User" %>
<!--fratroster header-->
<div class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <sec:ifLoggedIn>
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
      </sec:ifLoggedIn>
      <g:link controller="userProfile" action="index" class="navbar-brand"><i class="fa fa-university"></i> fratroster - <em>beta</em></g:link>
    </div>
    <sec:ifLoggedIn>
      <div class="navbar-collapse collapse">
        <ul class="nav navbar-nav navbar-right">   
          <g:if test="${userProfileInstance?.isProfileSetup}">         
          	<li><g:link controller="frat" action="list"><i class="fa fa-university fa-2x"></i></g:link></li>
          </g:if>
          <li><g:link controller="userProfile"><i class="fa fa-user fa-2x"></i></g:link></li>
          <%--g:hasAFrat>                    
            <g:set var="user" value="${User.findByUsername(sec.loggedInUserInfo(field:'username'))}"/>
            <g:each in="${user?.fratMembers}" status="i" var="fratMember">
              <li><g:link controller="frat" action="usersFratLanding" params='[fratid:"${fratMember?.frat?.id}"]'><i class="fa fa-asterisk fa-2x"></i><!--${fratMember?.frat?.fratName}--></g:link></li>
            </g:each>          
          </g:hasAFrat>
          <g:doesntHaveAFrat>
            <li><g:link controller="frat" action="list"><g:message code="USER_FINDFRAT_LINK"/></g:link></li>
          </g:doesntHaveAFrat--%>
          <li><g:link controller="userProfile" action="dashboard" id="${userProfileInstance?.id}"><i class="fa fa-cog fa-2x"></i></g:link>
          <li><g:link controller="logout"><i class="fa fa-sign-out fa-2x"></i></g:link></li>
        </ul>
      </div><!--/.nav-collapse -->    
    </sec:ifLoggedIn>
  </div>
</div>
<g:if test="${errorMsg != null && !errorMsg?.isEmpty()}">
	<div class="alert alert-error">  
  		<a class="close" data-dismiss="alert">×</a>  
  		<strong>Error!</strong>${errorMsg} 
	</div>
</g:if>