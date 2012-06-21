
<%@ page import="braintumorpathologyreview.DataEntry" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dataEntry.label', default: 'DataEntry')}" />
        <title>Completed / Re-review needed</title>
		<g:javascript library="application" />
		<modalbox:modalIncludes />        
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
        </div>
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">

<h1>'Re-review' needed</h1>                
                <table>
                    <thead>
                        <tr>
                            <g:sortableColumn property="studyid" title="Study ID"/>
                            <th>reviewer#1</th>
                            <th>Dx</th>
                            <th>Certainty</th>
                            <th>Assigned to</th>
                            <th>Function(s)</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${rq_rereview}" status="i" var="reviewQuestionsInstance">
                        <tr>
                        	<td align="center">
                        		<g:link controller="reviewQuestions" action="show" id="${reviewQuestionsInstance.id }">${fieldValue(bean: reviewQuestionsInstance, field: "studyid")}</g:link>
                        	</td>
                            <td align="center">
                            	${reviewQuestionsInstance.reviewer.encodeAsHTML()}
                            </td>
                            <td align="center">
                            	${fieldValue(bean: reviewQuestionsInstance, field: "gradingSubClassification")} : ${GSC.get(reviewQuestionsInstance.gradingSubClassification) }
                            </td>
                            <td align="center">
                            	${fieldValue(bean: reviewQuestionsInstance, field: "levelOfDiagnosticCertainty")}
                            </td>
                            <td align="center">
                            	-Admin-
                            </td>
                            <td align="center">
	                            <g:if test="${DataEntry.findByStudyid(reviewQuestionsInstance.studyid).reviews.size()==1}">
	                                <modalbox:createLink controller="reviewQuestions"  action="assign_rereview" title="Re-Assign" width="500" id="${reviewQuestionsInstance.id}">Re-Assign</modalbox:createLink>
	                            </g:if>
	                            <g:else>Assigned to 2nd Reviewer</g:else>							
							</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
<br/><br/>
<h1>Completed Assignments</h1>
                <table>
                    <thead>
                        <tr>
                            <g:sortableColumn property="studyid" title="Study ID"/>
                            <th>reviewer #1</th>
                            <th>Dx #1</th>
                            <th>reviewer #2</th>
                            <th>Dx #2</th>                            
                        </tr>
                    </thead>
                   <tbody>
                   <%
				   def sorted_dataEntryInstanceList=dataEntryInstanceList.sort{dateUpdated}
				    %>
                    <g:each in="${sorted_dataEntryInstanceList}" var="dataEntryInstance">
	                    <g:each in="${dataEntryInstance.reviews}" status="i" var="r">
	                    <g:if test="${r?.status=='Complete'}">
	                    	<%
								def caseDetailsInstance = braintumorpathologyreview.CaseDetails.findByStudyid(dataEntryInstance.studyid)
							 %>
							<g:if test="${i==0}">
								<tr>
		                    		<td align="center"><g:link action="show_dataEntry_and_caseDetails" id="${caseDetailsInstance.id}">${dataEntryInstance.studyid}</g:link></td>
		                    </g:if>
		                    	<td align="center">${r.reviewer.name }</td>
		                    	<td align="center"><g:link controller="reviewQuestions" action="show" id="${r.id}">${r.gradingSubClassification } : ${GSC.get(r.gradingSubClassification) }</g:link></td>
		                    <g:if test="${dataEntryInstance.reviews.size()==1}">
		                    	<td>&nbsp;</td><td>&nbsp;</td>
		                    </g:if>                    	
		                    <g:if test="${(dataEntryInstance.reviews.size()-1)==i }">	
		                    	</tr>
		                    </g:if>
	                    </g:if>
	                    </g:each>
                    </g:each>
                    </tbody>
                     
                </table>
            </div>
        </div>
    </body>
</html>
