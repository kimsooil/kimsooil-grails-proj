
<%@ page import="braintumorpathologyreview.DataEntry" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dataEntry.label', default: 'DataEntry')}" />
        <title>Show details of the case</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/dataEntry/firstpage')}">Home</a></span>
            <g:if test="${session.user.role=='admin' }">
            <span class="menuButton"><g:link class="list" action="list">List all cases</g:link></span>
            <span class="menuButton"><g:link class="create" action="create_dataEntry_and_caseDetails">Add new case</g:link></span>
            </g:if>
        </div>
        <div class="body">
            <h1>Show details of the case</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    <tr><td><table>
                        <tr class="prop">
                            <td valign="top" class="name">Study ID</td>
                            
                            <td valign="top" class="value">${dataEntryInstance.studyid}</td>
                            
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">Case Status</td>
                            
                            <td valign="top" class="value">${fieldValue(bean: dataEntryInstance, field: "casestatus")}</td>
                            
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">Owner</td>
                            
                            <td valign="top" class="value">${fieldValue(bean: dataEntryInstance, field: "owner")}</td>
                            
                        </tr>
                        </table></td></tr>

                    <tr><td>
                    <table>
                    <thead>
                    <tr>
                    	<th>surgeryDate</th>
	                    <th>surgeryType</th>
	                    <th>reviewType</th>
	                    <th>SurgPathNum</th>
	                    <th>Diagnosis</th>
	                    <th>Site</th>
	                    <th>ReportUrl</th>
	                </tr>
	                </thead>
	                <tbody>
	                <%def i=0%>
					<g:while test="${i < 6}">
    				<%i++%>

	                
                    <tr>
	                    <td>${caseDetailsInstance.('surgeryDate'+i) }</td>
	                    <td>${caseDetailsInstance.('surgeryType'+i) }</td>
	                    <td>${caseDetailsInstance.('reviewType'+i) }</td>
	                    <td>${caseDetailsInstance.('SurgPathNum'+i) }</td>
	                    <td>${caseDetailsInstance.('Diagnosis'+i) }</td>
	                    <td>${caseDetailsInstance.('Site'+i) }</td>
	                    <td>${caseDetailsInstance.('ReportUrl'+i) }</td>
	                </tr>
	                </g:while>
	                
	                </tbody>
                    </table>
<%--                    
                    <table>
                        <tr class="prop">
                            <td valign="top" class="name">Pathology report (PDF)</td>
                            
                            <td valign="top" class="value">
                            <g:if test="${dataEntryInstance.filename_pathreport==null}"><img src="${resource(dir:'images/skin',file:'exclamation.png')}"/></g:if>
                            <g:else><img src="${resource(dir:'images',file:'File_icon.png')}"/></g:else>                            
                            <a href="${resource(dir:'files/'+session.user.login+'/'+dataEntryInstance.studyid+'/path', file:''+dataEntryInstance.filename_pathreport)}">${fieldValue(bean: dataEntryInstance, field: "filename_pathreport")}</a>
                            </td>
                            
                        </tr>
                    
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dataEntry.surgerytype.label" default="Surgerytype" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: dataEntryInstance, field: "surgerytype")}</td>
                            
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">Surgical Center</td>
                            
                            <td valign="top" class="value">${fieldValue(bean: dataEntryInstance, field: "surgical_center")}</td>
                            
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">Pathology Summary</td>
                            
                            <td valign="top" class="value">${fieldValue(bean: dataEntryInstance, field: "pathology_summary")}</td>
                            
                        </tr>
                        </table>
 --%>                        
                        </td></tr>
                        <tr><td>
                        <table>
                        <thead>
                        <tr>
                        	<th>MRIDate</th>
                        	<th>MRISummary</th>
                        	<th>MRIReport</th>                     	
                        </tr>
                        </thead>
                        <tbody>
	                <%i=0%>
					<g:while test="${i < 2}">
    				<%i++%>                        
                        <tr>
                        	<td>${caseDetailsInstance.('MRIDate'+i) }</td>
                        	<td>${caseDetailsInstance.('MRISummary'+i) }</td>
                        	<td>${caseDetailsInstance.('MRIReport'+i) }</td>
                        </tr>
	                </g:while>
	                                        
                        </tbody>
                        </table>
<%--                        
                        <table>
                        <tr class="prop">
                            <td valign="top" class="name">MRI report (PDF)</td>
                            
                            <td valign="top" class="value">
                            <g:if test="${dataEntryInstance.filename_mrireport==null}"><img src="${resource(dir:'images/skin',file:'exclamation.png')}"/></g:if>
                            <g:else><img src="${resource(dir:'images',file:'File_icon.png')}"/></g:else>                            
                            <a href="${resource(dir:'files/'+session.user.login+'/'+dataEntryInstance.studyid+'/mri', file:''+dataEntryInstance.filename_mrireport)}">${fieldValue(bean: dataEntryInstance, field: "filename_mrireport")}</a>
                            </td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name">MRI Summary</td>
                            
                            <td valign="top" class="value">${fieldValue(bean: dataEntryInstance, field: "mri_summary")}</td>
                            
                        </tr>
                        </table>
 --%>                        
                        </td></tr>
                        <tr><td>
                        <table>
                        <thead>
                        <tr>
                        	<th>SurgType</th>
                        	<th>StainType</th>
                        	<th>Status</th>
                        </tr>
                        </thead>
                        <tbody>
		                <%i=0%>
						<g:while test="${i < 6}">
	    				<%i++%>                        
                        
                        <tr>
                        	<td>${caseDetailsInstance.('SurgType'+i) }</td>
                        	<td>${caseDetailsInstance.('StainType'+i) }</td>
                        	<td>${caseDetailsInstance.('Status'+i) }</td>
                        </tr>
                        </g:while>
                        </tbody>
                        </table>
                     
<%--                        
                        <table>

                        <tr class="prop">
                            <td valign="top" class="name">Image location (for ImageScope)</td>
                            
                            <td valign="top" class="value">
                            	<g:if test="${dataEntryInstance.imagelocation!=null}">
	                            	[<g:link action="open_imagescope_sis_file" id="${dataEntryInstance.imageid}" params="[imagelocation:dataEntryInstance.imagelocation]">Open ImageScope</g:link>]
	                            </g:if>
	                            <g:else><img src="${resource(dir:'images/skin',file:'exclamation.png')}"/></g:else>
                            </td>
                            
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">Image ID(for WebScope)</td>
                            
                            <td valign="top" class="value">
                            	<g:if test="${dataEntryInstance.imageid!=null}">
	                            	[<a target=_webscope href="http://10.6.20.46/imageserver/@${dataEntryInstance.imageid}/view.apml">Open WebScope</a>]
	                            </g:if>
	                            <g:else><img src="${resource(dir:'images/skin',file:'exclamation.png')}"/></g:else>
	                        </td>
                            
                        </tr>                                            
        
                        <tr class="prop">
                            <td valign="top" class="name">Images (Link to ImageScope server)</td>
                            
                            <td valign="top" class="value">
	                            <g:if test="${dataEntryInstance.filename_images==null}">
	                            	<img src="${resource(dir:'images/skin',file:'exclamation.png')}"/></g:if>
	                            <g:else>
	                            	<img src="${resource(dir:'images',file:'File_icon.png')}"/></g:else>
	                            <a href="${resource(dir:'files/'+session.user.login+'/'+dataEntryInstance.studyid+'/images', file:''+dataEntryInstance.filename_images)}">${fieldValue(bean: dataEntryInstance, field: 'filename_images')}</a>
  
	                            
                            </td>
                            
                        </tr>
                    </table>
 --%>                    
                    </td></tr>                        
                        <tr><td><table>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dataEntry.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${dataEntryInstance?.dateCreated}" /></td>
                            
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">Last Updated</td>
                            
                            <td valign="top" class="value"><g:formatDate date="${dataEntryInstance?.lastUpdated}" /></td>
                            
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">Track logs</td>
                            
                            <td valign="top" class="value">
		                        <g:if test="${dataEntryInstance?.track_logs}">
		                        <%
									dataEntryInstance.track_logs.split("-").each{log->
										if (log!="null") out << "${log}<br/>"
								 %>
								 <% } %>
								 </g:if>                            
							</td>
                            
                        </tr>                                              
                        <tr class="prop">
                            <td valign="top" class="name">Review(s) Status</td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ol>
                                <g:each in="${dataEntryInstance.reviews}" var="r">

                                	<g:if test="${session.user.role=='admin' || session.user.login==r.reviewer.login}">
                                	  <li>
                                	  	(${r?.status})
                                	  	 
	                                    <g:link controller="reviewQuestions" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link>
 	                                    
		                                    <g:if test="${r.reviewer.login=='admin'}">
		                                     	[<g:link controller="reviewQuestions" action="assign" id="${r.id}">Assign</g:link>]
		                                     </g:if>
	                                     
		                                     
		                              </li>
                               	
		                                </div>
                                    </g:if>
                                </g:each>
                                </ol><br/>
                                
							<g:if test="${dataEntryInstance.reviews}">
								<!--  if exists, do nothing -->
							</g:if>
							<g:else>
								[<g:link action="create_review" id="${params.id}" params="[studyid:dataEntryInstance.studyid]">create review</g:link>]
							</g:else>							
                                
                            </td>
                            
                        </tr>
                        </table></td></tr>

                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${dataEntryInstance?.id}" />
                    <g:if test="${session.user.role=='admin' }">
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    </g:if>
                </g:form>
            </div>
        </div>
    </body>
</html>
