<%@ page import="com.fratroster.Frat" %>

<div class="row">
	<div class="col-lg-6">
		<!--About Pan Sophic-->
		<div class="main">
			<div class="banner">
				<g:if test="${fratInstance?.fratName}">
					<p class="banner-title property-value"
						aria-labelledby="fratName-label">
						About
						<g:fieldValue bean="${fratInstance}" field="fratName" />
					</p>
				</g:if>
			</div>			
			<g:if test="${fratInstance?.fratName}">
				<h2 class="listing-title property-value"
					aria-labelledby="fratName-label">
					<g:fieldValue bean="${fratInstance}" field="fratName" />
				</h2>
			</g:if>
			<g:if test="${fratInstance?.fratName}">
				<p class="property-value" aria-labelledby="fratName-label">
					<g:fieldValue bean="${fratInstance}" field="fratDescription" />
				</p>
			</g:if>
		</div>
	</div>
</div>