
<%@ page import="braintumorpathologyreview.CaseDetails" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'caseDetails.label', default: 'CaseDetails')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.MRIDate1.label" default="MRID ate1" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "MRIDate1")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.MRIDate2.label" default="MRID ate2" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "MRIDate2")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.MRIReport1.label" default="MRIR eport1" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "MRIReport1")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.MRIReport2.label" default="MRIR eport2" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "MRIReport2")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.MRISummary1.label" default="MRIS ummary1" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "MRISummary1")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.MRISummary2.label" default="MRIS ummary2" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "MRISummary2")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.diagnosis1.label" default="Diagnosis1" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "diagnosis1")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.diagnosis2.label" default="Diagnosis2" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "diagnosis2")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.diagnosis3.label" default="Diagnosis3" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "diagnosis3")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.diagnosis4.label" default="Diagnosis4" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "diagnosis4")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.diagnosis5.label" default="Diagnosis5" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "diagnosis5")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.diagnosis6.label" default="Diagnosis6" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "diagnosis6")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.gliomaOrMeningioma.label" default="Glioma Or Meningioma" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "gliomaOrMeningioma")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.reportUrl1.label" default="Report Url1" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "reportUrl1")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.reportUrl2.label" default="Report Url2" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "reportUrl2")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.reportUrl3.label" default="Report Url3" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "reportUrl3")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.reportUrl4.label" default="Report Url4" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "reportUrl4")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.reportUrl5.label" default="Report Url5" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "reportUrl5")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.reportUrl6.label" default="Report Url6" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "reportUrl6")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.reviewType1.label" default="Review Type1" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "reviewType1")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.reviewType2.label" default="Review Type2" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "reviewType2")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.reviewType3.label" default="Review Type3" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "reviewType3")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.reviewType4.label" default="Review Type4" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "reviewType4")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.reviewType5.label" default="Review Type5" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "reviewType5")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.reviewType6.label" default="Review Type6" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "reviewType6")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.site1.label" default="Site1" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "site1")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.site2.label" default="Site2" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "site2")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.site3.label" default="Site3" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "site3")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.site4.label" default="Site4" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "site4")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.site5.label" default="Site5" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "site5")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.site6.label" default="Site6" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "site6")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.stainType1.label" default="Stain Type1" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "stainType1")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.stainType2.label" default="Stain Type2" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "stainType2")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.stainType3.label" default="Stain Type3" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "stainType3")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.stainType4.label" default="Stain Type4" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "stainType4")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.stainType5.label" default="Stain Type5" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "stainType5")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.stainType6.label" default="Stain Type6" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "stainType6")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.status1.label" default="Status1" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "status1")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.status2.label" default="Status2" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "status2")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.status3.label" default="Status3" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "status3")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.status4.label" default="Status4" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "status4")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.status5.label" default="Status5" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "status5")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.status6.label" default="Status6" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "status6")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.studyid.label" default="Studyid" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "studyid")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.subject_initials.label" default="Subjectinitials" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "subject_initials")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.surgPathNum1.label" default="Surg Path Num1" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "surgPathNum1")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.surgPathNum2.label" default="Surg Path Num2" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "surgPathNum2")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.surgPathNum3.label" default="Surg Path Num3" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "surgPathNum3")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.surgPathNum4.label" default="Surg Path Num4" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "surgPathNum4")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.surgPathNum5.label" default="Surg Path Num5" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "surgPathNum5")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.surgPathNum6.label" default="Surg Path Num6" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "surgPathNum6")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.surgType1.label" default="Surg Type1" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "surgType1")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.surgType2.label" default="Surg Type2" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "surgType2")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.surgType3.label" default="Surg Type3" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "surgType3")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.surgType4.label" default="Surg Type4" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "surgType4")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.surgType5.label" default="Surg Type5" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "surgType5")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.surgType6.label" default="Surg Type6" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "surgType6")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.surgeryDate1.label" default="Surgery Date1" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "surgeryDate1")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.surgeryDate2.label" default="Surgery Date2" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "surgeryDate2")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.surgeryDate3.label" default="Surgery Date3" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "surgeryDate3")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.surgeryDate4.label" default="Surgery Date4" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "surgeryDate4")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.surgeryDate5.label" default="Surgery Date5" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "surgeryDate5")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.surgeryDate6.label" default="Surgery Date6" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "surgeryDate6")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.surgeryType1.label" default="Surgery Type1" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "surgeryType1")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.surgeryType2.label" default="Surgery Type2" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "surgeryType2")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.surgeryType3.label" default="Surgery Type3" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "surgeryType3")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.surgeryType4.label" default="Surgery Type4" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "surgeryType4")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.surgeryType5.label" default="Surgery Type5" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "surgeryType5")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseDetails.surgeryType6.label" default="Surgery Type6" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseDetailsInstance, field: "surgeryType6")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${caseDetailsInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
