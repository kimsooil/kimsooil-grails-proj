
<%@ page import="braintumorpathologyreview.DataEntry" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dataEntry.label', default: 'DataEntry')}" />
        <title>Neuropathology Review - 
        <g:if test="${listing=='not-completed'}">Listing of New Assignments / In Progress</g:if>
        <g:if test="${listing=='completed'}">Complete</g:if>
        </title>
        <META HTTP-EQUIV="refresh" CONTENT="300">

    </head>
    <body>

	        <div class="nav">
		        <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
<!-- 
		            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
		             <span class="menuButton"><g:link class="list" action="list">List All Cases</g:link></span>
 -->
		        </div>
		        <div class="body">
				<h1>
				        <g:if test="${listing=='not-completed'}">New Assignments / In Progress</g:if>
        				<g:if test="${listing=='completed'}">Complete</g:if>
				</h1>
 		            <g:if test="${flash.message}">
			            <div class="message">${flash.message}</div>
		            </g:if>
		            <table>
			            <tbody>
			            <g:if test="${listing=='not-completed'}">
			            	<tr><td valign="top">
			            		<table>
			            		<thead><tr>
				            		<g:sortableColumn property="studyid" title="Study ID" params="[listing:'not-completed']"/>
				            		<g:sortableColumn property="dateAssigned" title="Date Assigned" params="[listing:'not-completed']"/>
				            		<g:sortableColumn property="status" title="Status" params="[listing:'not-completed']"/>
			            		</tr>
			            		</thead>
	                            <tbody>
	                            <g:each in="${reviews_assigned}" var="r">
	                            	<%--<g:if test="${r.status=='New Assignment' || r.status=='In Progress' || r.status=='Needs More Info'}"> --%>
	                            	<g:if test="${r.status=='New Assignment' || r.status=='In Progress'}">
		                              	<tr>
		                              	<td align="center">
		                              		<%--<g:link controller="reviewQuestions" action="show" id="${r.id}">${r.studyid}</g:link> --%>
		                              		<g:link controller="reviewQuestions" action="edit" id="${r.id}">${r.studyid}</g:link>
		                              	</td>
		                              	<td align="center">
		                              		<g:formatDate format="MM/dd/yyyy" date="${r.dateAssigned}"/>
		                              	</td>
		                              	<td align="center">
		                              		${r.status}
		                              	</td>
		                              	</tr>
	                              	</g:if>
	                            </g:each>
	                            </tbody></table>
	                        </td></tr>
	                     </g:if>
	                     <g:if test="${listing=='completed'}">
			            	<tr><td valign="top">
			            		<table>
			            		<thead><tr>
				            		<g:sortableColumn property="GradingSubClassification" title="Diagonsis" params="[listing:'completed']"/>
				            		<g:sortableColumn property="studyid" title="Study ID" params="[listing:'completed']"/>
				            		<g:sortableColumn property="lastUpdated" title="Review Date" params="[listing:'completed']"/>
				            		<g:sortableColumn property="status" title="Status" params="[listing:'completed']"/>
			            		</tr></thead>
	                            <tbody>
	                            <g:each in="${reviews_assigned}" var="r">
	                            	<g:if test="${r.status=='Complete' || r.status=='Re-review'}">
		                              	<tr>
		                              	<td align="center">
		                              		${r.GradingSubClassification} : ${GSC.get(r.gradingSubClassification) }
		                              	</td>
		                              	<td align="center">
		                              		<g:link controller="reviewQuestions" action="show" id="${r.id}">${r.studyid}</g:link>
		                              	</td>
		                              	<td align="center">
		                              		<g:formatDate format="yyyy-MM-dd HH:mm" date="${r.dateCompleted}"/>
		                              	</td>
		                              	<td align="center">
		                              		<!-- ${r.status}  -->
		                              		Completed
		                              	</td>
		                              	</tr>
	                              	</g:if>
	                            </g:each>
	                            </tbody></table>
	                        </td></tr>
	                     </g:if>
	                    </tbody>
                    </table>


		        </div>

    </body>
</html>
