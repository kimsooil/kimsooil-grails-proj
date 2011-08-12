<%--
<g:if test="${request.getHeader('user-agent').indexOf('MSIE')>=0 || request.requestURI.indexOf('preview')>=0 || request.requestURI.indexOf('surveyCompleted')>=0}">
	<div>${it.radio} ${it.label}</div>
</g:if>
<g:else>
	<div class="vcheckbox">${it.radio}</div> <div class="label">${it.label}</div>
</g:else>
 --%>

${it.radio} ${it.label}<br/>