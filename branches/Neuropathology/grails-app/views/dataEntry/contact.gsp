<%@ page import="braintumorpathologyreview.DataEntry" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>Contact Admin</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
        </div>
        <div class="body">
            <h1>Contact Administrator/Coordinator</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>

            <g:form method="post" >

                <div class="dialog">
                    <table>
                        <tbody>
                        
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
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="contactBody">Message Body:</label>
                                </td>
                                <td valign="top" >
                                    <g:textArea name="contactBody" value="${body}" rows="10" cols="60" />
                                </td>
                            </tr>                        
                       
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="sendcontact" value="Send" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
