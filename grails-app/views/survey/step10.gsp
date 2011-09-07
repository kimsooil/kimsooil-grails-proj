<%@ page import="u56survey.Survey" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'survey.label', default: 'Survey')}" />
        <title><g:message code="step10.label" default="Step10" /></title>

		<%--<jv:generateValidation domain="survey" form="surveyform10"  display="list" container="errors"/> --%>  

		<g:render template="errMsgsToJson-js"/>

		<g:javascript src="check_step10.js" />       
			
    </head>
    <body>
<%
	def birth=surveyInstance?.DOB ? surveyInstance?.DOB : new Date()
	//out << "dob="+birth[java.util.Calendar.YEAR]+"<br/>"
	def today=new Date() 		
	//out << "today="+today[java.util.Calendar.YEAR]+"<br/>"
%>	    
<g:javascript>

<g:if test="${surveyInstance?.sex!='female' }">
window.onload= function(){
  DisableEnableForm(document.surveyform10,true);
  $("[name=_action_update]").attr("disabled", false);
  $("[name=_action_step9]").attr("disabled", false);
  $("[name=_action_update_unified]").attr("disabled", false);
}   
</g:if>
function IsDateQ71Valid()
{
	if ( ($("#q71_year").val() == "<%=today[java.util.Calendar.YEAR]%>")  &&
		(parseInt($("#q71_month").val()) > <%=today[java.util.Calendar.MONTH]+1%>)
	){
		return false;
	}
	else if ( ($("#q71_year").val() == "<%=birth[java.util.Calendar.YEAR]%>")  &&
		(parseInt($("#q71_month").val()) < <%=birth[java.util.Calendar.MONTH]+1%>)
	){
		return false;
	}
	else {
		return true;
	}
}
$(document).ready(function(){

$.jqDialog.alert('<p align="center"><img src="${resource(dir:'images',file:'female.gif')}" align="absmiddle" alt="female" /><br/><g:message code="female.only.page" /><br/></p>');

	$("input[name='q59']").change(function(){
	    if ($("input[name='q59']:checked").val() == 'yes'){
	    	$("[name*='q59_']").attr("disabled", '');    			    
	    }
	    else if ($("input[name='q59']:checked").val() == 'no'){
	    	$("[name*='q59_']").val('');
	    	$("[name*='q59_']").attr("disabled", true);	  
	    }
	});
	$("input[name='q60']").change(function(){
	    if ($("input[name='q60']:checked").val() == 'yes'){
	    	$("[name*='q61_whatAge']").attr("disabled", '');
	    	$("[name*='q61']").attr("disabled", '');	      			    
	    }
	    else if ($("input[name='q60']:checked").val() == 'no'){
	    	$("[name*='q61_whatAge']").val('');
	    	$("[name*='q61_whatAge']").attr("disabled", true);
	    	$("[name*='q61']").attr("checked", false);
	    	$("[name*='q61']").attr("disabled", true);	  
	    }
	});
	$("input[name='q62']").change(function(){
	    if ($("input[name='q62']:checked").val() == 'yes'){
	    	$("[name*='q63']").attr("disabled", '');    			    
	    	$("[name*='q64']").attr("disabled", '');
	    	$("[name*='q65']").attr("disabled", '');
	    	$("[name*='q66']").val('');
	    	if ($("input[name='q63']:checked").val() == 'yes'){
	    		$("[name*='q66InMenopause']").attr('checked', false);
	    	 	$("[name*='q66InMenopause']").attr("disabled", true);
	    	 }	 
	    }
	    else if ($("input[name='q62']:checked").val() == 'no'){
	    	$("[name*='q63']").attr('checked', false);
	    	$("[name*='q63']").attr("disabled", true);	  
	    	$("[name*='q64']").val('');
	    	$("[name*='q64']").attr("disabled", true);	  
	    	$("[name*='q65']").val('');
	    	$("[name*='q65']").attr("disabled", true);	  
	    	$("[name*='q66InMenopause']").attr("disabled", ''); 
	    }
	});
	$("input[name='q63']").change(function(){
	    if ($("input[name='q63']:checked").val() == 'yes'){
	    	if ($("input[name='q62']:checked").val() == 'yes'){
	    		$("[name*='q66InMenopause']").attr('checked', false);
	    		$("[name*='q66InMenopause']").attr("disabled", true);
	    		
	    	}	 
	    }
	    else if ($("input[name='q63']:checked").val() == 'no'){

	    	$("[name*='q66InMenopause']").attr("disabled", ''); 
	    }
	});
	$("input[name='q66']").change(function(){
		if ($("input[name='q66']:checked").val() == 'no' && $("input[name='q67']:checked").val() == 'no'){
	    	$("#q68").val('');
	    	$("#q68").attr("disabled", true);	  

	    }
	    else {
	    	$("#q68").attr("disabled", '');
	    }
	});
	$("input[name='q67']").change(function(){
		if ($("input[name='q67']:checked").val() == 'no'){
	    	$("#q68").val('');	  
			$("#q68").attr("disabled", true)
	    }
	    else {
	    	$("#q68").attr("disabled", '');
	    }
	    
	});
	$("input[name='q69']").change(function(){
	    if ($("input[name='q69']:checked").val() == 'yes'){
			$("[name*='q69_']").attr("disabled", '');
	    }
	    else if ($("input[name='q69']:checked").val() == 'no'){
	    	$("[name*='q69_']").val('');
	    	$("[name*='q69_']").attr("disabled", true);	  
	    }
	});
	$("#q71_month").change(function() {
			if (!IsDateQ71Valid())
			{
				$('#alertIfInvalid').attr('innerHTML', " <label style='color:#ff0000'>(!)</label>");
				$("q71_month").focus();
			}
			else {
				$('#alertIfInvalid').attr('innerHTML', "");
			}	
		}
	);
	$("#q71_year").change(function() {
			if (!IsDateQ71Valid())
			{
				$('#alertIfInvalid').attr('innerHTML', " <label style='color:#ff0000'>(!)</label>");
				$("#q71_year").focus();
			}
			else {
				$('#alertIfInvalid').attr('innerHTML', "");
			}	
		}
	);	
								
});	
</g:javascript>    
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:render template="/common/step_meter"/></span>
        </div>
        <div class="body">
            <h1><g:message code="step10.label" default="Step10" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
<div id="errors" class="errors" style="display:none;">
</div>
            <g:form name="surveyform10"
            		onsubmit="return checkForm10();"
            		method="post" >
                <g:hiddenField name="id" value="${surveyInstance?.id}" />
                <g:hiddenField name="version" value="${surveyInstance?.version}" />
                <g:render template="/common/status_info" model="['dob':surveyInstance?.DOB]"/>
                <div class="dialog">
					<%
					def yesno=[message(code:'survey.yes'), message(code:'survey.no')]     
					%>
					<br/>&nbsp;&nbsp;&nbsp;(<label style="color:blue">*</label>: Optional)           
                    <table class="box-table-b-wide">
                        <tbody>
	                    <tr>
	                    	<td style="width:40%;font-weight:bold;"><label><g:message code="survey.q54" default="q54" /></label></td>
	                    	<td style="width:60%">
		                    	<label style="color:blue">*</label> <g:textField name="q54"
											 value="${surveyInstance?.q54}" 
											 onkeyup="checkIfValidNumber(this.value, 1, 99, document.getElementById(\'q54_status\')); "/> <span id="q54_status"></span>
	                    	</td>
	                    </tr>
	                    <tr>
	                    	<td style="width:40%;font-weight:bold;"><label><g:message code="survey.q55" default="q55" /></label></td>
	                    	<td style="width:60%">
		                    	<label style="color:blue">*</label> <g:message code="survey.q55.every" default="every" /> 
		                    	<g:textField name="q55" 
		                    				 value="${surveyInstance?.q55}"
		                    				 onkeyup="checkIfValidNumber(this.value, 10, 365, document.getElementById(\'q55_status\')); "/>
		                    				  <g:message code="survey.q55.days" default="days" /> <span id="q55_status"></span>
	                    	</td>
	                    </tr>
	                    <tr>
	                    	<td style="width:40%;font-weight:bold;"><label><g:message code="survey.q56" default="q56" /></label></td>
	                    	<td style="width:60%">
		                    	<label style="color:blue">*</label> <g:textField name="q56"
		                    	value="${surveyInstance?.q56}" 
								onkeyup="checkIfValidNumber(this.value, 1, 365, document.getElementById(\'q56_status\')); "/> <g:message code="survey.q55.days" default="days" /> <span id="q56_status"></span>
	                    	</td>
	                    </tr>
	                    <tr>
	                    	<td style="width:40%;font-weight:bold;"><label><g:message code="survey.q57" default="q57" /></label></td>
	                    	<td style="width:60%">
	                        	<label style="color:blue">*</label> <g:radioGroup name="q57"
	                            	value="${surveyInstance?.q57}" 
	                                labels="${yesno }" 
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>
							</td>
						</tr>
	                    <tr>
	                    	<td style="width:40%;font-weight:bold;"><label><g:message code="survey.q58" default="q58" /></label></td>
	                    	<td style="width:60%">
	                        	<label style="color:blue">*</label> <g:radioGroup name="q58"
	                            	value="${surveyInstance?.q58}" 
	                                labels="${yesno }"
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>
							</td>
						</tr>
						</tbody>
						</table>
						
	                    <table class="box-table-b-wide">
                        <tbody>
	                    <tr>
	                    	<td style="width:40%;font-weight:bold;"><label><g:message code="survey.q59" default="q59" /></label></td>
	                    	<td style="width:60%">
	                        	<g:radioGroup name="q59"
	                            	value="${surveyInstance?.q59}" 
	                                labels="${yesno }"
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>
								<div style="clear:left">
								<br/><g:message code="survey.ifyeswhy" default="If yes, why?" /> <g:textField name="q59_why" 
																											  value="${surveyInstance?.q59_why}" 
																										      onkeyup="checkIfNumberOnly(this.value, document.getElementById(\'${('q59_why_status')}\')); "/> <span id="${('q59_why_status')}"></span>&nbsp;&nbsp;&nbsp;
								<br/><g:message code="survey.atwhatage" default="At what age" /> <g:textField name="q59_whatAge" 
																										      value="${surveyInstance?.q59_whatAge}" 
																										      onkeyup="checkIfValidNumber(this.value, 1, ageCalculated, document.getElementById(\'q59_whatAge_status\')); "/> <span id="q59_whatAge_status"></span>
								</div>
							</td>
						</tr>
	                    <tr>
	                    	<td style="width:40%;font-weight:bold;"><label><g:message code="survey.q60" default="q60" /></label></td>
	                    	<td style="width:60%">
	                        	<g:radioGroup name="q60"
	                            	value="${surveyInstance?.q60}" 
	                                labels="${yesno }"
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>
							</td>
						</tr>
	                    <tr>
	                    	<td style="width:40%;font-weight:bold;"><label><g:message code="survey.q61" default="q61" /></label></td>
	                    	<td style="width:60%">
	                        	<g:radioGroup name="q61"
	                            	value="${surveyInstance?.q61}" 
	                                labels="${yesno }"
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>&nbsp;&nbsp;&nbsp;
								<g:message code="survey.atwhatage" default="At what age" /> <g:textField name="q61_whatAge" 
																										 value="${surveyInstance?.q61_whatAge}"
																										 onkeyup="checkIfValidNumber(this.value, 1, ageCalculated, document.getElementById(\'q61_whatAge_status\')); "/> <span id="q61_whatAge_status"></span>
							</td>
						</tr>
	                    <tr>
	                    	<td style="width:40%;font-weight:bold;"><label><g:message code="survey.q62" default="q62" /></label></td>
	                    	<td style="width:60%">
	                        	<g:radioGroup name="q62"
	                            	value="${surveyInstance?.q62}" 
	                                labels="${yesno }"
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>
							</td>
						</tr>
	                    <tr>
	                    	<td style="width:40%;font-weight:bold;"><label><g:message code="survey.q63" default="q63" /></label></td>
	                    	<td style="width:60%">
	                        	<g:radioGroup name="q63"
	                            	value="${surveyInstance?.q63}" 
	                                labels="${yesno }"
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>
							</td>
						</tr>
	                    <tr>
	                    	<td style="width:40%;font-weight:bold;"><label><g:message code="survey.q64" default="q64" /></label></td>
	                    	<td style="width:60%">
		                    	<g:textField name="q64"
		                    				 value="${surveyInstance?.q64}"
		                    				 onkeyup="checkIfNumberOnly(this.value, document.getElementById(\'${('q64_status')}\')); "/> <span id="${('q64_status')}"></span>
	                    	</td>
	                    </tr>
	                    <tr>
	                    	<td style="width:40%;font-weight:bold;"><label><g:message code="survey.q65" default="q65" /></label></td>
	                    	<td style="width:60%">
		                    	<g:textField name="q65" value="${surveyInstance?.q65}" onkeyup="checkIfValidNumber(this.value, 1, ageCalculated, document.getElementById(\'q65_status\')); "/> <span id="q65_status"></span>
	                    	</td>
	                    </tr>
	                    <tr>
	                    	<td style="width:40%;font-weight:bold;"><label><g:message code="survey.q66" default="q66" /></label></td>
	                    	<td style="width:60%">
	                        	<g:radioGroup name="q66InMenopause"
	                            	value="${surveyInstance?.q66InMenopause}" 
	                                labels="${yesno }"
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>
							</td>
						</tr>
	                    <tr>
	                    	<td style="width:40%;font-weight:bold;"><label><g:message code="survey.q67" default="q67" /></label></td>
	                    	<td style="width:60%">
	                        	<g:radioGroup name="q67"
	                            	value="${surveyInstance?.q67}" 
	                                labels="${yesno }"
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>
							</td>
						</tr>
	                    <tr>
	                    	<td style="width:40%;font-weight:bold;"><label><g:message code="survey.q68" default="q68" /></label></td>
	                    	<td style="width:60%">
		                    	<g:textField name="q68" value="${surveyInstance?.q68}" onkeyup="checkIfValidNumber(this.value, 1, ageCalculated, document.getElementById(\'q68_status\')); "/> <g:message code="survey.years" default="years" /> <span id="q68_status"></span>
	                    	</td>
	                    </tr>
	                    <tr>
	                    	<td style="width:40%;font-weight:bold;"><label><g:message code="survey.q69" default="q69" /></label></td>
	                    	<td style="width:60%">
	                        	<g:radioGroup name="q69"
	                            	value="${surveyInstance?.q69}" 
	                                labels="${yesno }"
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>
								<div style="clear:left">
								<br/><g:message code="survey.whichone" default="Which one" /> <g:textField name="q69_which" 
																										   value="${surveyInstance?.q69_which}"
																										   onkeyup="checkIfNumberOnly(this.value, document.getElementById(\'${('q69_which_status')}\')); "/> <span id="${('q69_which_status')}"></span>&nbsp;&nbsp;&nbsp;
								<br/><g:message code="survey.forwhat" default="For what" /> <g:textField name="q69_forWhat" 
																									     value="${surveyInstance?.q69_forWhat}"
																									     onkeyup="checkIfNumberOnly(this.value, document.getElementById(\'${('q69_forWhat_status')}\')); "/> <span id="${('q69_forWhat_status')}"></span>&nbsp;&nbsp;&nbsp;
								<br/><g:message code="survey.atwhatageyoustarted" default="At what age you started?" /> <g:textField name="q69_whatAgeStarted" 
																																	 value="${surveyInstance?.q69_whatAgeStarted}" 
																																	 onkeyup="checkIfValidNumber(this.value, 1, ageCalculated, document.getElementById(\'q69_age_status\')); "/> <span id="q69_age_status"></span>
								</div>
							</td>
						</tr>
	                    <tr>
	                    	<td style="width:40%;font-weight:bold;"><label><g:message code="survey.q70" default="q70" /></label></td>
	                    	<td style="width:60%">
	                        	<g:radioGroup name="q70"
	                            	value="${surveyInstance?.q70}" 
	                                labels="${yesno }"
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>
							</td>
						</tr>
                    <tr>
                    	<td style="width:40%;font-weight:bold;"><label><g:message code="survey.q71" default="q71" /></label></td>
                    	<td style="width:60%">
							<g:datePicker name="q71" precision="month" value="${surveyInstance?.q71}"  
                                      years="${thisyear..birth[java.util.Calendar.YEAR]}" default="none" noSelection="${['':'--']}" />  <span id="alertIfInvalid"></span>
                    	</td>
                    </tr>
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'button.save-finish-later.label', default: 'update')}"  onclick="DisableEnableForm(document.surveyform10,false);" /></span>
                    <span class="button"><g:actionSubmit class="back" action="step9" value="${message(code: 'button.go-back.label', default: 'back')}"  onclick="DisableEnableForm(document.surveyform10,false);" /></span>
                    <%--<span class="button"><g:render template="/common/back_button"/></span>
                    <span class="button"><input type="reset" value="${message(code: 'button.reset-all.label', default: 'reset')}"></span> --%>  
                    <g:if test="${surveyInstance?.sex=='female' }">  
                    	<span class="button"><g:actionSubmit class="next" action="update_unified" value="${message(code: 'button.save-then-go-to-next.label', default: 'next')}"  onclick="DisableEnableForm(document.surveyform10,false);" /></span>
                    </g:if>
                    <g:else>
                    	<g:link action="step11" id="${surveyInstance?.id}"><label style="color:green"><g:message code='button.save-then-go-to-next.label'/></label></g:link>
                    </g:else>
                    <span class="menuButton"><g:render template="/common/step_meter"/></span>
                 </div>
            </g:form>
        </div>
    </body>
</html>
