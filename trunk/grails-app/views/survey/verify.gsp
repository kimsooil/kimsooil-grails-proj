<%@ page import="u56survey.Survey" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'survey.label', default: 'Survey')}" />
        <title><g:message code="verify"/></title>

<%--		<jv:generateValidation domain="surveyCompleted" form="verifyform"  display="alert" container="errors"/>  --%> 

		<g:render template="errMsgsToJson-js"/>
		
		<g:javascript src="checkVerifyForm.js" /> 

    </head>
    <body>
<g:javascript>
$(document).ready(function(){
	$.jqDialog.alert('<p align="center"><img src="${resource(dir:'images',file:'important.gif')}" align="absmiddle" alt="important" /><br/><label style="color:red"><g:message code="verify.important.message1" /><br/><br><g:message code="verify.important.message2" /></label><br/></p>');
});
</g:javascript>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:render template="/common/step_meter"/></span>
        </div>
        <div class="body">
            <h1><g:message code="verify"/></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
<div id="errors" class="errors" style="display:none;">
</div>
<%-- onsubmit="return (checkIfDOBentered() && checkIfcomplete() && validateForm(this));" --%>

            <g:form name="verifyform"
            		onsubmit="return checkVerifyForm();"
					method="post" >
                <g:hiddenField name="id" value="${surveyInstance?.id}" />
                <g:hiddenField name="version" value="${surveyInstance?.version}" />
                <g:hiddenField name="consentNum" value="${surveyInstance?.consentNum}" />
                <g:render template="/common/status_info"/>

<h1><g:link action="step1_edit" id="${surveyInstance?.id}"><label style="color:red;"><g:message code="step1.label" default="Step1-new" /></label></g:link></h1>
<div>
<g:render template="/onepage/step1"/>

<h1><g:link action="step2" id="${surveyInstance?.id}"><label style="color:red;"><g:message code="step2.label" default="Step2" /></label></g:link></h1>
<g:render template="/onepage/step2"/>

<h1><g:link action="step3" id="${surveyInstance?.id}"><label style="color:red;"><g:message code="step3.label" default="Step3" /></label></g:link></h1>
<g:render template="/onepage/step3"/>

<h1><g:link action="step4" id="${surveyInstance?.id}"><label style="color:red;"><g:message code="step4.label" default="Step4" /></label></g:link></h1>
<g:render template="/onepage/step4"/>

<h1><g:link action="step5" id="${surveyInstance?.id}"><label style="color:red;"><g:message code="step5.label" default="Step5" /></label></g:link></h1>
<g:render template="/onepage/step5"/>

<h1><g:link action="step6" id="${surveyInstance?.id}"><label style="color:red;"><g:message code="step6.label" default="Step6" /></label></g:link></h1>
<g:render template="/onepage/step6"/>

<h1><g:link action="step7" id="${surveyInstance?.id}"><label style="color:red;"><g:message code="step7.label" default="Step7" /></label></g:link>  <img src="${resource(dir:'images',file:'male.gif')}" align="absmiddle" alt="male" /></h1>
<g:render template="/onepage/step7"/>

<h1><g:link action="step8" id="${surveyInstance?.id}"><label style="color:red;"><g:message code="step8.label" default="Step8" /></label></g:link></h1>
<g:render template="/onepage/step8"/>

<h1><g:link action="step9" id="${surveyInstance?.id}"><label style="color:red;"><g:message code="step9.label" default="Step9" /></label></g:link> <img src="${resource(dir:'images',file:'female.gif')}" align="absmiddle" alt="female" /></h1>
<g:render template="/onepage/step9"/>

<h1><g:link action="step10" id="${surveyInstance?.id}"><label style="color:red;"><g:message code="step10.label" default="Step10" /></label></g:link> <img src="${resource(dir:'images',file:'female.gif')}" align="absmiddle" alt="female" /></h1>
<g:render template="/onepage/step10"/>

<h1><g:link action="step11" id="${surveyInstance?.id}"><label style="color:red;"><g:message code="step11.label" default="Step11" /></label></g:link> <img src="${resource(dir:'images',file:'female.gif')}" align="absmiddle" alt="female" /></h1>
<g:render template="/onepage/step11"/>

<h1><g:link action="step12" id="${surveyInstance?.id}"><label style="color:red;"><g:message code="step12.label" default="Step12" /></label></g:link></h1>
<g:render template="/onepage/step12"/>

<h1><g:link action="step13" id="${surveyInstance?.id}"><label style="color:red;"><g:message code="step13.label" default="Step13" /></label></g:link></h1>
<g:render template="/onepage/step13"/>

<h1><g:link action="step14" id="${surveyInstance?.id}"><label style="color:red;"><g:message code="step14.label" default="Step14" /></label></g:link></h1>
<g:render template="/onepage/step14"/>

<h1><g:link action="step15" id="${surveyInstance?.id}"><label style="color:red;"><g:message code="step15.label" default="Step15" /></label></g:link></h1>
<g:render template="/onepage/step15"/>
                <div class="buttons">

                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'button.save-finish-later.label', default: 'update')}" /></span>
                    <span class="button"><g:actionSubmit class="back" action="step15" value="${message(code: 'button.go-back.label', default: 'back')}" /></span>
                    <span class="button"><input type="reset" value="${message(code: 'button.reset-all.label', default: 'reset')}"></span>
                    <span class="button"><g:actionSubmit class="complete" action="completed" value="${message(code: 'complete', default: 'Complete')}" /></span>
<%-- 
 <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[<g:link action="completed" id="${surveyInstance?.id}">${message(code: 'complete', default: 'Complete')}</g:link>]</span>
<br/><br/>
 --%>
                </div>
            </g:form>
        </div>
    </body>
</html>
