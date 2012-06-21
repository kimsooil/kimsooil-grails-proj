
<%@ page import="braintumorpathologyreview.ReviewQuestions" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'reviewQuestions.label', default: 'ReviewQuestions')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/dataEntry/firstpage')}">Home</a></span>
            <g:if test="${session.user.role=='admin' }">
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            </g:if>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${reviewQuestionsInstance}">
            <div class="errors">
                <g:renderErrors bean="${reviewQuestionsInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${reviewQuestionsInstance?.id}" />
                <g:hiddenField name="version" value="${reviewQuestionsInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="studyid">studyid</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'studyid', 'errors')}">
                                    <!-- <g:textField name="studyid" value="${reviewQuestionsInstance?.studyid}" /> -->
                                    ${reviewQuestionsInstance?.studyid}
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="requests">Reviewer assigned</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'reviewer', 'errors')}">
                                	<g:if test="${session.user.role=='admin' }">
                                    	<g:select name="reviewer.id" from="${braintumorpathologyreview.User.list()}" optionKey="id" value="${reviewQuestionsInstance?.reviewer.id}" />
                                    </g:if>
                                    <g:elseif test="${session.user.role=='reviewer' }">
                                    	<label for="reviewer">${reviewQuestionsInstance.reviewer.name}</label>
                                    </g:elseif>
                                </td>
                            </tr>
<!--                             
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="requests">Status</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'reviewer', 'errors')}">
                                	<g:if test="${session.user.role=='admin' }">
                                    	<g:select name="status" from="${reviewStatus}" value="${reviewQuestionsInstance?.status}" />
                                    </g:if>
                                    <g:elseif test="${session.user.role=='reviewer' }">
                                    	<label for="status">${reviewQuestionsInstance.status}</label>
                                    </g:elseif>
                                </td>
                            </tr>
-->
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update_after_assignment" value="Assign" /></span>
                    <g:if test="${session.user.role=='admin' }">
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    </g:if>
                </div>
            </g:form>
        </div>
    </body>
</html>
