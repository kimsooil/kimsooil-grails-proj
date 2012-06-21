
<%@ page import="braintumorpathologyreview.ReviewQuestions" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'reviewQuestions.label', default: 'ReviewQuestions')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
        <gui:resources components="expandablePanel" />
    </head>
    <body>  
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/dataEntry/firstpage')}">Main-first</a></span>
<g:if test="${session.user.role=='admin' }">
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
</g:if>            
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="yui-skin-sam">

            <div class="dialog">
	
                <table>
                    <tbody>
					
                    <!-- 
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reviewQuestions.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: reviewQuestionsInstance, field: "id")}</td>
                            
                        </tr>
                     -->
                     
                        <tr><td valign="top"><table>
                        <tr class="prop">
                            <td valign="top" class="name">studyid</td>
                            
                            <!-- <td valign="top" class="value">${fieldValue(bean: reviewQuestionsInstance, field: "studyid")}</td> -->
                            <td><g:link controller="dataEntry" action="showcasedetails" id="${reviewQuestionsInstance.studyid}">${fieldValue(bean: reviewQuestionsInstance, field: "studyid")}</g:link></td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">Image location</td>
                            
                            <td valign="top" class="value">
                            	<g:if test="${dataEntryInstance.imagelocation!=null}">
	                            	[<g:link controller="dataEntry" action="open_imagescope_sis_file" params="[imagelocation:dataEntryInstance.imagelocation]">Open ImageScope</g:link>]
	                            </g:if>
                            </td>
                            
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">Image ID</td>
                            
                            <td valign="top" class="value">
                            	<g:if test="${dataEntryInstance.imageid!=null}">
	                            	[<a target=_webscope href="http://10.6.20.46/imageserver/@${dataEntryInstance.imageid}/view.apml">Open WebScope</a>]
	                            </g:if>
	                        </td>
                            
                        </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="file1">File/Link to image</label>
                                </td>
                                <td valign="top">
		                            <g:if test="${dataEntryInstance.filename_images==null}"><img src="${resource(dir:'images/skin',file:'exclamation.png')}"/></g:if>
		                            <g:else><img src="${resource(dir:'images',file:'File_icon.png')}"/></g:else>                            
		                            <a href="${createLinkTo(dir:'files/'+'admin'+'/'+dataEntryInstance.studyid+'/images', file:''+dataEntryInstance.filename_images)}">${fieldValue(bean: dataEntryInstance, field: "filename_images")}</a>
                                </td>
                            </tr>                        
                        <tr class="prop">
                            <td valign="top" class="name">Pathology report (PDF)</td>
                            
                            <td valign="top" class="value">
                            <g:if test="${dataEntryInstance.filename_pathreport==null}"><img src="${resource(dir:'images/skin',file:'exclamation.png')}"/></g:if>
                            <g:else><img src="${resource(dir:'images',file:'File_icon.png')}"/></g:else>                            
                            <a href="${createLinkTo(dir:'files/'+session.user.login+'/'+dataEntryInstance.studyid+'/path', file:''+dataEntryInstance.filename_pathreport)}">${fieldValue(bean: dataEntryInstance, field: "filename_pathreport")}</a>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">MRI report (PDF)</td>
                            
                            <td valign="top" class="value">
                            <g:if test="${dataEntryInstance.filename_mrireport==null}"><img src="${resource(dir:'images/skin',file:'exclamation.png')}"/></g:if>
                            <g:else><img src="${resource(dir:'images',file:'File_icon.png')}"/></g:else>                            
                            <a href="${createLinkTo(dir:'files/'+session.user.login+'/'+dataEntryInstance.studyid+'/mri', file:''+dataEntryInstance.filename_mrireport)}">${fieldValue(bean: dataEntryInstance, field: "filename_mrireport")}</a>
                            </td>
                            
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">status</td>
                            
                            <!-- <td valign="top" class="value">${fieldValue(bean: reviewQuestionsInstance, field: "status")}</td> -->
                            <td>${fieldValue(bean: reviewQuestionsInstance, field: "status")}</td>
                        </tr>                        
<g:if test="${session.user.role=='admin' }">
                        <tr class="prop">
                            <td valign="top" class="name">reviewer</td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${reviewQuestionsInstance.reviewer.id}">${reviewQuestionsInstance.reviewer.encodeAsHTML()}</g:link></td>
                            
                        </tr>
</g:if>
						</tbody></table></td>
						
                        <td><table><tbody>                 
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reviewQuestions.astrocyticPhenotype.label" default="Astrocytic Phenotype" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${reviewQuestionsInstance?.astrocyticPhenotype}" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reviewQuestions.oligodendroglialPhenotype.label" default="Oligodendroglial Phenotype" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${reviewQuestionsInstance?.oligodendroglialPhenotype}" /></td>
                            
                        </tr>                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reviewQuestions.mitoses.label" default="Mitoses" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${reviewQuestionsInstance?.mitoses}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reviewQuestions.necrosis.label" default="Necrosis" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${reviewQuestionsInstance?.necrosis}" /></td>
                            
                        </tr>
                                                                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reviewQuestions.pseudopalisadingNecrosis.label" default="Pseudopalisading Necrosis" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${reviewQuestionsInstance?.pseudopalisadingNecrosis}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reviewQuestions.invasion.label" default="Invasion" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${reviewQuestionsInstance?.invasion}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reviewQuestions.perivascularInflammation.label" default="Perivascular Inflammation" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${reviewQuestionsInstance?.perivascularInflammation}" /></td>
                            
                        </tr>
                    
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reviewQuestions.vascularProliferation.label" default="Vascular Proliferation" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${reviewQuestionsInstance?.vascularProliferation}" /></td>
                            
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reviewQuestions.VPscale.label" default="VP scale" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: reviewQuestionsInstance, field: "VPscale")}</td>
                            
                        </tr>                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reviewQuestions.rosenthalFibers.label" default="Rosenthal Fibers" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${reviewQuestionsInstance?.rosenthalFibers}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reviewQuestions.EGBS.label" default="EGBS" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${reviewQuestionsInstance?.EGBS}" /></td>
                            
                        </tr>
                                                                
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reviewQuestions.mini_gemistocytesPresent.label" default="Minigemistocytes Present" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${reviewQuestionsInstance?.mini_gemistocytesPresent}" /></td>
                            
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reviewQuestions.artifactPresentOrBadSection.label" default="Artifact Present Or Bad Section" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${reviewQuestionsInstance?.artifactPresentOrBadSection}" /></td>
                            
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reviewQuestions.gradingSubClassification.label" default="Grading Sub Classification" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: reviewQuestionsInstance, field: "gradingSubClassification")}</td>
                            
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reviewQuestions.gemistocytic.label" default="Gemistocytic" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${reviewQuestionsInstance?.gemistocytic}" /></td>
                            
                        </tr>                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reviewQuestions.predominantSubtype.label" default="Predominant Subtype" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: reviewQuestionsInstance, field: "predominantSubtype")}</td>
                            
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reviewQuestions.possibleSubClassification.label" default="Possible Sub Classification" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: reviewQuestionsInstance, field: "possibleSubClassification")}</td>
                            
                        </tr>
                    
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reviewQuestions.levelOfDiagnosticCertainty.label" default="Level Of Diagnostic Certainty" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: reviewQuestionsInstance, field: "levelOfDiagnosticCertainty")}</td>
                            
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reviewQuestions.notes.label" default="Notes" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: reviewQuestionsInstance, field: "notes")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reviewQuestions.complete.label" default="Complete" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${reviewQuestionsInstance?.complete}" /></td>
                            
                        </tr></tbody>
             			</table></td></tr>
                    </tbody>
                </table>
            </div>
 
</div>    
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${reviewQuestionsInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <g:if test="${session.user.role=='admin' }">
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    </g:if>
                </g:form>
            </div>
        </div>
    </body>
</html>
