<%@ page import="com.fratroster.Frat" %>



<div class="fieldcontain ${hasErrors(bean: fratInstance, field: 'fratName', 'error')} required">
	<label for="fratName">
		<g:message code="frat.fratName.label" default="Frat Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="fratName" required="" value="${fratInstance?.fratName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fratInstance, field: 'fratDescription', 'error')} ">
	<label for="fratDescription">
		<g:message code="frat.fratDescription.label" default="Frat Description" />
		
	</label>
	<g:textField name="fratDescription" maxlength="128" value="${fratInstance?.fratDescription}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fratInstance, field: 'memebers', 'error')} ">
	<label for="memebers">
		<g:message code="frat.memebers.label" default="Memebers" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${fratInstance?.memebers?}" var="m">
    <li><g:link controller="fratMember" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="fratMember" action="create" params="['frat.id': fratInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'fratMembers.label', default: 'FratMembers')])}</g:link>
</li>
</ul>

</div>

