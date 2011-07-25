

<%@ page import="u56survey.Site" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'site.label', default: 'Site')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${siteInstance}">
            <div class="errors">
                <g:renderErrors bean="${siteInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fourletters"><g:message code="site.fourletters.label" default="Fourletters" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'fourletters', 'errors')}">
                                    <g:select name="fourletters" from="${siteInstance.constraints.fourletters.inList}" value="${siteInstance?.fourletters}" valueMessagePrefix="site.fourletters" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="location"><g:message code="site.location.label" default="Location" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'location', 'errors')}">
                                    <g:select name="location" from="${siteInstance.constraints.location.inList}" value="${siteInstance?.location}" valueMessagePrefix="site.location" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="site.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: siteInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${siteInstance?.name}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
