<%@ page import="u56survey.Survey" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'survey.label', default: 'Survey')}" />
        <title>Read-only</title>
<%--
		<jv:generateValidation domain="survey" form="surveyform15"  display="list" container="errors"/>        
 --%>
 <g:javascript>
 function DisableEnableForm(xForm,xHow){
  objElems = xForm.elements;
  for(i=0;i<objElems.length;i++){
    objElems[i].disabled = xHow;
  }
}
 </g:javascript>
    </head>
    <body>
<g:javascript>
window.onload= function(){
  DisableEnableForm(document.surveyform_preview,true);
}    
</g:javascript>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <%--<span class="menuButton"><g:render template="/common/step_meter"/></span> --%>
        </div>
        <div class="body">
            <h1><g:message code="preview"/></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
<div id="errors" class="errors" style="display:none;">
</div>
            <g:form name="surveyform_preview"
					method="post" >
                <g:hiddenField name="id" value="${surveyInstance?.id}" />
                <g:hiddenField name="version" value="${surveyInstance?.version}" />
                <g:render template="/common/status_info"/>

<h1><label style="color:orange;"><g:message code="step1.label" default="Step1-new" /></label></h1>
<g:render template="/onepage/step1"/>

<h1><label style="color:orange;"><g:message code="step2.label" default="Step2" /></label></h1>
<g:render template="/onepage/step2"/>

<h1><label style="color:orange;"><g:message code="step3.label" default="Step3" /></label></h1>
<g:render template="/onepage/step3"/>

<h1><label style="color:orange;"><g:message code="step4.label" default="Step4" /></label></h1>
<g:render template="/onepage/step4"/>

<h1><label style="color:orange;"><g:message code="step5.label" default="Step5" /></label></h1>
<g:render template="/onepage/step5"/>

<h1><label style="color:orange;"><g:message code="step6.label" default="Step6" /></label></h1>
<g:render template="/onepage/step6"/>

<h1><label style="color:orange;"><g:message code="step7.label" default="Step7" /></label>  <img src="${resource(dir:'images',file:'male.gif')}" align="absmiddle" alt="male" /></h1>
<g:render template="/onepage/step7"/>

<h1><label style="color:orange;"><g:message code="step8.label" default="Step8" /></label></h1>
<g:render template="/onepage/step8"/>

<h1><label style="color:orange;"><g:message code="step9.label" default="Step9" /></label> <img src="${resource(dir:'images',file:'female.gif')}" align="absmiddle" alt="female" /></h1>
<g:render template="/onepage/step9"/>

<h1><label style="color:orange;"><g:message code="step10.label" default="Step10" /></label> <img src="${resource(dir:'images',file:'female.gif')}" align="absmiddle" alt="female" /></h1>
<g:render template="/onepage/step10"/>

<h1><label style="color:orange;"><g:message code="step11.label" default="Step11" /></label> <img src="${resource(dir:'images',file:'female.gif')}" align="absmiddle" alt="female" /></h1>
<g:render template="/onepage/step11"/>

<h1><label style="color:orange;"><g:message code="step12.label" default="Step12" /></label> <img src="${resource(dir:'images',file:'female.gif')}" align="absmiddle" alt="female" /></h1>
<g:render template="/onepage/step12"/>

<h1><label style="color:orange;"><g:message code="step13.label" default="Step13" /></label></h1>
<g:render template="/onepage/step13"/>

<h1><label style="color:orange;"><g:message code="step14.label" default="Step14" /></label></h1>
<g:render template="/onepage/step14"/>

<h1><label style="color:orange;"><g:message code="step15.label" default="Step15" /></label></h1>
<g:render template="/onepage/step15"/>
                <div class="buttons">
<%--
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'button.save-finish-later.label', default: 'update')}" /></span>
                    <span class="button"><g:actionSubmit class="back" action="step14" value="${message(code: 'button.go-back.label', default: 'back')}" /></span>
                    <span class="button"><input type="reset" value="${message(code: 'button.reset-all.label', default: 'reset')}"></span>
                     
                    <span class="button"><g:actionSubmit class="done" action="done" value="${message(code: 'Done', default: 'Done.')}" /></span>

 <br/>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 14px;">[<g:link action="done" id="${surveyInstance?.id}">${message(code: 'Done', default: 'Done')}</g:link>]</span>
 --%> 
<br/><br/>

                </div>
            </g:form>
        </div>
    </body>
</html>
