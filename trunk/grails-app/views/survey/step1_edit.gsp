<%@ page import="u56survey.Survey" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'survey.label', default: 'Survey')}" />
        <title><g:message code="step1.edit.label" default="Step1-edit" /></title>

<%--	<jv:generateValidation domain="survey" form="surveyform1"  display="alert" container="errors"/>    --%>        
		
		<g:render template="errMsgsToJson-js"/>

		<g:javascript src="check_step1.js" />
 


    </head>
    <body>
    <g:javascript>
$(document).ready(function(){
	$("input[name='q8_1']").change(function(){
	    if ($("input[name='q8_1']:checked").val() == 'yes'){
	    	$("#q8_1_which").attr("disabled", '');	    			    
	    }
	    else if ($("input[name='q8_1']:checked").val() == 'no'){
	    	$("#q8_1_which").val('');
	    	$("#q8_1_which").attr("disabled", true);	  
	    }
	});
	$("input[name='q8_4']").change(function(){
	    if ($("input[name='q8_4']:checked").val() == 'yes'){
	    	$("#q8_4_which").attr("disabled", '');	    			    
	    }
	    else if ($("input[name='q8_4']:checked").val() == 'no'){
	    	$("#q8_4_which").val('');
	    	$("#q8_4_which").attr("disabled", true);	  
	    }
	});	
});	
    </g:javascript>    
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <%--<span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span> --%>
            <span class="menuButton"><g:render template="/common/step_meter"/></span>
        </div>
        <div class="body">
            <h1><g:message code="step1.edit.label" default="Step1-edit" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
<!-- 					onsubmit="return (checkIfDOBentered() && checkIfcomplete() && validateForm(this) );"  
    -->
<div id="errors" class="errors" style="display:none;">
</div>
            <g:form name="surveyform1"
					onsubmit="return (checkForm1());"
            		method="post" >
                <g:hiddenField name="id" value="${surveyInstance?.id}" />
                <g:hiddenField name="version" value="${surveyInstance?.version}" />
                <g:hiddenField name="step" value="${step}" />
                <g:hiddenField name="surveyer" value="${session.user.login}" />
                
                <div class="dialog">
                <br/><h3>&nbsp;&nbsp;<g:message code="survey.ic_number" default="ICN" />: <g:textField disabled="true" name="consentNumSurv" value="${surveyInstance?.consentNumSurv}" />-<g:select disabled="true" name="consentNumLoc" from="${surveyInstance.constraints.consentNumLoc.inList}" value="${surveyInstance?.consentNumLoc}" valueMessagePrefix="survey.consentNumLoc"  />-<g:textField disabled="true" name="consentNum" value="${surveyInstance?.consentNum}" /></h3><br/>
                <br/><h3>&nbsp;&nbsp;<g:message code="survey.first_question" default="being_treated_for_cancer" /></h3>
                <br/>
                <ul><g:radioGroup name="being_treated_for_cancer"
                                  value="${surveyInstance?.being_treated_for_cancer}" 
                                  labels="[g.message(code:'survey.yes'),g.message(code:'survey.no')]"
                                  values="['yes','no']" >
                               
				<g:render template="/common/checkmark_radio" model="[it:it]"/>
				</g:radioGroup>
				</ul>	                
                    <table class="box-table-b-wide">
                        <tbody>
                             <tr class="prop">
                                <td valign="top" class="name" style="width:20%;font-weight:bold;">
                                    <label for="sex"><g:message code="survey.q1" default="Sex" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'sex', 'errors')}">
                                <%
								def sexlbls= [message(code:"survey.q1.male"),message(code:"survey.q1.female")]
								 %>
                                    <g:radioGroup name="sex"
                                     labels="${sexlbls }" 
                                     values="['male','female']"
 									 value="${surveyInstance?.sex}" >
										<g:render template="/common/checkmark_radio" model="[it:it]" />
									</g:radioGroup>                                                                    
                                </td>
                            </tr>                       
                            <tr class="prop">
                                <td valign="top" class="name" style="font-weight:bold;">
                                	<ul>
                                    <label for="DOB"><g:message code="survey.DOB.label" default="DOB" /></label>
                                    </ul>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'DOB', 'errors')}">
                                    <g:kimsiDatePicker name="DOB" precision="day" value="${surveyInstance?.DOB}"
                                      years="${thisyear..1900}" default="none" noSelection="${['':'--']}" />
                                </td>
                            </tr>
                            <% def RaceList=[message(code:"survey.race.white"),
											message(code:"survey.race.black"),
											message(code:"survey.race.asian"),
											message(code:"survey.race.pacific"),
											message(code:"survey.race.native"),
											message(code:"survey.race.donotknow"),
											message(code:"survey.race.noanswer"),
											message(code:"survey.race.other")]
							 %>
                            <tr class="prop">
                                <td valign="top" class="name" style="font-weight:bold;">
									<label for="race"><g:message code="survey.q_race" default="race" /></label>                              
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'race', 'errors')}">
                                    <g:radioGroup name="race"
                                    labels="${RaceList }"
                                    values="['white', 'black', 'asian', 'pacific', 'native', 'donotknow', 'noanswer', 'other']"
                                    value="${surveyInstance?.race}">
										<g:render template="/common/checkmark_radio_v" model="[it:it]" />
										<g:if test="${it.label==message(code:'survey.race.other')}"><div class="label"><g:textField name="other_race" value="${surveyInstance?.other_race}" /></div></g:if>
										
									</g:radioGroup>                                  
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name" style="font-weight:bold;">
                                <label for="hispanic_or_latino"><g:message code="survey.q_hispanic_or_latino" default="hispanic_or_latino" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'hispanic_or_latino', 'errors')}">
                                <g:radioGroup name="hispanic_or_latino"
                                   value="${surveyInstance?.hispanic_or_latino}" 
                                   labels="[g.message(code:'survey.yes'),g.message(code:'survey.no')]"
                                   values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]" />
								</g:radioGroup>                                
                                </td>
                            </tr>                                                        

                            <tr class="prop">
                                <td valign="top" class="name" style="font-weight:bold;">
                                    <label for="addr_street1"><g:message code="survey.q2" default="q2" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'addr_street1', 'errors')}">
                                    <label style="color:red">*</label><g:message code="survey.addr_street1.label" default="Addrstreet1" />: <g:textField name="addr_street1" value="${surveyInstance?.addr_street1}" /><br/>
                                    <g:message code="survey.addr_street2.label" default="Addrstreet2" />: <g:textField name="addr_street2" value="${surveyInstance?.addr_street2}" /><br/>
                                    <label style="color:red">*</label><g:message code="survey.addr_city.label" default="Addrcity" />: <g:textField name="addr_city" value="${surveyInstance?.addr_city}" /><br/>
                                    <label style="color:red">*</label><g:message code="survey.addr_state.label" default="Addrstate" />: <g:textField name="addr_state" value="${surveyInstance?.addr_state}" /><br/>
                                    <label style="color:red">*</label><g:message code="survey.addr_zipcode.label" default="Addrzipcode" />: <g:textField name="addr_zipcode" value="${surveyInstance?.addr_zipcode}" onkeyup="postcode_validate(this.value, document.getElementById('status'));"/> <span id="status"></span>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name" style="font-weight:bold;">
                                    <label for="country"><g:message code="survey.q3" default="Country" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'country', 'errors')}">
									<%--<g:countrySelect name="country" value="${surveyInstance?.country}"
          								noSelection="['':'-Choose your country-']"/>
          							 --%>
          							 <g:select name="country" value="${surveyInstance?.country}"
          							 from="${countryNames}"
          							 optionKey="key"
          							 optionValue="value"
          							 onchange="isCountryValid(this.value);"
          							 noSelection="['':'-Choose your country-']"/> <span id="country_status"></span>
          							                                     
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name" style="font-weight:bold;">
                                    <label for="marital_status"><g:message code="survey.q4" default="Marital Status" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'marital_status', 'errors')}">
                                <%
								def mstatuslbls= [message(code:"survey.q4.married"),message(code:"survey.q4.single"),message(code:"survey.q4.divorce"),message(code:"survey.q4.consensual"),message(code:"survey.q4.widow")]
								 %>                                
                                    <g:radioGroup
                                     name="marital_status"
                                     labels="${mstatuslbls}"
                                     values="['married', 'single', 'divorce', 'consensual', 'Widow']"
                                     value="${surveyInstance?.marital_status}" >
										<g:render template="/common/checkmark_radio" model="[it:it]" />
									</g:radioGroup>                                     
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name" style="font-weight:bold;">
                                    <label for="education"><g:message code="survey.q5" default="Education" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'education', 'errors')}">
                                <%
								def edulbls=[message(code:"survey.q5.upto8"),
											message(code:"survey.q5.8to12"),
											message(code:"survey.q5.vocational"),
											message(code:"survey.q5.associate"),
											message(code:"survey.q5.bachelor"),
											message(code:"survey.q5.master"),
											message(code:"survey.q5.doctor"),
											message(code:"survey.q5.other")]
								 %>
                                    <g:radioGroup name="education"
                                    labels="${edulbls }"
                                    values="['<8', '8-12', 'vocational', 'associate', 'bachelor', 'master', 'doctor', 'other']"
                                    value="${surveyInstance?.education}">
										<g:render template="/common/checkmark_radio_v" model="[it:it]"/>
										
									</g:radioGroup>
									<%--
									<br/>
									<g:checkBox name="education_completed" value="${surveyInstance?.education_completed}"/> Completed?
									 --%>                                      
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name" style="font-weight:bold;">
                                    <label for="current_occupation"><g:message code="survey.q6" default="Currentoccupation" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'current_occupation_time', 'errors')}">
                                    <g:textField name="current_occupation" value="${surveyInstance?.current_occupation}" />&nbsp;&nbsp;&nbsp;
                                    <br/><g:message code="survey.length" default="Length" />: <g:textField name="current_occupation_time"
                                     value="${surveyInstance?.current_occupation_time}"
                                     onkeyup="checkIfValidNumber(this.value, 1, 100, document.getElementById('cjob_status'));" />
                                     <g:message code="survey.length.less.than.1yr" default="(If < 1 yrs, put 1)" /> <span id="cjob_status"></span>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name" style="font-weight:bold;">
                                    <label for="prior_job"><g:message code="survey.q7" default="Priorjob" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'prior_job_time', 'errors')}">
                                    <g:textField name="prior_job" value="${surveyInstance?.prior_job}" />&nbsp;&nbsp;&nbsp;
                                    <br/><g:message code="survey.length" default="Length" />: <g:textField name="prior_job_time"
                                     value="${surveyInstance?.prior_job_time}"
                                     onkeyup="checkIfValidNumber(this.value, 1, 100, document.getElementById('pjob_status'));" />
                                    <g:message code="survey.length.less.than.1yr" default="(If < 1 yrs, put 1)" /> <span id="pjob_status"></span>
                                </td>
                            </tr>

                                                                                    
                        </tbody>
                    </table>
                    <br/>&nbsp;&nbsp;&nbsp;<label><g:message code="survey.q8" default="q8" /></label><br/><br/>
                    <%
					def ExposureList=[message(code:"survey.q8.chemicals"),
									message(code:"survey.q8.silica"),
									message(code:"survey.q8.asbestos"),
									message(code:"survey.q8.industrialwastes"),
									message(code:"survey.q8.construction")]
					 %>
					<table class="box-table-b-wide">
						<tbody>
						<g:each in="${ExposureList }" status="i" var="exp">
						<% def idx=i+1 %>
						<tr class="prop">
							<td valign="top" class="name">
								<label for="${('q8_'+idx)}">
								<%--<g:message code="survey.${('q8_'+idx)}.label" default="${('q8_'+idx)}" /> --%>
								${exp }
								</label>
							</td>
							<td valign="top" class="value">
                                <g:radioGroup name="${('q8_'+idx)}"
                                   value="${surveyInstance?.('q8_'+idx)}" 
                                   labels="[g.message(code:'survey.q8_opt1'),g.message(code:'survey.q8_opt2')]"
                                   values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]" />
								</g:radioGroup>
								<g:if test="${exp==message(code:'survey.q8.chemicals') || exp==message(code:'survey.q8.industrialwastes') }">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<g:message code="survey.q8_which.label" default="Which ones?" /> <g:textField name="${('q8_'+idx+'_which')}" value="${surveyInstance?.('q8_'+idx+'_which')}" />
								</g:if>
							</td>
						</tr>
						</g:each>
						<tr>
						<td><g:message code="survey.q8.others" default="q8.others" /></td>
						<td><g:textField name="${('q8_'+'others')}" value="${surveyInstance?.('q8_'+'others')}" /></td>
						</tr>
						</tbody>
					</table>
                </div>
                <div id="messageBox"></div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <%--<span class="button"><input type="reset" value="${message(code: 'button.reset-all.label', default: 'reset')}"></span> --%>  
                    <%--<span class="button"><g:actionSubmit class="next" action="step2_after_update" value="${message(code: 'button.save-then-go-to-next.label', default: 'step2_after_update')}" /></span> --%>
                    <span class="button"><g:actionSubmit class="next" action="update_unified" value="${message(code: 'button.save-then-go-to-next.label', default: 'next')}" /></span>
                    <span class="menuButton"><g:render template="/common/step_meter"/></span>
                </div>
            </g:form>
        </div>
    </body>
</html>