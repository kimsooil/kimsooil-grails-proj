
<%@ page import="u56survey.Survey" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'survey.label', default: 'Survey')}" />
        <title>Hispanic Bio-Bank - Home</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <g:if test="${session.user.role=='admin' }"><span class="menuButton"><g:link controller="person" class="list" action="list">Manage User</g:link></span></g:if>
            <%--<g:if test="${session.user.role=='surveyer' }"><span class="menuButton"><g:link class="create" action="step1"><g:message code="default.new.label" args="[entityName]" /></g:link></span></g:if> --%>
        </div>
        <div class="body">
        <g:if test="${session.user.role=='admin' }">
        
            <h1><g:message code="survey.list" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:render template="/common/gchart"/>
			<g:render template="/common/survey_list"/>
        </div>
        </g:if>
        <g:else>
        	<h1><g:message code="surveyer.options" /></h1>
			<ul>        	
	        	<ul>
	        		
	        		<br/>
		        	<li><g:link class="create" action="step1"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
		        	<br/>
		        	<li><g:link class="list_surveyer" action="list_surveyer"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
		        	<br/>
		        	<g:render template="/common/gchart"/>
	        	</ul>
	        </ul>
        </g:else>
    </body>
</html>
