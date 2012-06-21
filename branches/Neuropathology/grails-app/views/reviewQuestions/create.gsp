
<%@ page import="braintumorpathologyreview.ReviewQuestions" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'reviewQuestions.label', default: 'ReviewQuestions')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${reviewQuestionsInstance}">
            <div class="errors">
                <g:renderErrors bean="${reviewQuestionsInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="studyid">studyid></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'studyid', 'errors')}">
                                    <g:textField name="studyid" value="${reviewQuestionsInstance?.studyid}" />
                                </td>
                            </tr>                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="astrocyticPhenotype"><g:message code="reviewQuestions.astrocyticPhenotype.label" default="Astrocytic Phenotype" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'astrocyticPhenotype', 'errors')}">
                                    <g:checkBox name="astrocyticPhenotype" value="${reviewQuestionsInstance?.astrocyticPhenotype}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="oligodendroglialPhenotype"><g:message code="reviewQuestions.oligodendroglialPhenotype.label" default="Oligodendroglial Phenotype" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'oligodendroglialPhenotype', 'errors')}">
                                    <g:checkBox name="oligodendroglialPhenotype" value="${reviewQuestionsInstance?.oligodendroglialPhenotype}" />
                                </td>
                            </tr>                                                    
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="mitoses"><g:message code="reviewQuestions.mitoses.label" default="Mitoses" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'mitoses', 'errors')}">
                                    <g:checkBox name="mitoses" value="${reviewQuestionsInstance?.mitoses}" />
                                </td>
                            </tr>                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="necrosis"><g:message code="reviewQuestions.necrosis.label" default="Necrosis" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'necrosis', 'errors')}">
                                    <g:checkBox name="necrosis" value="${reviewQuestionsInstance?.necrosis}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="pseudopalisadingNecrosis"><g:message code="reviewQuestions.pseudopalisadingNecrosis.label" default="Pseudopalisading Necrosis" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'pseudopalisadingNecrosis', 'errors')}">
                                    <g:checkBox name="pseudopalisadingNecrosis" value="${reviewQuestionsInstance?.pseudopalisadingNecrosis}" />
                                </td>
                            </tr>
                                                                                    <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="invasion"><g:message code="reviewQuestions.invasion.label" default="Invasion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'invasion', 'errors')}">
                                    <g:checkBox name="invasion" value="${reviewQuestionsInstance?.invasion}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="perivascularInflammation"><g:message code="reviewQuestions.perivascularInflammation.label" default="Perivascular Inflammation" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'perivascularInflammation', 'errors')}">
                                    <g:checkBox name="perivascularInflammation" value="${reviewQuestionsInstance?.perivascularInflammation}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="vascularProliferation"><g:message code="reviewQuestions.vascularProliferation.label" default="Vascular Proliferation" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'vascularProliferation', 'errors')}">
                                    <g:checkBox name="vascularProliferation" value="${reviewQuestionsInstance?.vascularProliferation}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label style="color:orange" for="VPscale"><g:message code="reviewQuestions.VPscale.label" default="VP scale" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'VPscale', 'errors')}">
                                    <!-- <g:textField name="VPscale" value="${reviewQuestionsInstance?.VPscale}" />-->
                                    <g:select id="VPscale" name="VPscale" from="${VPscale}" value="" noSelection="['':'If checked above, specify']" />
                                </td>
                            </tr>                                                                                    
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="rosenthalFibers"><g:message code="reviewQuestions.rosenthalFibers.label" default="Rosenthal Fibers" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'rosenthalFibers', 'errors')}">
                                    <g:checkBox name="rosenthalFibers" value="${reviewQuestionsInstance?.rosenthalFibers}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="EGBS"><g:message code="reviewQuestions.EGBS.label" default="EGBS" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'EGBS', 'errors')}">
                                    <g:checkBox name="EGBS" value="${reviewQuestionsInstance?.EGBS}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="mini_gemistocytesPresent"><g:message code="reviewQuestions.mini_gemistocytesPresent.label" default="Minigemistocytes Present" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'mini_gemistocytesPresent', 'errors')}">
                                    <g:checkBox name="mini_gemistocytesPresent" value="${reviewQuestionsInstance?.mini_gemistocytesPresent}" />
                                </td>
                            </tr>                                                    
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="artifactPresentOrBadSection"><g:message code="reviewQuestions.artifactPresentOrBadSection.label" default="Artifact Present Or Bad Section" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'artifactPresentOrBadSection', 'errors')}">
                                    <g:checkBox name="artifactPresentOrBadSection" value="${reviewQuestionsInstance?.artifactPresentOrBadSection}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="giantCellsPresent">Giant Cells Present</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'giantCellsPresent', 'errors')}">
                                    <g:checkBox name="giantCellsPresent" value="${reviewQuestionsInstance?.giantCellsPresent}" />
                                </td>
                            </tr>                            
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="gradingSubClassification"><g:message code="reviewQuestions.gradingSubClassification.label" default="Grading Sub Classification" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'gradingSubClassification', 'errors')}">
                                    <!-- <g:textField name="gradingSubClassification" value="${reviewQuestionsInstance?.gradingSubClassification}" /> -->
                                    <g:select id="GradingSubClassification" name="GradingSubClassification" from="${GradingSubClassification}" value="" noSelection="['':'--Grading/Sub Classification']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label style="color:orange" for="gemistocytic"><g:message code="reviewQuestions.gemistocytic.label" default="Gemistocytic" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'gemistocytic', 'errors')}">
                                    <g:checkBox name="gemistocytic" value="${reviewQuestionsInstance?.gemistocytic}" />
                                </td>
                            </tr>
                        
                           <tr class="prop">
                                <td valign="top" class="name">
                                    <label style="color:orange" for="predominantSubtype"><g:message code="reviewQuestions.predominantSubtype.label" default="Predominant Subtype" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'predominantSubtype', 'errors')}">
                                    <!-- <g:textField name="predominantSubtype" value="${reviewQuestionsInstance?.predominantSubtype}" /> -->
                                    <g:select id="PredominantSubtype" name="PredominantSubtype" from="${PredominantSubtype}" value="" noSelection="['':'--PredominantSubtype']" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label style="color:orange" for="possibleSubClassification"><g:message code="reviewQuestions.possibleSubClassification.label" default="Possible Sub Classification" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'possibleSubClassification', 'errors')}">
                                    <!-- <g:textField name="possibleSubClassification" value="${reviewQuestionsInstance?.possibleSubClassification}" /> -->
                                    <g:select id="PossibleSubClassification" name="PossibleSubClassification" from="${PossibleSubClassification}" value="" noSelection="['':'--Possible Sub-classification']" />
                                </td>
                            </tr>                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="levelOfDiagnosticCertainty"><g:message code="reviewQuestions.levelOfDiagnosticCertainty.label" default="Level Of Diagnostic Certainty" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'levelOfDiagnosticCertainty', 'errors')}">
                                    <!-- <g:textField name="levelOfDiagnosticCertainty" value="${reviewQuestionsInstance?.levelOfDiagnosticCertainty}" /> -->
                                    
                                    <g:select id="levelOfDiagnosticCertainty" name="levelOfDiagnosticCertainty" from="${['1(low)', '2', '3(high)']}" value="" noSelection="['':'--Level of Certainty']" />
                                </td>
                            </tr>
<!--                         
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="complete"><g:message code="reviewQuestions.complete.label" default="Complete" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'complete', 'errors')}">
                                    <g:checkBox name="complete" value="${reviewQuestionsInstance?.complete}" />
                                </td>
                            </tr>
 -->                        
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="notes"><g:message code="reviewQuestions.notes.label" default="Notes" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'notes', 'errors')}">
                                    <g:textArea name="notes" value="${reviewQuestionsInstance?.notes}" rows="3" cols="45"/>
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
