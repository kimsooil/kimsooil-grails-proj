
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
            <g:if test="${session.user.role=='admin' }"><span class="menuButton"><g:link class="create" action="create">New User</g:link></span></g:if>
        </div>
        <div class="body">
        <g:if test="${session.user.role=='admin' }">
        
            <h1><g:message code="survey.list" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>

            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="ID" />
                        
							<g:sortableColumn property="login" title="login" />
							
                            <g:sortableColumn property="password" title="password" />                     
                            
                            <g:sortableColumn property="name" title="name" />
                        
                            <g:sortableColumn property="role" title="role" />
                            
                            <g:sortableColumn property="location" title="location" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${personInstanceList}" status="i" var="personInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${personInstance.id}">${personInstance?.id}</g:link></td>
                        
                            <td>${personInstance.login}</td>                 
                        	<td>#####</td>
                            <td>${personInstance?.name }</td>                        
                            <td>${personInstance?.role}</td>
                        	<td>${personInstance?.location}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${personInstanceTotal}" />
            </div>
        </div>
        </g:if>
    </body>
</html>
