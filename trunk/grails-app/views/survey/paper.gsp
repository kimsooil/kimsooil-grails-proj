<%@ page import="u56survey.Survey" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'survey.label', default: 'Survey')}" />
        <title>Paper-based Survey</title>
<%--
		<jv:generateValidation domain="survey" form="surveyform15"  display="list" container="errors"/>        
 --%>
		<g:render template="errMsgsToJson-js"/>
		
		<g:javascript src="checkVerifyForm.js" /> 
    </head>
    <body>
<%
	def birth=surveyInstance?.DOB ? surveyInstance?.DOB : new Date()
	//out << "dob="+birth[java.util.Calendar.YEAR]+"<br/>"
	def today=new Date() 		
	//out << "today="+today[java.util.Calendar.YEAR]+"<br/>"
%>	     
<g:javascript>
$(document).ready(function(){
	<g:if test="${!surveyInstance?.completed}">
  	//$.jqDialog.alert('<p align="center"><label style="color:red"><g:message code="verify.important.message1" /><br/><img src="${resource(dir:'images',file:'important.gif')}" align="absmiddle" alt="important" /><br/><g:message code="verify.important.message2" /></label><br/></p>');
	</g:if>
	<g:else>
	//$.jqDialog.alert('<p align="center"><label style="color:green"><img src="${resource(dir:'images',file:'important.gif')}" align="absmiddle" alt="important" /><br/>This survey has been locked by completion.<br/>Contact administrator for inquiry<br/></p>');
	</g:else>
	
	window.onload= function(){
	  	//DisableEnableForm(document.surveyform_paper,true);
		//$("[name=_action_update]").attr("disabled", false);
  		//$("[name=_action_completed]").attr("disabled", false);
  		//$("[name=id]").attr("disabled", false);		  
  		//$("[name=version]").attr("disabled", false);
  		//$("[name=consentNum]").attr("disabled", false);
  		//checkVerifyForm();
	}
	$("#consentNumLoc").change(function() {
			if ($("#consentNumLoc").val()=='PRTB')
			{
				$("#otherNumber").show();
			}
			else {
				$("#otherNumber").hide();
				$("#otherNumberOrComments").val('');
			}	
		}
	);
});
function confirmSubmit()
{
	var agree=confirm(i18nmessages.confirmMsg);
	if (agree){
		return true;
	}
	else{
		return false ;
	}
}   
</g:javascript>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <g:if test="${!surveyInstance?.completed}">
            	<span class="menuButton"><g:render template="/common/step_meter"/></span>
            </g:if>
        </div>
        <div class="body">
            <h1>Paper Survey</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
<div id="errors" class="errors" style="display:none;">
</div>
            <g:form name="surveyform_paper"
					method="post" >
                <g:hiddenField name="id" value="${surveyInstance?.id}" />
                <g:hiddenField name="version" value="${surveyInstance?.version}" />
                <%--<g:hiddenField name="consentNum" value="${surveyInstance?.consentNum}" />--%>
                
                <g:hiddenField name="mode" value="paper" />
                
                <g:render template="/common/status_info"  model="['dob':surveyInstance?.DOB]"/>
                
                <%--<g:render template="preview"  model="[surveyInstance: surveyInstance, countryNames:countryNames, thisyear:thisyear]"/> --%>

<h1><g:link title="1" action="step1_edit" id="${surveyInstance?.id}"><label style="color:orange;"><g:message code="step1.label" default="Step1-new" /></label></g:link></h1>
<g:render template="/onepage/step1"/>

<h1><g:link title="2" action="step2" id="${surveyInstance?.id}"><label style="color:orange;"><g:message code="step2.label" default="Step2" /></label></g:link></h1>
<g:render template="/onepage/step2"/>

<h1><g:link title="3" action="step3" id="${surveyInstance?.id}"><label style="color:orange;"><g:message code="step3.label" default="Step3" /></label></g:link></h1>
<g:render template="/onepage/step3"/>

<h1><g:link title="4" action="step4" id="${surveyInstance?.id}"><label style="color:orange;"><g:message code="step4.label" default="Step4" /></label></g:link></h1>
<g:render template="/onepage/step4"/>

<h1><g:link title="5" action="step5" id="${surveyInstance?.id}"><label style="color:orange;"><g:message code="step5.label" default="Step5" /></label></g:link></h1>
<g:render template="/onepage/step5"/>

<h1><g:link title="6" action="step6" id="${surveyInstance?.id}"><label style="color:orange;"><g:message code="step6.label" default="Step6" /></label></g:link></h1>
<g:render template="/onepage/step6"/>

<h1><g:link title="7" action="step7" id="${surveyInstance?.id}"><label style="color:orange;"><g:message code="step7.label" default="Step7" /></label></g:link>  <img src="${resource(dir:'images',file:'male.gif')}" align="absmiddle" alt="male" /></h1>
<g:render template="/onepage/step7"/>

<h1><g:link title="8" action="step8" id="${surveyInstance?.id}"><label style="color:orange;"><g:message code="step8.label" default="Step8" /></label></g:link></h1>
<g:render template="/onepage/step8"/>

<h1><g:link title="9" action="step9" id="${surveyInstance?.id}"><label style="color:orange;"><g:message code="step9.label" default="Step9" /></label></g:link> <img src="${resource(dir:'images',file:'female.gif')}" align="absmiddle" alt="female" /></h1>
<g:render template="/onepage/step9"/>

<h1><g:link title="10" action="step10" id="${surveyInstance?.id}"><label style="color:orange;"><g:message code="step10.label" default="Step10" /></label></g:link> <img src="${resource(dir:'images',file:'female.gif')}" align="absmiddle" alt="female" /></h1>
<g:render template="/onepage/step10"/>

<h1><g:link title="11" action="step2" id="${surveyInstance?.id}"><label style="color:orange;"><g:message code="step11.label" default="Step11" /></label></g:link> <img src="${resource(dir:'images',file:'female.gif')}" align="absmiddle" alt="female" /></h1>
<g:render template="/onepage/step11"/>

<h1><g:link title="12" action="step12" id="${surveyInstance?.id}"><label style="color:orange;"><g:message code="step12.label" default="Step12" /></label></g:link></h1>
<g:render template="/onepage/step12"/>

<h1><g:link title="13" action="step13" id="${surveyInstance?.id}"><label style="color:orange;"><g:message code="step13.label" default="Step13" /></label></g:link></h1>
<g:render template="/onepage/step13"/>

<h1><g:link title="14" action="step14" id="${surveyInstance?.id}"><label style="color:orange;"><g:message code="step14.label" default="Step14" /></label></g:link></h1>
<g:render template="/onepage/step14"/>

<h1><g:link title="15" action="step15" id="${surveyInstance?.id}"><label style="color:orange;"><g:message code="step15.label" default="Step15" /></label></g:link></h1>
<g:render template="/onepage/step15"/>

                <div class="buttons">
<%--
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'button.save-finish-later.label', default: 'update')}" /></span>
                    <span class="button"><g:actionSubmit class="back" action="step14" value="${message(code: 'button.go-back.label', default: 'back')}" /></span>
                    <span class="button"><input type="reset" value="${message(code: 'button.reset-all.label', default: 'reset')}"></span>
                     
                    <span class="button"><g:actionSubmit class="done" action="done" value="${message(code: 'Done', default: 'Done.')}" /></span>
 --%> 

<g:if test="${!surveyInstance?.completed}"> 
<%--                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}"   onclick="DisableEnableForm(document.surveyform,false);" /></span>
 --%>
 
	<span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'button.save-finish-later.label', default: 'update')}" /></span>
	<span class="button"><g:actionSubmit class="complete" action="completed" value="${message(code: 'complete', default: 'Complete')}" onclick="return confirmSubmit();"/></span>

	<!-- <span class="menuButton"><g:render template="/common/step_meter"/></span> -->
<br/>
</g:if>
<g:else>
<br/>
&nbsp;&nbsp;&nbsp;<span style="font-size: 14px;">[<g:link action="done" id="${surveyInstance?.id}">${message(code: 'Done', default: 'Done')}</g:link>]</span>
<br/>
<br/>
</g:else>

                </div>
            </g:form>
        </div>
    </body>
</html>
