
<%@ page import="braintumorpathologyreview.CaseDetails" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'caseDetails.label', default: 'CaseDetails')}" />
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
            <g:hasErrors bean="${caseDetailsInstance}">
            <div class="errors">
                <g:renderErrors bean="${caseDetailsInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="MRIDate1"><g:message code="caseDetails.MRIDate1.label" default="MRID ate1" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'MRIDate1', 'errors')}">
                                    <g:textField name="MRIDate1" value="${caseDetailsInstance?.MRIDate1}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="MRIDate2"><g:message code="caseDetails.MRIDate2.label" default="MRID ate2" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'MRIDate2', 'errors')}">
                                    <g:textField name="MRIDate2" value="${caseDetailsInstance?.MRIDate2}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="MRIReport1"><g:message code="caseDetails.MRIReport1.label" default="MRIR eport1" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'MRIReport1', 'errors')}">
                                    <g:textField name="MRIReport1" value="${caseDetailsInstance?.MRIReport1}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="MRIReport2"><g:message code="caseDetails.MRIReport2.label" default="MRIR eport2" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'MRIReport2', 'errors')}">
                                    <g:textField name="MRIReport2" value="${caseDetailsInstance?.MRIReport2}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="MRISummary1"><g:message code="caseDetails.MRISummary1.label" default="MRIS ummary1" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'MRISummary1', 'errors')}">
                                    <g:textField name="MRISummary1" value="${caseDetailsInstance?.MRISummary1}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="MRISummary2"><g:message code="caseDetails.MRISummary2.label" default="MRIS ummary2" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'MRISummary2', 'errors')}">
                                    <g:textField name="MRISummary2" value="${caseDetailsInstance?.MRISummary2}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="diagnosis1"><g:message code="caseDetails.diagnosis1.label" default="Diagnosis1" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'diagnosis1', 'errors')}">
                                    <g:textField name="diagnosis1" value="${caseDetailsInstance?.diagnosis1}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="diagnosis2"><g:message code="caseDetails.diagnosis2.label" default="Diagnosis2" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'diagnosis2', 'errors')}">
                                    <g:textField name="diagnosis2" value="${caseDetailsInstance?.diagnosis2}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="diagnosis3"><g:message code="caseDetails.diagnosis3.label" default="Diagnosis3" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'diagnosis3', 'errors')}">
                                    <g:textField name="diagnosis3" value="${caseDetailsInstance?.diagnosis3}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="diagnosis4"><g:message code="caseDetails.diagnosis4.label" default="Diagnosis4" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'diagnosis4', 'errors')}">
                                    <g:textField name="diagnosis4" value="${caseDetailsInstance?.diagnosis4}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="diagnosis5"><g:message code="caseDetails.diagnosis5.label" default="Diagnosis5" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'diagnosis5', 'errors')}">
                                    <g:textField name="diagnosis5" value="${caseDetailsInstance?.diagnosis5}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="diagnosis6"><g:message code="caseDetails.diagnosis6.label" default="Diagnosis6" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'diagnosis6', 'errors')}">
                                    <g:textField name="diagnosis6" value="${caseDetailsInstance?.diagnosis6}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="gliomaOrMeningioma"><g:message code="caseDetails.gliomaOrMeningioma.label" default="Glioma Or Meningioma" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'gliomaOrMeningioma', 'errors')}">
                                    <g:textField name="gliomaOrMeningioma" value="${caseDetailsInstance?.gliomaOrMeningioma}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="reportUrl1"><g:message code="caseDetails.reportUrl1.label" default="Report Url1" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'reportUrl1', 'errors')}">
                                    <g:textField name="reportUrl1" value="${caseDetailsInstance?.reportUrl1}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="reportUrl2"><g:message code="caseDetails.reportUrl2.label" default="Report Url2" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'reportUrl2', 'errors')}">
                                    <g:textField name="reportUrl2" value="${caseDetailsInstance?.reportUrl2}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="reportUrl3"><g:message code="caseDetails.reportUrl3.label" default="Report Url3" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'reportUrl3', 'errors')}">
                                    <g:textField name="reportUrl3" value="${caseDetailsInstance?.reportUrl3}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="reportUrl4"><g:message code="caseDetails.reportUrl4.label" default="Report Url4" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'reportUrl4', 'errors')}">
                                    <g:textField name="reportUrl4" value="${caseDetailsInstance?.reportUrl4}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="reportUrl5"><g:message code="caseDetails.reportUrl5.label" default="Report Url5" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'reportUrl5', 'errors')}">
                                    <g:textField name="reportUrl5" value="${caseDetailsInstance?.reportUrl5}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="reportUrl6"><g:message code="caseDetails.reportUrl6.label" default="Report Url6" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'reportUrl6', 'errors')}">
                                    <g:textField name="reportUrl6" value="${caseDetailsInstance?.reportUrl6}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="reviewType1"><g:message code="caseDetails.reviewType1.label" default="Review Type1" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'reviewType1', 'errors')}">
                                    <g:textField name="reviewType1" value="${caseDetailsInstance?.reviewType1}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="reviewType2"><g:message code="caseDetails.reviewType2.label" default="Review Type2" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'reviewType2', 'errors')}">
                                    <g:textField name="reviewType2" value="${caseDetailsInstance?.reviewType2}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="reviewType3"><g:message code="caseDetails.reviewType3.label" default="Review Type3" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'reviewType3', 'errors')}">
                                    <g:textField name="reviewType3" value="${caseDetailsInstance?.reviewType3}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="reviewType4"><g:message code="caseDetails.reviewType4.label" default="Review Type4" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'reviewType4', 'errors')}">
                                    <g:textField name="reviewType4" value="${caseDetailsInstance?.reviewType4}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="reviewType5"><g:message code="caseDetails.reviewType5.label" default="Review Type5" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'reviewType5', 'errors')}">
                                    <g:textField name="reviewType5" value="${caseDetailsInstance?.reviewType5}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="reviewType6"><g:message code="caseDetails.reviewType6.label" default="Review Type6" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'reviewType6', 'errors')}">
                                    <g:textField name="reviewType6" value="${caseDetailsInstance?.reviewType6}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="site1"><g:message code="caseDetails.site1.label" default="Site1" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'site1', 'errors')}">
                                    <g:textField name="site1" value="${caseDetailsInstance?.site1}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="site2"><g:message code="caseDetails.site2.label" default="Site2" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'site2', 'errors')}">
                                    <g:textField name="site2" value="${caseDetailsInstance?.site2}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="site3"><g:message code="caseDetails.site3.label" default="Site3" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'site3', 'errors')}">
                                    <g:textField name="site3" value="${caseDetailsInstance?.site3}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="site4"><g:message code="caseDetails.site4.label" default="Site4" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'site4', 'errors')}">
                                    <g:textField name="site4" value="${caseDetailsInstance?.site4}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="site5"><g:message code="caseDetails.site5.label" default="Site5" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'site5', 'errors')}">
                                    <g:textField name="site5" value="${caseDetailsInstance?.site5}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="site6"><g:message code="caseDetails.site6.label" default="Site6" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'site6', 'errors')}">
                                    <g:textField name="site6" value="${caseDetailsInstance?.site6}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="stainType1"><g:message code="caseDetails.stainType1.label" default="Stain Type1" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'stainType1', 'errors')}">
                                    <g:textField name="stainType1" value="${caseDetailsInstance?.stainType1}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="stainType2"><g:message code="caseDetails.stainType2.label" default="Stain Type2" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'stainType2', 'errors')}">
                                    <g:textField name="stainType2" value="${caseDetailsInstance?.stainType2}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="stainType3"><g:message code="caseDetails.stainType3.label" default="Stain Type3" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'stainType3', 'errors')}">
                                    <g:textField name="stainType3" value="${caseDetailsInstance?.stainType3}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="stainType4"><g:message code="caseDetails.stainType4.label" default="Stain Type4" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'stainType4', 'errors')}">
                                    <g:textField name="stainType4" value="${caseDetailsInstance?.stainType4}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="stainType5"><g:message code="caseDetails.stainType5.label" default="Stain Type5" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'stainType5', 'errors')}">
                                    <g:textField name="stainType5" value="${caseDetailsInstance?.stainType5}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="stainType6"><g:message code="caseDetails.stainType6.label" default="Stain Type6" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'stainType6', 'errors')}">
                                    <g:textField name="stainType6" value="${caseDetailsInstance?.stainType6}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="status1"><g:message code="caseDetails.status1.label" default="Status1" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'status1', 'errors')}">
                                    <g:textField name="status1" value="${caseDetailsInstance?.status1}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="status2"><g:message code="caseDetails.status2.label" default="Status2" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'status2', 'errors')}">
                                    <g:textField name="status2" value="${caseDetailsInstance?.status2}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="status3"><g:message code="caseDetails.status3.label" default="Status3" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'status3', 'errors')}">
                                    <g:textField name="status3" value="${caseDetailsInstance?.status3}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="status4"><g:message code="caseDetails.status4.label" default="Status4" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'status4', 'errors')}">
                                    <g:textField name="status4" value="${caseDetailsInstance?.status4}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="status5"><g:message code="caseDetails.status5.label" default="Status5" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'status5', 'errors')}">
                                    <g:textField name="status5" value="${caseDetailsInstance?.status5}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="status6"><g:message code="caseDetails.status6.label" default="Status6" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'status6', 'errors')}">
                                    <g:textField name="status6" value="${caseDetailsInstance?.status6}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="studyid"><g:message code="caseDetails.studyid.label" default="Studyid" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'studyid', 'errors')}">
                                    <g:textField name="studyid" value="${caseDetailsInstance?.studyid}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="subject_initials"><g:message code="caseDetails.subject_initials.label" default="Subjectinitials" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'subject_initials', 'errors')}">
                                    <g:textField name="subject_initials" value="${caseDetailsInstance?.subject_initials}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="surgPathNum1"><g:message code="caseDetails.surgPathNum1.label" default="Surg Path Num1" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'surgPathNum1', 'errors')}">
                                    <g:textField name="surgPathNum1" value="${caseDetailsInstance?.surgPathNum1}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="surgPathNum2"><g:message code="caseDetails.surgPathNum2.label" default="Surg Path Num2" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'surgPathNum2', 'errors')}">
                                    <g:textField name="surgPathNum2" value="${caseDetailsInstance?.surgPathNum2}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="surgPathNum3"><g:message code="caseDetails.surgPathNum3.label" default="Surg Path Num3" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'surgPathNum3', 'errors')}">
                                    <g:textField name="surgPathNum3" value="${caseDetailsInstance?.surgPathNum3}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="surgPathNum4"><g:message code="caseDetails.surgPathNum4.label" default="Surg Path Num4" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'surgPathNum4', 'errors')}">
                                    <g:textField name="surgPathNum4" value="${caseDetailsInstance?.surgPathNum4}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="surgPathNum5"><g:message code="caseDetails.surgPathNum5.label" default="Surg Path Num5" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'surgPathNum5', 'errors')}">
                                    <g:textField name="surgPathNum5" value="${caseDetailsInstance?.surgPathNum5}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="surgPathNum6"><g:message code="caseDetails.surgPathNum6.label" default="Surg Path Num6" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'surgPathNum6', 'errors')}">
                                    <g:textField name="surgPathNum6" value="${caseDetailsInstance?.surgPathNum6}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="surgType1"><g:message code="caseDetails.surgType1.label" default="Surg Type1" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'surgType1', 'errors')}">
                                    <g:textField name="surgType1" value="${caseDetailsInstance?.surgType1}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="surgType2"><g:message code="caseDetails.surgType2.label" default="Surg Type2" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'surgType2', 'errors')}">
                                    <g:textField name="surgType2" value="${caseDetailsInstance?.surgType2}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="surgType3"><g:message code="caseDetails.surgType3.label" default="Surg Type3" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'surgType3', 'errors')}">
                                    <g:textField name="surgType3" value="${caseDetailsInstance?.surgType3}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="surgType4"><g:message code="caseDetails.surgType4.label" default="Surg Type4" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'surgType4', 'errors')}">
                                    <g:textField name="surgType4" value="${caseDetailsInstance?.surgType4}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="surgType5"><g:message code="caseDetails.surgType5.label" default="Surg Type5" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'surgType5', 'errors')}">
                                    <g:textField name="surgType5" value="${caseDetailsInstance?.surgType5}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="surgType6"><g:message code="caseDetails.surgType6.label" default="Surg Type6" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'surgType6', 'errors')}">
                                    <g:textField name="surgType6" value="${caseDetailsInstance?.surgType6}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="surgeryDate1"><g:message code="caseDetails.surgeryDate1.label" default="Surgery Date1" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'surgeryDate1', 'errors')}">
                                    <g:textField name="surgeryDate1" value="${caseDetailsInstance?.surgeryDate1}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="surgeryDate2"><g:message code="caseDetails.surgeryDate2.label" default="Surgery Date2" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'surgeryDate2', 'errors')}">
                                    <g:textField name="surgeryDate2" value="${caseDetailsInstance?.surgeryDate2}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="surgeryDate3"><g:message code="caseDetails.surgeryDate3.label" default="Surgery Date3" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'surgeryDate3', 'errors')}">
                                    <g:textField name="surgeryDate3" value="${caseDetailsInstance?.surgeryDate3}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="surgeryDate4"><g:message code="caseDetails.surgeryDate4.label" default="Surgery Date4" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'surgeryDate4', 'errors')}">
                                    <g:textField name="surgeryDate4" value="${caseDetailsInstance?.surgeryDate4}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="surgeryDate5"><g:message code="caseDetails.surgeryDate5.label" default="Surgery Date5" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'surgeryDate5', 'errors')}">
                                    <g:textField name="surgeryDate5" value="${caseDetailsInstance?.surgeryDate5}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="surgeryDate6"><g:message code="caseDetails.surgeryDate6.label" default="Surgery Date6" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'surgeryDate6', 'errors')}">
                                    <g:textField name="surgeryDate6" value="${caseDetailsInstance?.surgeryDate6}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="surgeryType1"><g:message code="caseDetails.surgeryType1.label" default="Surgery Type1" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'surgeryType1', 'errors')}">
                                    <g:textField name="surgeryType1" value="${caseDetailsInstance?.surgeryType1}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="surgeryType2"><g:message code="caseDetails.surgeryType2.label" default="Surgery Type2" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'surgeryType2', 'errors')}">
                                    <g:textField name="surgeryType2" value="${caseDetailsInstance?.surgeryType2}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="surgeryType3"><g:message code="caseDetails.surgeryType3.label" default="Surgery Type3" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'surgeryType3', 'errors')}">
                                    <g:textField name="surgeryType3" value="${caseDetailsInstance?.surgeryType3}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="surgeryType4"><g:message code="caseDetails.surgeryType4.label" default="Surgery Type4" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'surgeryType4', 'errors')}">
                                    <g:textField name="surgeryType4" value="${caseDetailsInstance?.surgeryType4}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="surgeryType5"><g:message code="caseDetails.surgeryType5.label" default="Surgery Type5" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'surgeryType5', 'errors')}">
                                    <g:textField name="surgeryType5" value="${caseDetailsInstance?.surgeryType5}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="surgeryType6"><g:message code="caseDetails.surgeryType6.label" default="Surgery Type6" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: caseDetailsInstance, field: 'surgeryType6', 'errors')}">
                                    <g:textField name="surgeryType6" value="${caseDetailsInstance?.surgeryType6}" />
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
