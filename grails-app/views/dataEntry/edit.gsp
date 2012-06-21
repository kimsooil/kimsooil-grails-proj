
<%@ page import="braintumorpathologyreview.DataEntry" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dataEntry.label', default: 'DataEntry')}" />
        <title>Edit case</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Return to Main-first</a></span>
            <span class="menuButton"><g:link class="list" action="list">List all cases</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">Add new case</g:link></span>
        </div>
        <div class="body">
            <h1>Edit case</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${dataEntryInstance}">
            <div class="errors">
                <g:renderErrors bean="${dataEntryInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:uploadForm method="post" >
                <g:hiddenField name="id" value="${dataEntryInstance?.id}" />
                <g:hiddenField name="version" value="${dataEntryInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="studyid"><g:message code="dataEntry.studyid.label" default="Studyid" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dataEntryInstance, field: 'studyid', 'errors')}">
                                    <g:textField name="studyid" value="${dataEntryInstance?.studyid}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="casestatus">Status</label>
                                </td>
                                <td valign="top">
								Status will be updated automatically according to reviewer's activities
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="imageid">image ID</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dataEntryInstance, field: 'imageid', 'errors')}">
                                    <g:textField name="imageid" value="${dataEntryInstance?.imageid}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="imageid">image location</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dataEntryInstance, field: 'imagelocation', 'errors')}">
                                    <g:textField name="imagelocation" value="${dataEntryInstance?.imagelocation}" />
                                </td>
                            </tr>   
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="filename_images"><g:message code="dataEntry.filename_images.label" default="Filenameimages" /></label>
                                </td>
                                <!-- 
                                <td valign="top" class="value ${hasErrors(bean: dataEntryInstance, field: 'filename_images', 'errors')}">
                                    <g:textField name="filename_images" value="${dataEntryInstance?.filename_images}" />
                                </td>
                                -->
                                <td valign="top">
      								<input type="file" id="payload" name="payload" value="${dataEntryInstance?.filename_images}"/> ${dataEntryInstance?.filename_images}
    							</td>
                                
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="filename_pathreport"><g:message code="dataEntry.filename_pathreport.label" default="Filenamepathreport" /></label>
                                </td>
                                <!-- 
                                <td valign="top" class="value ${hasErrors(bean: dataEntryInstance, field: 'filename_pathreport', 'errors')}">
                                    <g:textField name="filename_pathreport" value="${dataEntryInstance?.filename_pathreport}" />
                                </td>
                                 -->
                                <td valign="top">
      								<input type="file" id="payload2" name="payload2"/> ${dataEntryInstance?.filename_pathreport}
    							</td>

                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="surgerytype"><g:message code="dataEntry.surgerytype.label" default="Surgerytype" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dataEntryInstance, field: 'surgerytype', 'errors')}">
                                    <!-- <g:textField name="surgerytype" value="${dataEntryInstance?.surgerytype}" />-->
                                    <g:select id="surgerytype" name="surgerytype" from="${['Biopsy', 'Resection', '2nd resection', '3rd resection', 'n/a']}" value="${dataEntryInstance?.surgerytype}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="surgical_center">Surgical Center</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dataEntryInstance, field: 'surgical_center', 'errors')}">
                                    <g:textField name="surgical_center" value="${dataEntryInstance?.surgical_center}" />
                                </td>
                            </tr>   
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="pathology_summary">Pathology Summary</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dataEntryInstance, field: 'pathology_summary', 'errors')}">
                                    <!-- <g:textField name="pathology_summary" value="${dataEntryInstance?.pathology_summary}" /> -->
                                    <g:textArea name="pathology_summary" value="${dataEntryInstance?.pathology_summary}" />
                                </td>
                            </tr>   
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="filename_mrireport"><g:message code="dataEntry.filename_mrireport.label" default="Filenamemrireport" /></label>
                                </td>
                                <!-- 
                                <td valign="top" class="value ${hasErrors(bean: dataEntryInstance, field: 'filename_mrireport', 'errors')}">
                                    <g:textField name="filename_mrireport" value="${dataEntryInstance?.filename_mrireport}" /> 
                                </td>
                                 -->
                                <td valign="top">
      								<input type="file" id="payload3" name="payload3"/> ${dataEntryInstance?.filename_mrireport}
    							</td>
                                 
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="mri_summary">MRI Summary</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dataEntryInstance, field: 'mri_summary', 'errors')}">
                                    <g:textArea name="mri_summary" value="${dataEntryInstance?.mri_summary}" />
                                </td>
                            </tr>   
                        
                        
<!--                         
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dateCreated"><g:message code="dataEntry.dateCreated.label" default="Date Created" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dataEntryInstance, field: 'dateCreated', 'errors')}">
                                    <g:datePicker name="dateCreated" precision="day" value="${dataEntryInstance?.dateCreated}"  />
                                </td>
                            </tr>
-->
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="reviews">Reviews</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dataEntryInstance, field: 'reviews', 'errors')}">
                                <ul>
                                <g:each in="${dataEntryInstance.reviews}" var="r">
                                    <li><g:link controller="reviewQuestions" action="showreviewdetails" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>                            
                                </td>
                            </tr>            
                        </tbody>
                    </table>
                    
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:uploadForm>
        </div>
    </body>
</html>
