
<%@ page import="braintumorpathologyreview.ReviewQuestions" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <g:set var="entityName" value="${message(code: 'reviewQuestions.label', default: 'ReviewQuestions')}" />
        <title>Complete Review Questions</title>
         <g:javascript library="prototype" />
<g:javascript library="application" />
<modalbox:modalIncludes />           

    </head>
    <body>
        <div class="body">
            <h1>Form - please complete or request more info</h1>
            
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${reviewQuestionsInstance}">
            <div class="errors">
                <g:renderErrors bean="${reviewQuestionsInstance}" as="list" />
            </div>
            </g:hasErrors>

                <div class="dialog">
                <g:form method="post" >
                  <g:hiddenField name="id" value="${reviewQuestionsInstance?.id}" />
                  <g:hiddenField name="version" value="${reviewQuestionsInstance?.version}" />

                  <table>
				  <tr>                    
                    <td>
						
                    	<table id="one-column-emphasis">
                    	<caption style="color:blue">&nbsp;&nbsp;Neuropathology Review</caption>
                    	<tr>
                    	<td valign="top">
                    	    <table>                                                                                                     
                    	    <colgroup>
                    	    	<col class="oce-first" />
                    	    </colgroup>                                                                                                     
                            <tr>
                                <td valign="top" class="name">
                                  <label for="astrocyticPhenotype"><g:message code="reviewQuestions.astrocyticPhenotype.label" default="Astrocytic Phenotype" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'astrocyticPhenotype', 'errors')}">
                                    <g:checkBox name="astrocyticPhenotype" value="${reviewQuestionsInstance?.astrocyticPhenotype}" />
                                </td>
                            </tr>
                         
                            <tr>
                                <td valign="top" class="name">
                                  <label for="oligodendroglialPhenotype"><g:message code="reviewQuestions.oligodendroglialPhenotype.label" default="Oligodendroglial Phenotype" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'oligodendroglialPhenotype', 'errors')}">
                                    <g:checkBox name="oligodendroglialPhenotype" value="${reviewQuestionsInstance?.oligodendroglialPhenotype}" />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top" class="name">
                                  <label for="mitoses"><g:message code="reviewQuestions.mitoses.label" default="Mitoses" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'mitoses', 'errors')}">
                                    <g:checkBox name="mitoses" value="${reviewQuestionsInstance?.mitoses}" />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top" class="name">
                                  <label for="necrosis"><g:message code="reviewQuestions.necrosis.label" default="Necrosis" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'Necrosis', 'errors')}">
                                    
                                    <g:checkBox id="necrosis" name="necrosis" value="${reviewQuestionsInstance?.necrosis}" onclick="toggleNecrosis()"/>
                                    <span id="necrosisDiv">
                                    	<g:if test="document.getElementById('necrosis').checked">
                                    	&nbsp;&nbsp;&nbsp;<label style="color:red">Specify:</label> <g:select disabled="${reviewQuestionsInstance?.necrosis ? '':'true' }" id="NecrosisScale" name="NecrosisScale" from="${VPscale}" value="${reviewQuestionsInstance?.NecrosisScale}"  noSelection="${['null':'Select One...']}"/>
                                    	</g:if>
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top" class="name">
                                  <label for="pseudopalisadingNecrosis">Pseudopalisading Necrosis</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'pseudopalisadingNecrosis', 'errors')}">
                                    <g:checkBox name="pseudopalisadingNecrosis" value="${reviewQuestionsInstance?.pseudopalisadingNecrosis}" />
                                </td>
                            </tr>                        
                        
                            <tr>
                                <td valign="top" class="name">
                                  <label for="invasion"><g:message code="reviewQuestions.invasion.label" default="Invasion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'invasion', 'errors')}">
                                    <g:checkBox name="invasion" value="${reviewQuestionsInstance?.invasion}" />
                                </td>
                            </tr>
                        
                            <tr>
                                <td valign="top" class="name">
                                  <label for="perivascularInflammation"><g:message code="reviewQuestions.perivascularInflammation.label" default="Perivascular Inflammation" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'perivascularInflammation', 'errors')}">
                                    <g:checkBox name="perivascularInflammation" value="${reviewQuestionsInstance?.perivascularInflammation}" />
                                </td>
                            </tr>
                           </table>
                           </td>

                            <td valign="top">
                            <table>
                    	    <colgroup>
                    	    	<col class="oce-first" />
                    	    </colgroup>                                                                                                     
                            <tr>
                                <td valign="top" class="name">
                                  <label for="vascularProliferation"><g:message code="reviewQuestions.vascularProliferation.label" default="Vascular Proliferation" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'vascularProliferation', 'errors')}">
                                    <g:checkBox id="vascularProliferation" name="vascularProliferation" value="${reviewQuestionsInstance?.vascularProliferation}" onclick="toggleVP()"/>
                                    <span id="VPscaleDiv">
                                    	<g:if test="document.getElementById('vascularProliferation').checked">
                                    	&nbsp;&nbsp;&nbsp;<label style="color:red">Specify:</label> <g:select disabled="${reviewQuestionsInstance?.vascularProliferation ? '':'true' }" id="VPscale" name="VPscale" from="${VPscale}" value="${reviewQuestionsInstance?.VPscale}"  noSelection="${['null':'Select One...']}"/>
                                    	</g:if>
                                    </span>
                                    
                                </td>
                            </tr>
                            <tr>
                                <td valign="top" class="name">
                                  <label for="rosenthalFibers"><g:message code="reviewQuestions.rosenthalFibers.label" default="Rosenthal Fibers" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'rosenthalFibers', 'errors')}">
                                    <g:checkBox name="rosenthalFibers" value="${reviewQuestionsInstance?.rosenthalFibers}" />
                                </td>
                            </tr>
                        
                            <tr>
                                <td valign="top" class="name">
                                  <label for="EGBS"><g:message code="reviewQuestions.EGBS.label" default="EGBS" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'EGBS', 'errors')}">
                                    <g:checkBox name="EGBS" value="${reviewQuestionsInstance?.EGBS}" />
                                </td>
                            </tr>
                        
                            <tr>
                                <td valign="top" class="name">
                                  <label for="mini_gemistocytesPresent"><g:message code="reviewQuestions.mini_gemistocytesPresent.label" default="Minigemistocytes Present" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'mini_gemistocytesPresent', 'errors')}">
                                    <g:checkBox name="mini_gemistocytesPresent" value="${reviewQuestionsInstance?.mini_gemistocytesPresent}" />
                                </td>
                            </tr>
                        
                            <tr>
                                <td valign="top" class="name">
                                  <label for="artifactPresentOrBadSection"><g:message code="reviewQuestions.artifactPresentOrBadSection.label" default="Artifact Present Or Bad Section" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'artifactPresentOrBadSection', 'errors')}">
                                    <g:checkBox name="artifactPresentOrBadSection" value="${reviewQuestionsInstance?.artifactPresentOrBadSection}" />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top" class="name">
                                  <label for="giantCellsPresent">Giant Cells Present</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'giantCellsPresent', 'errors')}">
                                    <g:checkBox name="giantCellsPresent" value="${reviewQuestionsInstance?.giantCellsPresent}" />
                                </td>
                            </tr>                            
                            
                            </table>
                            </td></tr>
                            <tr><td colspan="2">
		                            <table width="100%">
		                    	    <colgroup>
		                    	    	<col class="oce-first" />
		                    	    </colgroup>                                                                                                     
			                            <tr class="prop">
			                                <td>
			                                  <label for="gradingSubClassification"><g:message code="reviewQuestions.gradingSubClassification.label" default="Grading Sub Classification" /></label>
			                                </td>
			                                <td>
			                                    
			                                    <g:select id="gradingSubClassification" name="gradingSubClassification" from="${GradingSubClassification}"
			                                    	 optionKey="key" value="${reviewQuestionsInstance?.gradingSubClassification}"  noSelection="${['null':'Select One...']}"
			                                    	 onchange="${remoteFunction(action:'ajaxCheckError', update:'ajaxCheckError', params:'\'gsc=\'+document.getElementById(\'gradingSubClassification\').value', onComplete:'checkIfMoreOptions()')}"/>
			                                    <label id="ajaxCheckError" style="color:red"></label>
			                            <%
											def rg = reviewQuestionsInstance?.gradingSubClassification
											def rgCon = (rg=='1E' || rg=='1F' || rg=='1G' || rg=='1J')
										 %>
			                            <span id="gemistocyticDiv" style="display:${rgCon ? 'inline' : 'none'}"><br/>
			                                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label id="gemistocyticLabel" name="gemistocyticLabel" for="gemistocytic" style="color:red">if 1E or 1F or 1G or 1J: Gemistocytic?</label>
			                                    <g:select id="gemistocyticSelected" name="gemistocyticSelected" from="['Yes', 'No']" value="${reviewQuestionsInstance?.gemistocytic}" noSelection="${['null':'Select One...']}"/>
			                            </span>
			
										<%
											def rgCon2 = (rg=='2A' || rg=='2B' || rg=='2C')
										 %>
										<span id="predominantSubtypeDiv" style="display:${rgCon2 ? 'inline' : 'none'}"><br/>
			                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label for="predominantSubtype" style="color:red">if 2A-2C: Extent of Oligo component?</label>
			                                    <g:select id="PredominantSubtype" name="PredominantSubtype" from="${PredominantSubtype}" value="${reviewQuestionsInstance?.predominantSubtype}"  noSelection="${['null':'Select One...']}"/>
										</span>
										<%
											def rgCon3 =(rg=='9')
										 %>
										<span id="possibleSubClassificationDiv" style="display:${rgCon3 ? 'inline' : 'none'}"><br/>
			                                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label for="possibleSubClassification" style="color:red">if 9: Possible subclassification</label>
			                                    <g:select id="possibleSubClassification" name="possibleSubClassification" optionKey="key" from="${GradingSubClassification}" value="${reviewQuestionsInstance?.possibleSubClassification}"  noSelection="${['null':'Select One...']}"/>
			                            </span>
	                            	</td></tr>
		                        	</table>
		                        </td></tr>
	                            <tr><td colspan="2">
		                            <table width="100%">
		                    	    <colgroup>
		                    	    	<col class="oce-first" />
		                    	    </colgroup>                                                                                                     
			                            <tr>
			                                <td>
			                                  <label for="levelOfDiagnosticCertainty" style="color:red"><g:message code="reviewQuestions.levelOfDiagnosticCertainty.label" default="Level Of Diagnostic Certainty" /></label>
			                                </td>
			                                <td>
			                                    <g:select id="levelOfDiagnosticCertainty" name="levelOfDiagnosticCertainty" from="${['1(low)', '2', '3(high)']}" value="${reviewQuestionsInstance?.levelOfDiagnosticCertainty}"  noSelection="${['null':'Select One...']}"/>
			                                </td>
			                            </tr>
				                        <tr>
				                                <td>
				                                  <label for="notes"><g:message code="reviewQuestions.notes.label" default="Notes" /></label>
				                                </td>
				                                <td>
				                                    <g:textArea id="notes" name="notes" value="${reviewQuestionsInstance?.notes}" rows="3" cols="60" />
				                                </td>
				
				                        </tr>
				                        <tr>
				                        	<td>Message(s)</td>
				                        	<td>
				                        	
						                        <g:if test="${reviewQuestionsInstance?.messages}">
						                        <%
													reviewQuestionsInstance?.messages.split("-").each{msg->
														if (msg!="null") out << "${msg}<br/>"
												 %>
												 <% } %>
												 </g:if>
				                        	
				                        	</td>
				                        </tr>
		                            </table>
		                            </td></tr>
	                        	<tr><td colspan="2">                            


                    <div class="buttons2">
                    	&nbsp;&nbsp;<g:actionSubmit class="edit" action="do_save_finish_later" value="Save/Finish later" />
<%--
						&nbsp;&nbsp;&nbsp;&nbsp;<g:actionSubmit class="info" action="do_request_more_info" value="Request More Info/Image(s)" onclick="return askWhy()"/>
 --%>
                    	&nbsp;&nbsp;&nbsp;&nbsp;<g:actionSubmit class="save" action="do_review_complete" value="Review Complete" onclick="return checkIfAllRequiredAreSelected()"/>

<g:if test="${session.user.role=='admin' }">
&nbsp;&nbsp;&nbsp;&nbsp;<modalbox:createLink controller="dataEntry" action="contact3" class="info" id="${reviewQuestionsInstance?.id}" title="Contact reviewer!" width="500">Contact/Reply to reviewer</modalbox:createLink>                    
</g:if>
<g:else>
&nbsp;&nbsp;&nbsp;&nbsp;<modalbox:createLink controller="dataEntry" action="contact2" class="info" id="${reviewQuestionsInstance?.id}" title="Request more info!" width="500">Request More Info</modalbox:createLink>                    
</g:else>
                    </div>
                   
                    </td></tr>

                    </table>
                    </g:form>
                </div>
              
               

        </div>
    </body>
</html>