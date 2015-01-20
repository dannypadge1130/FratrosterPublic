<%@ page import="com.fratroster.memberType.RushMember"%>
<%@ page import="com.fratroster.memberType.BrotherMember"%>
<%@ page import="com.fratroster.memberType.PledgeMember"%>
<%@ page import="com.fratroster.memberType.AlumniMember"%>

<div class="rush-fraternities">
	<div class="rush-fraternities">
		<g:each in="${AlumniMember.findAllByUser(userInstance)}" var="alumniMember">
			<g:link controller="frat" action="show" id="${alumniMember?.frat?.id}" data-toggle="tooltip" title="${alumniMember?.frat?.fratName} | Alumni">
		    	<img class="img-thumbnail" src="${alumniMember?.frat?.image?.imageUrl}">
		   	</g:link>
		</g:each>
		<g:each in="${BrotherMember.findAllByUser(userInstance)}" var="brotherMember">
			<g:link controller="frat" action="show" id="${brotherMember?.frat?.id}" data-toggle="tooltip" title="${brotherMember?.frat?.fratName} | Brother">
		    	<img class="img-thumbnail" src="${brotherMember?.frat?.image?.imageUrl}">
		   	</g:link>
		</g:each>
		<g:each in="${PledgeMember.findAllByUser(userInstance)}" var="pledgeMember">
			<g:link controller="frat" action="show" id="${pledgeMember?.frat?.id}" data-toggle="tooltip" title="${pledgeMember?.frat?.fratName} | Pledge">
		    	<img class="img-thumbnail" src="${pledgeMember?.frat?.image?.imageUrl}">
		   	</g:link>
		</g:each>
		<g:each in="${RushMember.findAllByUser(userInstance, false)}" var="rushMember">
			<g:link controller="frat" action="show" id="${rushMember?.frat?.id}" data-toggle="tooltip" title="${rushMember?.frat?.fratName} | Rush">
		    	<img class="img-thumbnail" src="${rushMember?.frat?.image?.imageUrl}">
		   	</g:link>
		</g:each>
	</div>
</div>