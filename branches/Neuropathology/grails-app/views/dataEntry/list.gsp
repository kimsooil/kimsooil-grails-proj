
<%@ page import="braintumorpathologyreview.DataEntry" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dataEntry.label', default: 'DataEntry')}" />
        <title>All cases</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create_dataEntry_and_caseDetails">Add New Case</g:link></span>
        </div>
        <div class="body">
            <h1>All cases</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">

                <table>
                    <thead>
                        <tr>
                        
                            <%-- <g:sortableColumn property="id" title="${message(code: 'dataEntry.id.label', default: 'Id')}" /> --%>
                        
                            <g:sortableColumn property="studyid" title="${message(code: 'dataEntry.studyid.label', default: 'Studyid')}" />

                            <g:sortableColumn property="casestatus" title="Case Status" />
                            
                            <g:sortableColumn property="owner" title="Owner"/>  

                            <g:sortableColumn property="dateCreated" title="Date Created" />
                            
                            <g:sortableColumn property="lastUpdated" title="Last Updated" />
                        
 <%--                           <g:sortableColumn property="surgerytype" title="${message(code: 'dataEntry.surgerytype.label', default: 'surgery type')}" />
                            
                            <g:sortableColumn property="owner" title="${message(code: 'dataEntry.owner.label', default: 'Owner/Assigned to')}" />
                        
                            <g:sortableColumn property="filename_images" title="${message(code: 'dataEntry.filename_images.label', default: 'Filenameimages')}" />
                        
                            <g:sortableColumn property="filename_pathreport" title="${message(code: 'dataEntry.filename_pathreport.label', default: 'Filenamepathreport')}" />
                        
                            <g:sortableColumn property="filename_mrireport" title="${message(code: 'dataEntry.filename_mrireport.label', default: 'Filenamemrireport')}" />
--%>
                       
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${dataEntryInstanceList}" status="i" var="dataEntryInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <%-- <td><g:link action="show" id="${dataEntryInstance.id}">${fieldValue(bean: dataEntryInstance, field: "id")}</g:link></td> --%>
                        	<%
							def caseDetailsInstance = braintumorpathologyreview.CaseDetails.findByStudyid(dataEntryInstance.studyid)
							 %>
                            <td align="center"><font color="blue"><g:link action="show_dataEntry_and_caseDetails" id="${caseDetailsInstance.id}">${fieldValue(bean: dataEntryInstance, field: "studyid")}</g:link></font></td>

                            <td align="center">${dataEntryInstance.casestatus}
<%--                             
                                <ul>
                                <g:each in="${dataEntryInstance.reviews}" var="r">
                                <g:if test="${r?.status==filter || filter==null|| filter=='all'}">
                                	<g:if test="${r?.status=='Unassigned'}"><div style="color:orange"></g:if>
                                	<g:if test="${r?.status=='New Assignment'}"><div style="color:green"></g:if>
                                	<g:if test="${r?.status=='In Progress'}"><div style="color:blue"></g:if>
                                	<g:if test="${r?.status=='Re-review'}"><div style="color:brown"></g:if>
                                	<g:if test="${r?.status=='Complete'}"><div style="color:black"></g:if>
                                	<g:if test="${r?.status=='Incomplete'}"><div style="color:red"></g:if>
                                    <li>${r?.status}</li>
                                    </div>
                                </g:if>
                                </g:each>
                                </ul>        
 --%>
							</td>
                            <td align="center">${dataEntryInstance.owner}
<%--                             
                                <ul>
                                <g:each in="${dataEntryInstance.reviews}" var="r">
                                    <g:if test="${r?.reviewer.name=='Administrator'}">
                                    </g:if>
                                    <g:else>
                                    <li>${r?.reviewer.name}
		                                    <g:if test="${r.reviewer.login!='admin'}">
		                                     	[<g:link controller="reviewQuestions" action="sendEmail" id="${r.id}">Notify</g:link>]
		                                     </g:if>                                    
                                    </li>
                                    </g:else>
                                </g:each>
                                </ul>                            
 --%>
                            </td>							
                            <td align="center"><g:formatDate format="yyyy-MM-dd HH:mm" date="${dataEntryInstance.dateCreated}" /></td>
                           
							<td align="center"><g:formatDate format="yyyy-MM-dd HH:mm" date="${dataEntryInstance.lastUpdated}" /></td>
							
                            <%-- 
                        
                            <td>${fieldValue(bean: dataEntryInstance, field: "filename_images")}</td>
                        
                            <td>${fieldValue(bean: dataEntryInstance, field: "filename_pathreport")}</td>
                        
                            <td>${fieldValue(bean: dataEntryInstance, field: "filename_mrireport")}</td>
                         --%>
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
