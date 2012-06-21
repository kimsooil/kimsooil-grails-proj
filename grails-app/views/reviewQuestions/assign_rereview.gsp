
<%@ page import="braintumorpathologyreview.ReviewQuestions" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

        <g:set var="entityName" value="${message(code: 'reviewQuestions.label', default: 'ReviewQuestions')}" />
        <title>Assign (Re-review)</title>
        <g:javascript library="prototype" />
        <g:javascript>
        function checkIftheSameReviewer(){
        	if ($('reviewer.id').value=="${reviewQuestionsInstance?.reviewer.id}"){
        		alert('1st & 2nd reviewers are same. Please choose a different reviewer.');
        		return false;
        	}
        	else{
        		return true;
        	} 
        }
        </g:javascript>
    </head>
    <body>
<%--    
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/dataEntry/firstpage')}">Return to Main-first</a></span>
            <g:if test="${session.user.role=='admin' }">
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            </g:if>

            <span class="menuButton"><g:link controller="dataEntry" class="list" action="list_unassigned">List Unassigned</g:link></span>
            <span class="menuButton"><g:link controller="dataEntry" class="list" action="list">List All</g:link></span>
        </div>
--%>
        <div class="body">
            <h1>Assign for 'Re-review Needed'</h1>
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
                                    <g:link controller="dataEntry" action="showcasedetails" id="${reviewQuestionsInstance?.studyid}">${reviewQuestionsInstance?.studyid}</g:link>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="requests">Reviewer assigned (current)</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'reviewer', 'errors')}">
                                	${reviewQuestionsInstance?.reviewer}
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="requests">2nd Reviewer assigned</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'reviewer', 'errors')}">
                                	<g:if test="${session.user.role=='admin' }">
                                	<%
										def uList=braintumorpathologyreview.User.findAllByRoleAndLoginNotEqual("reviewer", reviewQuestionsInstance.reviewer.login)

									 %>
                                    	<g:select name="reviewer.id" from="${uList}" optionKey="id" value="${reviewQuestionsInstance?.reviewer.id}" />
                                    </g:if>
                                    <g:elseif test="${session.user.role=='reviewer'}">
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
                <g:hiddenField name="studyid" value="${reviewQuestionsInstance.studyid}" />
                    <span class="button"><g:actionSubmit class="save" action="doAssign_rereview" value="Assign" onclick="return checkIftheSameReviewer()" /></span>
                    <!-- 
                    <g:if test="${session.user.role=='admin' }">
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    </g:if>
                     -->
                </div>
            </g:form>
        </div>
    </body>
</html>
