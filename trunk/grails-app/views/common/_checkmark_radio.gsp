<%--
<g:if test="${request.getHeader('user-agent').indexOf('MSIE')>=0 || request.requestURI.indexOf('preview')>=0 || request.requestURI.indexOf('surveyCompleted')>=0}">
	${it.radio} ${it.label}
</g:if>
<g:else>
	<div class="checkbox">${it.radio}</div> <div class="label">${it.label}</div>
</g:else>
 --%>
${it.radio} ${it.label}&nbsp;&nbsp;&nbsp;