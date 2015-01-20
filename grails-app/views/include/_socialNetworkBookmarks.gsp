<%@ page import="com.fratroster.SocialNetworkInfo"%>

<!--Facebook-->
<g:if test="${socialNetworkInfo?.facebook != null}">
	<a href="${socialNetworkInfo?.facebook}" target="_blank">
</g:if>
<i class="fa fa-facebook"></i>
<g:if test="${socialNetworkInfo?.facebook != null}">
	</a>
</g:if><!--/Facebook-->
 
<!--Twitter-->
<g:if test="${socialNetworkInfo?.twitter != null}">
	<a href="${socialNetworkInfo?.twitter}" target="_blank"> 
</g:if>
<i class="fa fa-twitter"></i>
<g:if test="${socialNetworkInfo?.twitter != null}">
	</a>
</g:if><!--/Twitter-->

<!--Google Plus-->
<g:if test="${socialNetworkInfo?.googleplus != null}">
	<a href="${socialNetworkInfo?.googleplus}" target="_blank">
</g:if>
<i class="fa fa-google-plus"></i>
<g:if test="${socialNetworkInfo?.googleplus != null}">
	</a> 
</g:if><!--/Google Plus-->

<!--LinkedIn-->
<g:if test="${socialNetworkInfo?.linkedin != null}">
	<a href="${socialNetworkInfo?.linkedin}" target="_blank">
</g:if>
<i class="fa fa-linkedin"></i>
<g:if test="${socialNetworkInfo?.linkedin != null}">
	</a> 
</g:if><!--/LinkedIn-->

<!--Website-->
<g:if test="${socialNetworkInfo?.website != null}">
	<a href="${socialNetworkInfo?.website}" target="_blank">
</g:if>
<i class="fa fa-globe"></i>
<g:if test="${socialNetworkInfo?.website != null}">
	</a>
</g:if><!--/Website-->