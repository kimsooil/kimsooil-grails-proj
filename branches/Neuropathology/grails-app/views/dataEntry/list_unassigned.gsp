
<%@ page import="braintumorpathologyreview.DataEntry" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dataEntry.label', default: 'DataEntry')}" />
        <title>Unassigned Cases</title>
        <g:javascript library="application" />
		<modalbox:modalIncludes />
        
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
        </div>
        <div class="body">
            <h1>Unassigned Cases</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">


<br/>
                <table>
                    <thead>
                        <tr>
                        
                            <!-- <g:sortableColumn property="id" title="${message(code: 'dataEntry.id.label', default: 'Id')}" /> -->
                        
                            <g:sortableColumn property="studyid" title="${message(code: 'dataEntry.studyid.label', default: 'Studyid')}" />

                            <g:sortableColumn property="dateCreated" title="Date Created" />
                            
                            <g:sortableColumn property="lastUpdated" title="Last Updated" />

                            <th>Status</th>
                            
                            <th>Owner</th>
                            
                            <th>Function(s)</th>  
                      
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${dataEntryInstanceList}" status="i" var="dataEntryInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <!-- <td><g:link action="show" id="${dataEntryInstance.id}">${fieldValue(bean: dataEntryInstance, field: "id")}</g:link></td> -->
                        
                            <td align="center">
                            <%--<font color="blue"><g:link action="show" id="${dataEntryInstance.id}">${fieldValue(bean: dataEntryInstance, field: "studyid")}</g:link></font> --%>

                                <g:each in="${dataEntryInstance.reviews}" var="r">
                                  <g:if test="${r?.status=='Unassigned'}">
                               	  [<g:link controller="reviewQuestions" action="show" id="${r.id}">${r.studyid}</g:link>]
								  </g:if>
                                </g:each>

                            </td>

                            <td align="center"><g:formatDate format="yyyy-MM-dd HH:mm" date="${dataEntryInstance.dateCreated}" /></td>
                           
							<td align="center"><g:formatDate format="yyyy-MM-dd HH:mm" date="${dataEntryInstance.lastUpdated}" /></td>

                            <td align="center">
                            ${dataEntryInstance.casestatus}
							</td>
                            <td align="center">
                            ${dataEntryInstance.owner}
                            </td>							
							<td align="center">

                                <g:each in="${dataEntryInstance.reviews}" var="r">
                                  <g:if test="${r?.status=='Unassigned'}">
                               	  <%--<li>[<g:link controller="reviewQuestions" action="assign_unassigned" id="${r.id}">Assign</g:link>]</li>--%>
                               	  [<modalbox:createLink controller="reviewQuestions" action="assign_unassigned" id="${r.id}" title="Assign" width="500">Assign</modalbox:createLink>]
								  </g:if>
                                </g:each>
						
							<g:if test="${dataEntryInstance.reviews}">
								<!--  if exists, do nothing -->
							</g:if>
							<g:else>
								[<g:link action="create_review_unassigned" id="${dataEntryInstance.id}" params="[studyid:dataEntryInstance.studyid]">create review</g:link>]
							</g:else>							
							</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${dataEntryInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
