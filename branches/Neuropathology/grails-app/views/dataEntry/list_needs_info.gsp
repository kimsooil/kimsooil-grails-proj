
<%@ page import="braintumorpathologyreview.DataEntry" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dataEntry.label', default: 'DataEntry')}" />
        <title>Needs Additional Info</title>
		<g:javascript library="application" />
		<modalbox:modalIncludes />
        
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
        </div>
        <div class="body">
            <h1>Needs Additional Info</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">


                <table>
                    <thead>
                        <tr>
                            <g:sortableColumn property="studyid" title="${message(code: 'dataEntry.studyid.label', default: 'Studyid')}" />

                            <th>Status</th>
                            
                            <th>reviewer</th>
                            
                            <th>Assigned to</th>  

                            <th>Function(s)</th>
                                              
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${dataEntryInstanceList}" status="i" var="dataEntryInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td align="center">
                                <g:each in="${dataEntryInstance.reviews}" var="r">
									<g:if test="r?.status=='Need More Info'">
									<%
									def caseDetailsInstance = braintumorpathologyreview.CaseDetails.findByStudyid(r.studyid)
									 %>
                                    <g:link action="show_dataEntry_and_caseDetails" id="${caseDetailsInstance.id}">${r.studyid}</g:link>
                                    </g:if>
                                </g:each>                            
                            </td>

                            <td align="center">
                            ${dataEntryInstance.casestatus}
							</td>
							<td align="center">

                                <g:each in="${dataEntryInstance.reviews}" var="r">
									<g:if test="r?.status=='Need More Info'">
                                    ${r?.reviewer.name}&nbsp;
                                    </g:if>
                                </g:each>
  							
							</td>
                            <td align="center">
                            ${dataEntryInstance.owner}
                            </td>
							<td align="center">

                                <g:each in="${dataEntryInstance.reviews}" var="r">
                                  <g:if test="${r?.status=='Needs More Info'}">
                               	  
                               	  	[<modalbox:createLink controller="reviewQuestions" action="assign_needs_more_info" id="${r.id}" title="Re-Assign" width="600">Re-Assign</modalbox:createLink>]
                               	  
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

        </div>
    </body>
</html>
