<%@ page import="braintumorpathologyreview.DataEntry" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        
        <title>Request more info</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/dataEntry/firstpage')}">Home</a></span>
            <g:if test="${session.user.role=='admin' }">
            <span class="menuButton"><g:link controller="dataEntry" class="list" action="list">List all cases</g:link></span>
            <!-- <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span> -->
            </g:if>
        </div>

        <div class="body">
            <h1>Request more info for: <g:link controller="reviewQuestions" action="show" id="${r?.id}">${r}</g:link></h1>
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>            	
            </g:if>
            <g:else>
            	<div class="message">Enter why / which info you request</div>
            	<%--<div class="message">${flash.reviewQuestionsInstance.gradingSubClassification}</div> --%>
            </g:else>

            <g:form method="post" >

                <div class="dialog">
                    <table>
                        <tbody>
<%--                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="login"><g:message code="user.login.label" default="Login" /></label>
                                </td>
                                <td valign="top">
                                    <label>${session.user.login}</label>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="user.name.label" default="Name" /></label>
                                </td>
                                <td valign="top">
                                    <label>${session.user.name}</label>
                                </td>
                            </tr>
                       
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="contactSubject">Subject:</label>
                                </td>
                                <td valign="top" >
                                    <g:textField name="contactSubject" value="${subject}" />
                                </td>
                            </tr>
 --%>                             
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="contactBody">Message:</label>
                                </td>
                                <td valign="top" >
                                    <g:textArea name="contactBody" value="${body}" style="width:100%" />
                                </td>
                            </tr>                        
                       
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="sendcontact2" value="Send Request" /></span>
                </div>
                <g:hiddenField name="id" value="${r?.id}" />
            </g:form>
        </div>
    </body>
</html>
