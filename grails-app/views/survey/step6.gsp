<%@ page import="u56survey.Survey" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'survey.label', default: 'Survey')}" />
        <title><g:message code="step6.label" default="Step6" /></title>

		<g:render template="errMsgsToJson-js"/>

		<g:javascript src="check_step6.js" />       
		       
    </head>
    <body>
<g:javascript>
$(document).ready(function(){ 
	$("input[name='q26']").change(function(){
	    if ($("input[name='q26']:checked").val() == 'yes'){
  			$("#q26_explain").attr("disabled", '');
	    }
	    else if ($("input[name='q26']:checked").val() == 'no'){
	    	$("#q26_explain").val('');
	    	$("#q26_explain").attr("disabled", true);	    	
	    }
	});
	$("#mode").change(function() {
		if ($("#mode").val()=='paper'){
			$('body').css('background-color', '#CCCCCC');
		}
		else{
			$('body').css('background-color', '#FFF8DC');
		}
	});			    
});	
</g:javascript>    
            <g:form name="surveyform6"
            		method="post"
            		onsubmit="if (document.getElementById('mode').value!='paper'){ return (checkForm6());} else {return confirmIfSure();}" >

    <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><img src="${resource(dir:'images/skin',file:'house.png')}" alt="house.png"  border="0" /></a></span>
            <span class="menuButton"><g:render template="/common/step_meter"/></span>
            <g:if test="${surveyInstance?.mode=='paper'}"> 
              <span class="menuButton"><label style="color:red;"> Validation=OFF</label></span>
            </g:if>
            <g:else>
              <span class="menuButton"><label style="color:green;">Validation=ON</label></span>
            </g:else>

        </div>
        <div class="body">
<g:javascript>
$(document).ready(function(){ 
	if ($("#mode").val()=='paper'){
			$('body').css('background-color', '#CCCCCC');
	}
	    if ($("input[name='q26']:checked").val() == 'yes'){
  			$("#q26_explain").attr("disabled", '');
	    }
	    else if ($("input[name='q26']:checked").val() == 'no'){
	    	$("#q26_explain").val('');
	    	$("#q26_explain").attr("disabled", true);	    	
	    }

	    
});	
</g:javascript>          
            <h1><g:message code="step6.label" default="Step6" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${surveyInstance}">
            <div class="errors">
                <g:renderErrors bean="${surveyInstance}" as="list" />
            </div>
            </g:hasErrors>
                <g:hiddenField name="id" value="${surveyInstance?.id}" />
                <g:hiddenField name="version" value="${surveyInstance?.version}" />
                <g:hiddenField name="mode" value="${surveyInstance?.mode}" />

                <g:render template="/common/status_info" model="['dob':surveyInstance?.DOB]"/>
                <div class="dialog">
                    <%
						def yesno=[message(code:'survey.yes'), message(code:'survey.no')]
					%>                
                    <table class="box-table-b-wide">
                        <tbody>
                            <tr class="prop">
                                <td valign="top" style="width:60%;font-weight: bold;">
                                    <label for="q24_HowDoYouFeelRightNow"><g:message code="survey.q24" default="HowDoYouFeelRightNow" /></label>
                                </td>
                                <td valign="top" class="${hasErrors(bean: surveyInstance, field: 'q24_howDoYouFeelRightNow', 'errors')}">
                                <%
								def feelingList=[message(code:"survey.q24.calm"),
									message(code:"survey.q24.muchEnergy"),
									message(code:"survey.q24.desolation"),
									message(code:"survey.q24.sadness")]
								 %>
                                    <g:radioGroup name="q24_howDoYouFeelRightNow"
                                     value="${surveyInstance?.q24_howDoYouFeelRightNow }"
                                     labels="${feelingList }" 
                                     values="['calm','much_energy', 'desolation', 'sadness']" >
										<g:render template="/common/checkmark_radio_v" model="[it:it]"/>
									</g:radioGroup>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" style="font-weight: bold;">
                                    <label for="q25_howHaveYouFeltForPast4Weeks"><g:message code="survey.q25" default="howHaveYouFeltForPast4Weeks" /></label>
                                </td>
                                <td valign="top" class="${hasErrors(bean: surveyInstance, field: 'q25_howHaveYouFeltForPast4Weeks', 'errors')}">
                                    <g:textField name="q25_howHaveYouFeltForPast4Weeks"
												 value="${surveyInstance?.q25_howHaveYouFeltForPast4Weeks}"
												 onkeyup="checkIfNumberOnly(this.value, document.getElementById(\'${('q25_status')}\')); "/> <span id="${('q25_status')}"></span> 

                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" style="font-weight: bold;">
                                    <label for="q26"><g:message code="survey.q26" default="in the past 3 months have you had any health problem" /></label>
                                </td>
                                <td valign="top" class="${hasErrors(bean: surveyInstance, field: 'q26', 'errors')}">
                                    <g:radioGroup name="q26"
                                     value="${surveyInstance?.q26 }"
                                     labels="${yesno }" 
                                     values="['yes', 'no']" >
										<g:render template="/common/checkmark_radio" model="[it:it]"/>
									</g:radioGroup>
									<div  style="clear:left">
									<br/><g:message code="survey.q26.ifyesexplain" default="If yes, explain"/>: <g:textField name="q26_explain"
																															 value="${surveyInstance?.q26_explain}"
																															 onkeyup="checkIfNumberOnly(this.value, document.getElementById(\'${('q26_status')}\')); "/> <span id="${('q26_status')}"></span>
									</div>
                                </td>
                            </tr>                                                                                   
                            <tr class="prop">
                                <td valign="top" style="font-weight: bold;">
                                    <label for="q27"><g:message code="survey.q27" default="Does your health affect your social activities?" /></label>
                                </td>
                                <td valign="top" class="${hasErrors(bean: surveyInstance, field: 'q27', 'errors')}">
                                    <g:radioGroup name="q27"
                                     value="${surveyInstance?.q27 }"
                                     labels="${yesno }" 
                                     values="['yes', 'no']" >
										<g:render template="/common/checkmark_radio" model="[it:it]"/>
									</g:radioGroup>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" style="font-weight: bold;">
                                    <label for="q28"><g:message code="survey.q28" default="How is your health?" /></label>
                                </td>
                                <td valign="top" class="${hasErrors(bean: surveyInstance, field: 'q28', 'errors')}">
                                <%
								def healthList=[message(code:"survey.q28.excellent"),
									message(code:"survey.q28.veryGood"),
									message(code:"survey.q28.good"),
									message(code:"survey.q28.regular"),
									message(code:"survey.q28.poor")]
								 %>
                                    <g:radioGroup name="q28"
                                     value="${surveyInstance?.q28 }"
                                     labels="${healthList }" 
                                     values="['excellent', 'very_good', 'good', 'regular', 'poor']" >
										<g:render template="/common/checkmark_radio_v" model="[it:it]"/>
									</g:radioGroup>
                                </td>
                            </tr>                                                                                                                                            
                        </tbody>
                    </table>
                    <br/><ul><label><g:message code="survey.q29" default="q29" /></label></ul>
                    
                    <%
					def PsychoDiagnosisList=["Depression", 
						"Dementia", "Schizophrenia", "Attention Deficit Disorder", 
						"Maniac-Depressive Disorder", "Obsessive-Compulsive Disorder", "Other:"]
					def PsychoDiagnosisList2=[message(code:"survey.q29.1"),
						message(code:"survey.q29.2"),
						message(code:"survey.q29.3"),
						message(code:"survey.q29.4"),
						message(code:"survey.q29.5"),
						message(code:"survey.q29.6"),
						message(code:"survey.q29.7")]
					 %>
                    <table class="box-table-b-wide">
                    <thead>
                    <tr>
                    	<th><g:message code="survey.q29.diagnosis" default="Diagnosis" /></th>
                    	<th><g:message code="survey.yesno" default="Yes / No" /></th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${PsychoDiagnosisList2 }" status="i" var="diagnosis">
                    <% def idx=i+1 %>
                    <tr>
                    	<td style="width:60%;font-weight: bold;">
                    	${diagnosis }
                    	<g:if test="${diagnosis==message(code:'survey.q29.7') }">
                    		<g:textField name="q29_other" value="${surveyInstance?.q29_other}" />
                    	</g:if>
                    	</td>
                    	<td>
                        	<g:radioGroup name="${('q29_'+idx)}"
                            	value="${surveyInstance?.('q29_'+idx)}" 
                                labels="${yesno }"  
                                values="['yes','no']" >
								<g:render template="/common/checkmark_radio" model="[it:it]"/>
							</g:radioGroup>
                    	</td>
                    </tr>
                    </g:each>
                    </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'button.save-finish-later.label', default: 'update')}"  onclick="DisableEnableForm(document.surveyform6,false);" /></span>
                    <span class="button"><g:actionSubmit class="back" action="step5" value="${message(code: 'button.go-back.label', default: 'back')}"  onclick="DisableEnableForm(document.surveyform6,false);" /></span>
                    <%--<span class="button"><g:render template="/common/back_button"/></span>
                    <span class="button"><input type="reset" value="${message(code: 'button.reset-all.label', default: 'reset')}"></span> --%>  
                    <span class="button"><g:actionSubmit class="next" action="update_unified" value="${message(code: 'button.save-then-go-to-next.label', default: 'next')}"  onclick="DisableEnableForm(document.surveyform6,false);" /></span>
                    <span class="menuButton"><g:render template="/common/step_meter"/></span>
                 </div>
            </g:form>
        </div>
    </body>
</html>
