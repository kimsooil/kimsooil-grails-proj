
<%@ page import="braintumorpathologyreview.DataEntry" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dataEntry.label', default: 'DataEntry')}" />
        <title>New Assignments / In Progress</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
        </div>
        <div class="body">
            <h1>New Assignments / In Progress</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
				 <table>
				 <thead><tr>
						<g:sortableColumn property="studyid" title="Study ID"/>
						<g:sortableColumn property="dateAssigned" title="Date Assigned" />
						<g:sortableColumn property="lastUpdated" title="Last Updated" />
						<g:sortableColumn property="status" title="Status"/>
						<th>Cycle#</th>
						<g:sortableColumn property="reviewer.name" title="Assigned to"/>
						                            
				 </tr>
				 </thead>
				 <tbody>
				 <g:each in="${rqList}" status="i" var="r">
				<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
					<td align="center">
					<%--<g:link controller="dataEntry" action="showcasedetails" id="${r.studyid}">${r.studyid}</g:link>--%>
				    [<g:link controller="reviewQuestions" action="show" id="${r.id}">${r.studyid}</g:link>]
					</td>
					<td align="center"><g:formatDate format="yyyy-MM-dd HH:mm" date="${r.dateAssigned }"/></td>
					<td align="center"><g:formatDate format="yyyy-MM-dd HH:mm" date="${r.lastUpdated }"/></td>
					<td align="center">${r.status }</td>
					<td align="center">${r.cycle }</td>
					<td align="center">${r.reviewer }</td>
				 </tr>
				 </g:each>
				 </tbody>
				 </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${rqListTotal}" />
            </div>
        </div>
    </body>
</html>
