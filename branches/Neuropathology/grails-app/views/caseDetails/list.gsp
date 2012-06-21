
<%@ page import="braintumorpathologyreview.CaseDetails" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'caseDetails.label', default: 'CaseDetails')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'caseDetails.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="MRIDate1" title="${message(code: 'caseDetails.MRIDate1.label', default: 'MRID ate1')}" />
                        
                            <g:sortableColumn property="MRIDate2" title="${message(code: 'caseDetails.MRIDate2.label', default: 'MRID ate2')}" />
                        
                            <g:sortableColumn property="MRIReport1" title="${message(code: 'caseDetails.MRIReport1.label', default: 'MRIR eport1')}" />
                        
                            <g:sortableColumn property="MRIReport2" title="${message(code: 'caseDetails.MRIReport2.label', default: 'MRIR eport2')}" />
                        
                            <g:sortableColumn property="MRISummary1" title="${message(code: 'caseDetails.MRISummary1.label', default: 'MRIS ummary1')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${caseDetailsInstanceList}" status="i" var="caseDetailsInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${caseDetailsInstance.id}">${fieldValue(bean: caseDetailsInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: caseDetailsInstance, field: "MRIDate1")}</td>
                        
                            <td>${fieldValue(bean: caseDetailsInstance, field: "MRIDate2")}</td>
                        
                            <td>${fieldValue(bean: caseDetailsInstance, field: "MRIReport1")}</td>
                        
                            <td>${fieldValue(bean: caseDetailsInstance, field: "MRIReport2")}</td>
                        
                            <td>${fieldValue(bean: caseDetailsInstance, field: "MRISummary1")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${caseDetailsInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
