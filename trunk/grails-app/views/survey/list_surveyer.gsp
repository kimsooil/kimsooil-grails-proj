
<%@ page import="u56survey.Survey" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'survey.label', default: 'Survey')}" />
        <title>Hispanic Bio-Bank - List</title>
<link rel='stylesheet' type='text/css' href="${resource(dir:'fullcalendar',file:'fullcalendar.css')}" />
<link rel='stylesheet' type='text/css' href="${resource(dir:'fullcalendar',file:'fullcalendar.print.css')}" media='print' />


<export:resource />        
    </head>
    <body>

    
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <%--<g:if test="${session.user.role=='surveyer' }"><span class="menuButton"><g:link class="create" action="step1"><g:message code="default.new.label" args="[entityName]" /></g:link></span></g:if> --%>
        </div>
        <div class="body">

        
            <h1><g:message code="survey.list" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>

				<g:render template="/common/survey_list" model=[surveyInstanceList:Survey.list, surveyInstanceTotal: Survey.count()]/>
        </div>

    </body>
</html>
