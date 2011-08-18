<%@ page import="u56survey.Survey" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'survey.label', default: 'Survey')}" />
        <title><g:message code="step11.label" default="Step11" /></title>

		<%--<jv:generateValidation domain="survey" form="surveyform11"  display="list" container="errors"/> --%>
		  
		<g:render template="errMsgsToJson-js"/>

		<g:javascript src="check_step11.js" />  

    </head>
    <body>
<g:javascript>

<g:if test="${surveyInstance?.sex!='female' }">
window.onload= function(){
  DisableEnableForm(document.surveyform11,true);
  $("[name=_action_update]").attr("disabled", false);
  $("[name=_action_step10]").attr("disabled", false);
  $("[name=_action_update_unified]").attr("disabled", false);  
}   
</g:if>

$(document).ready(function(){

$.jqDialog.alert('<p align="center"><img src="${resource(dir:'images',file:'female.gif')}" align="absmiddle" alt="female" /><br/><g:message code="female.only.page" /><br/></p>');

	$("input[name='q72']").change(function(){
	    if ($("input[name='q72']:checked").val() == 'yes'){
	    	$("#q72_status").html(" <font color='blue'>Answer Q78-Q83</font>");
	    	$("[name*='q73_']").attr("disabled", '');    			    
	    	$("#q74").attr("disabled", '');
	    	$("#q75").attr("disabled", '');
	    	$("#q76").attr("disabled", '');
	    	$("[name*='q77']").attr("disabled", '');	
	    	$("[name*='q78_']").attr("disabled", '');
	    	$("[name*='q79']").attr("disabled", '');
	    }
	    else if ($("input[name='q72']:checked").val() == 'no'){
		    $("#q72_status").html(" <font color='red'>Skip to Q85</font>");
		    $("#q73_alive_status").html('');
		    $("#q73_dead_status").html('');
		    $("#q73_miscarriage_status").html('');
		    $("#pregnancy_total").html('');
	    	$("[name*='q73_']").val('');
	    	$("[name*='q73_']").attr("disabled", true);	  
	    	$("#q74").val('');
	    	$("#q74").attr("disabled", true);	  
	    	$("#q75").val('');
	    	$("#q75").attr("disabled", true);
	    	$("#q76").val('');
	    	$("#q76").attr("disabled", true);
	    	$("[name*='q77']").attr("checked", false);
	    	$("[name*='q77']").attr("disabled", true);			  	    
	    	$("[name*='q78_']").val('');
	    	$("[name*='q78_']").attr("disabled", true);
	    	$("[name*='q79']").attr("checked", false);
	    	$("[name*='q79']").attr("disabled", true);		    		  

	    }
	});
	$("input[name='q77']").change(function(){
	    if ($("input[name='q77']:checked").val() == 'yes'){	
	    	$("[name*='q78_']").attr("disabled", '');	    
	    }
	    else if ($("input[name='q77']:checked").val() == 'no'){
	    	$("[name*='q78_']").val('');
	    	$("[name*='q78_']").attr("disabled", true);	    
	    }
	});	    	    
	$("input[name='q80']").change(function(){
	    if ($("input[name='q80']:checked").val() == 'yes'){
			$("[name*='q80_']").attr("disabled", '');
			$("#q81").attr("disabled", '');
	    }
	    else if ($("input[name='q80']:checked").val() == 'no'){
	    	$("[name*='q80_']").val('');
	    	$("[name*='q80_']").attr("disabled", true);	  
	    	$("#q81").val('');
	    	$("#q81").attr("disabled", true);

	    }
	});

	$("input[name='q82']").change(function(){
	    if ($("input[name='q82']:checked").val() == 'yes'){
	    		    	
			$("[name*='q82_'][type=radio]").attr("disabled", '');
			$("[name*='q82_'][type=text]").attr("disabled", '');
			$("[name*='q82_'][name$='_type']").attr("disabled", '');
			$("[name*='q82_'][name$='_aliveDead']").attr("disabled", '');
	    }
	    else if ($("input[name='q82']:checked").val() == 'no'){
	    	//$("[name*='q82_'][type=radio]").attr('checked', false);
	    	//$("[name*='q82_'][type=radio]").removeAttr("checked");
	    	$("[name*='q82_'][type=radio]").filter('[value="no"]').attr('checked', 'checked');   	
	    	$("[name*='q82_'][type=radio]").attr("disabled", true);	  
	    	$("[name*='q82_'][type=text]").val('');
	    	$("[name*='q82_'][type=text]").attr("disabled", true);
	    	$("[name*='q82_'][name$='_type']").val('');
			$("[name*='q82_'][name$='_type']").attr("disabled", true);
			$("[name*='q82_'][name$='_aliveDead']").val('');
			$("[name*='q82_'][name$='_aliveDead']").attr("disabled", true);

	    }
	});

	$("input[name='q82_1']").change(function(){
	    if ($("input[name='q82_1']:checked").val() == 'yes'){
	    	$("#q82_1_type").attr("disabled", '');
			$("#q82_1_whatAge").attr("disabled", '');
			$("#q82_1_aliveDead").attr("disabled", '');
	    }
	    else if ($("input[name='q82_1']:checked").val() == 'no'){
 
	    	$("#q82_1_type").val('');
	    	$("#q82_1_type").attr("disabled", true);
	    	$("#q82_1_whatAge").val('');
			$("#q82_1_whatAge").attr("disabled", true);
			$("#q82_1_aliveDead").val('');
			$("#q82_1_aliveDead").attr("disabled", true);
	    }
	});
	$("input[name='q82_2']").change(function(){
	    if ($("input[name='q82_2']:checked").val() == 'yes'){
	    	$("#q82_2_type").attr("disabled", '');
			$("#q82_2_whatAge").attr("disabled", '');
			$("#q82_2_aliveDead").attr("disabled", '');
	    }
	    else if ($("input[name='q82_2']:checked").val() == 'no'){
 
	    	$("#q82_2_type").val('');
	    	$("#q82_2_type").attr("disabled", true);
	    	$("#q82_2_whatAge").val('');
			$("#q82_2_whatAge").attr("disabled", true);
			$("#q82_2_aliveDead").val('');
			$("#q82_2_aliveDead").attr("disabled", true);
	    }
	});
	$("input[name='q82_3']").change(function(){
	    if ($("input[name='q82_3']:checked").val() == 'yes'){
	    	$("#q82_3_type").attr("disabled", '');
			$("#q82_3_whatAge").attr("disabled", '');
			$("#q82_3_aliveDead").attr("disabled", '');
	    }
	    else if ($("input[name='q82_3']:checked").val() == 'no'){
 
	    	$("#q82_3_type").val('');
	    	$("#q82_3_type").attr("disabled", true);
	    	$("#q82_3_whatAge").val('');
			$("#q82_3_whatAge").attr("disabled", true);
			$("#q82_3_aliveDead").val('');
			$("#q82_3_aliveDead").attr("disabled", true);
	    }
	});
	$("input[name='q82_4']").change(function(){
	    if ($("input[name='q82_4']:checked").val() == 'yes'){
	    	$("#q82_4_type").attr("disabled", '');
			$("#q82_4_whatAge").attr("disabled", '');
			$("#q82_4_aliveDead").attr("disabled", '');
	    }
	    else if ($("input[name='q82_4']:checked").val() == 'no'){
 
	    	$("#q82_4_type").val('');
	    	$("#q82_4_type").attr("disabled", true);
	    	$("#q82_4_whatAge").val('');
			$("#q82_4_whatAge").attr("disabled", true);
			$("#q82_4_aliveDead").val('');
			$("#q82_4_aliveDead").attr("disabled", true);
	    }
	});
	$("input[name='q82_5']").change(function(){
	    if ($("input[name='q82_5']:checked").val() == 'yes'){
	    	$("#q82_5_type").attr("disabled", '');
			$("#q82_5_whatAge").attr("disabled", '');
			$("#q82_5_aliveDead").attr("disabled", '');
	    }
	    else if ($("input[name='q82_5']:checked").val() == 'no'){
 
	    	$("#q82_5_type").val('');
	    	$("#q82_5_type").attr("disabled", true);
	    	$("#q82_5_whatAge").val('');
			$("#q82_5_whatAge").attr("disabled", true);
			$("#q82_5_aliveDead").val('');
			$("#q82_5_aliveDead").attr("disabled", true);
	    }
	});
	$("input[name='q82_6']").change(function(){
	    if ($("input[name='q82_6']:checked").val() == 'yes'){
	    	$("#q82_6_type").attr("disabled", '');
			$("#q82_6_whatAge").attr("disabled", '');
			$("#q82_6_aliveDead").attr("disabled", '');
	    }
	    else if ($("input[name='q82_6']:checked").val() == 'no'){
 
	    	$("#q82_6_type").val('');
	    	$("#q82_6_type").attr("disabled", true);
	    	$("#q82_6_whatAge").val('');
			$("#q82_6_whatAge").attr("disabled", true);
			$("#q82_6_aliveDead").val('');
			$("#q82_6_aliveDead").attr("disabled", true);
	    }
	});
	$("input[name='q82_7']").change(function(){
	    if ($("input[name='q82_7']:checked").val() == 'yes'){
	    	$("#q82_7_type").attr("disabled", '');
			$("#q82_7_whatAge").attr("disabled", '');
			$("#q82_7_aliveDead").attr("disabled", '');
	    }
	    else if ($("input[name='q82_7']:checked").val() == 'no'){
 
	    	$("#q82_7_type").val('');
	    	$("#q82_7_type").attr("disabled", true);
	    	$("#q82_7_whatAge").val('');
			$("#q82_7_whatAge").attr("disabled", true);
			$("#q82_7_aliveDead").val('');
			$("#q82_7_aliveDead").attr("disabled", true);
	    }
	});								
	$("input[name='q82_8']").change(function(){
	    if ($("input[name='q82_8']:checked").val() == 'yes'){
	    	$("#q82_8_type").attr("disabled", '');
			$("#q82_8_whatAge").attr("disabled", '');
			$("#q82_8_aliveDead").attr("disabled", '');
	    }
	    else if ($("input[name='q82_8']:checked").val() == 'no'){
 
	    	$("#q82_8_type").val('');
	    	$("#q82_8_type").attr("disabled", true);
	    	$("#q82_8_whatAge").val('');
			$("#q82_8_whatAge").attr("disabled", true);
			$("#q82_8_aliveDead").val('');
			$("#q82_8_aliveDead").attr("disabled", true);
	    }
	});
	$("input[name='q82_9']").change(function(){
	    if ($("input[name='q82_9']:checked").val() == 'yes'){
	    	$("#q82_9_type").attr("disabled", '');
			$("#q82_9_whatAge").attr("disabled", '');
			$("#q82_9_aliveDead").attr("disabled", '');
	    }
	    else if ($("input[name='q82_9']:checked").val() == 'no'){
 
	    	$("#q82_9_type").val('');
	    	$("#q82_9_type").attr("disabled", true);
	    	$("#q82_9_whatAge").val('');
			$("#q82_9_whatAge").attr("disabled", true);
			$("#q82_9_aliveDead").val('');
			$("#q82_9_aliveDead").attr("disabled", true);
	    }
	});
	$("input[name='q82_10']").change(function(){
	    if ($("input[name='q82_10']:checked").val() == 'yes'){
	    	$("#q82_10_type").attr("disabled", '');
			$("#q82_10_whatAge").attr("disabled", '');
			$("#q82_10_aliveDead").attr("disabled", '');
	    }
	    else if ($("input[name='q82_10']:checked").val() == 'no'){
 
	    	$("#q82_10_type").val('');
	    	$("#q82_10_type").attr("disabled", true);
	    	$("#q82_10_whatAge").val('');
			$("#q82_10_whatAge").attr("disabled", true);
			$("#q82_10_aliveDead").val('');
			$("#q82_10_aliveDead").attr("disabled", true);
	    }
	});
	$("input[name='q82_11']").change(function(){
	    if ($("input[name='q82_11']:checked").val() == 'yes'){
	    	$("#q82_11_type").attr("disabled", '');
			$("#q82_11_whatAge").attr("disabled", '');
			$("#q82_11_aliveDead").attr("disabled", '');
	    }
	    else if ($("input[name='q82_11']:checked").val() == 'no'){
 
	    	$("#q82_11_type").val('');
	    	$("#q82_11_type").attr("disabled", true);
	    	$("#q82_11_whatAge").val('');
			$("#q82_11_whatAge").attr("disabled", true);
			$("#q82_11_aliveDead").val('');
			$("#q82_11_aliveDead").attr("disabled", true);
	    }
	});
	$("input[name='q82_12']").change(function(){
	    if ($("input[name='q82_12']:checked").val() == 'yes'){
	    	$("#q82_12_type").attr("disabled", '');
			$("#q82_12_whatAge").attr("disabled", '');
			$("#q82_12_aliveDead").attr("disabled", '');
	    }
	    else if ($("input[name='q82_12']:checked").val() == 'no'){
 
	    	$("#q82_12_type").val('');
	    	$("#q82_12_type").attr("disabled", true);
	    	$("#q82_12_whatAge").val('');
			$("#q82_12_whatAge").attr("disabled", true);
			$("#q82_12_aliveDead").val('');
			$("#q82_12_aliveDead").attr("disabled", true);
	    }
	});
	$("input[name='q82_13']").change(function(){
	    if ($("input[name='q82_13']:checked").val() == 'yes'){
	    	$("#q82_13_type").attr("disabled", '');
			$("#q82_13_whatAge").attr("disabled", '');
			$("#q82_13_aliveDead").attr("disabled", '');
	    }
	    else if ($("input[name='q82_13']:checked").val() == 'no'){
 
	    	$("#q82_13_type").val('');
	    	$("#q82_13_type").attr("disabled", true);
	    	$("#q82_13_whatAge").val('');
			$("#q82_13_whatAge").attr("disabled", true);
			$("#q82_13_aliveDead").val('');
			$("#q82_13_aliveDead").attr("disabled", true);
	    }
	});
	$("input[name='q82_14']").change(function(){
	    if ($("input[name='q82_14']:checked").val() == 'yes'){
	    	$("#q82_14_type").attr("disabled", '');
			$("#q82_14_whatAge").attr("disabled", '');
			$("#q82_14_aliveDead").attr("disabled", '');
	    }
	    else if ($("input[name='q82_14']:checked").val() == 'no'){
 
	    	$("#q82_14_type").val('');
	    	$("#q82_14_type").attr("disabled", true);
	    	$("#q82_14_whatAge").val('');
			$("#q82_14_whatAge").attr("disabled", true);
			$("#q82_14_aliveDead").val('');
			$("#q82_14_aliveDead").attr("disabled", true);
	    }
	});
	$("input[name='q82_15']").change(function(){
	    if ($("input[name='q82_15']:checked").val() == 'yes'){
	    	$("#q82_15_type").attr("disabled", '');
			$("#q82_15_whatAge").attr("disabled", '');
			$("#q82_15_aliveDead").attr("disabled", '');
	    }
	    else if ($("input[name='q82_15']:checked").val() == 'no'){
 
	    	$("#q82_15_type").val('');
	    	$("#q82_15_type").attr("disabled", true);
	    	$("#q82_15_whatAge").val('');
			$("#q82_15_whatAge").attr("disabled", true);
			$("#q82_15_aliveDead").val('');
			$("#q82_15_aliveDead").attr("disabled", true);
	    }
	});
});	
</g:javascript>    
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
			<span class="menuButton"><g:render template="/common/step_meter"/></span>
        </div>
        <div class="body">
            <h1><g:message code="step11.label" default="Step11" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
<div id="errors" class="errors" style="display:none;">
</div>
            <g:form name="surveyform11"
            		onsubmit="return checkForm11();"
            		method="post" >
                <g:hiddenField name="id" value="${surveyInstance?.id}" />
                <g:hiddenField name="version" value="${surveyInstance?.version}" />
                <g:render template="/common/status_info" model="['dob':surveyInstance?.DOB]"/>
                <div class="dialog">
					<%
					def yesno=[message(code:'survey.yes'), message(code:'survey.no')]     
					%>           
                
                    <table class="box-table-b-wide">
                        <tbody>
	                    <tr>
	                    	<td style="width:40%;font-weight:bold;"><label><g:message code="survey.q72" default="q72" /></label></td>
	                    	<td style="width:60%">
	                        	<g:radioGroup name="q72"
	                            	value="${surveyInstance?.q72}" 
	                                labels="${yesno }"
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup> <span id="q72_status"></span>
							</td>
						</tr>
	                    <tr>
	                    	<td style=";font-weight:bold;"><label><g:message code="survey.q73" default="q73" /></label></td>
	                    	<td>
		                    	<g:message code="survey.alive" default="Alive" />: <g:textField name="q73_alive" 
		                    																	value="${surveyInstance?.q73_alive}" 
		                    																	onkeyup="checkIfValidNumber(this.value, 0, 50, document.getElementById(\'q73_alive_status\')); sumOfNumbers(document.getElementById('q73_alive'),document.getElementById('q73_dead'),document.getElementById('q73_miscarriage'),document.getElementById(\'pregnancy_total\'));"/> <span id="q73_alive_status"></span>
		                    	<br/><g:message code="survey.dead" default="Dead" />: <g:textField name="q73_dead"
		                    																	value="${surveyInstance?.q73_dead}" 
		                    																	onkeyup="checkIfValidNumber(this.value, 0, 50, document.getElementById(\'q73_dead_status\')); sumOfNumbers(document.getElementById('q73_alive'),document.getElementById('q73_dead'),document.getElementById('q73_miscarriage'),document.getElementById(\'pregnancy_total\'));"/> <span id="q73_dead_status"></span>
		                    	<br/><g:message code="survey.miscarriage" default="Miscarriage" />: <g:textField name="q73_miscarriage" 
		                    																	value="${surveyInstance?.q73_miscarriage}" 
		                    																	onkeyup="checkIfValidNumber(this.value, 0, 50, document.getElementById(\'q73_miscarriage_status\')); sumOfNumbers(document.getElementById('q73_alive'),document.getElementById('q73_dead'),document.getElementById('q73_miscarriage'),document.getElementById(\'pregnancy_total\'));"/> <span id="q73_miscarriage_status"></span>
								<br/>
								<span id="pregnancy_total"></span>		                    																	
	                    	</td>
	                    </tr>
	                    <tr>
	                    	<td style=";font-weight:bold;"><label><g:message code="survey.q74" default="q74" /></label></td>
	                    	<td>
		                    	<g:textField name="q74"
		                    				 value="${surveyInstance?.q74}"
		                    				 onkeyup="checkIfValidNumber(this.value, 5, ${surveyInstance?.age ? surveyInstance?.age : 100 }, document.getElementById(\'q74_status\')); "/> <g:message code="survey.years" default="years" /> <span id="q74_status"></span>
	                    	</td>
	                    </tr> 
	                    <tr>
	                    	<td style=";font-weight:bold;"><label><g:message code="survey.q75" default="q75" /></label></td>
	                    	<td>
		                    	<g:textField name="q75" 
		                    				 value="${surveyInstance?.q75}"
											 onkeyup="checkIfValidNumber(this.value, 5, ${surveyInstance?.age ? surveyInstance?.age : 100 }, document.getElementById(\'q75_status\')); "/> <g:message code="survey.years" default="years" /> <span id="q75_status"></span>
	                    	</td>
	                    </tr>
	                    <tr>
	                    	<td style=";font-weight:bold;"><label><g:message code="survey.q76" default="q76" /></label></td>
	                    	<td>
		                    	<g:textField name="q76" 
		                    				 value="${surveyInstance?.q76}"
		                    				 onkeyup="checkIfValidNumber(this.value, 0, 50, document.getElementById(\'q76_status\')); "/>  <span id="q76_status"></span>
	                    	</td>
	                    </tr>
                        </tbody>
                    </table>
                    <table class="box-table-b-wide">
                        <tbody>                    	                    
	                    <tr>
	                    	<td style=";font-weight:bold;"><label><g:message code="survey.q77" default="q77" /></label></td>
	                    	<td>
	                        	<g:radioGroup name="q77"
	                            	value="${surveyInstance?.q77}" 
	                                labels="${yesno }"
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>
	                    	</td>
	                    </tr>
                        </tbody>
                    </table>
                    <br/><ul><label><g:message code="survey.q78" default="q78" /></label></ul>
                    <table class="box-table-b-wide">
                    <thead>
                    <tr>
                    	<th><g:message code="survey.baby" default="Baby" /></th>
                    	<th><g:message code="survey.weeksmonths" default="Weeks / Months" /></th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
					def BabyOrderList=[message(code:'survey.1st'),message(code:'survey.2nd'),message(code:'survey.3rd'),message(code:'survey.4th'),message(code:'survey.5th'),
						message(code:'survey.6th'),message(code:'survey.7th'),message(code:'survey.8th'),message(code:'survey.9th'),message(code:'survey.10th')]
					%>
					<g:each in="${BabyOrderList}" status="i" var="baby">
	    			<%
					def idx=i+1
					%> 
                    <tr>
                    	<td style="padding: 3px;font-weight:bold;">${baby}</td>
                    	<td style="padding: 3px;">
                    		<g:textField name="${('q78_'+idx+'_week')}" 
                    					 value="${surveyInstance?.('q78_'+idx+'_week')}" 
                    					 onkeyup="checkIfValidNumber(this.value, 0, 100, document.getElementById(\'${('q78_week_status'+idx)}\')); "/> <span id="${('q78_week_status'+idx)}"></span>/ 
                    		<g:textField name="${('q78_'+idx+'_month')}" 
                    					 value="${surveyInstance?.('q78_'+idx+'_month')}" 
                    					 onkeyup="checkIfValidNumber(this.value, 0, 100, document.getElementById(\'${('q78_month_status'+idx)}\')); "/> <span id="${('q78_month_status'+idx)}"></span>
                    	</td>
                    </tr>
                    </g:each>
                    </tbody>
                    </table>

                    <table class="box-table-b-wide">
                    <tbody>
	                    <tr>
	                    	<td style="width:25%;font-weight:bold;"><label><g:message code="survey.q79" default="q79" /></label></td>
	                    	<td style="width:75%">
	                        	<g:radioGroup name="q79"
	                            	value="${surveyInstance?.q79}" 
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
	                    	<td style="width:25%;font-weight:bold;"><label><g:message code="survey.q80" default="q80" /></label></td>
	                    	<td style="width:75%">
	                        	<g:radioGroup name="q80"
	                            	value="${surveyInstance?.q80}" 
	                                labels="${yesno }" 
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>
								<div style="clear:left">
								<br/><g:message code="survey.whichone" default="Which one" /> <g:textField name="q80_which"
																										   value="${surveyInstance?.q80_which}"
																										   onkeyup="checkIfNumberOnly(this.value, document.getElementById(\'${('q80_which_status')}\')); "/> <span id="${('q80_which_status')}"></span>&nbsp;&nbsp;&nbsp;
								<br/><g:message code="survey.atwhatage" default="At what age" /> <g:textField name="q80_whatAge"
																											  value="${surveyInstance?.q80_whatAge}"
																											  onkeyup="checkIfValidNumber(this.value, 0, ageCalculated, document.getElementById(\'${('q80_whatAge_status')}\')); "/> <g:message code="survey.years" /> <span id="${('q80_whatAge_status')}"></span>&nbsp;&nbsp;&nbsp;
								<br/><g:message code="survey.forhowlong" default="For how long" /> <g:textField name="q80_howLong"
																												value="${surveyInstance?.q80_howLong}"
																												onkeyup="checkIfValidNumber(this.value, 0, ageCalculated, document.getElementById(\'${('q80_howLong_status')}\')); "/> <g:message code="survey.years.label" /> <label style="color:orange">(<g:message code="survey.q80_if6monthEnter0.5" />)</label><span id="${('q80_howLong_status')}"></span> &nbsp;&nbsp;&nbsp;
								</div>
	                    	</td>
	                    </tr>
	                    <tr>
	                    <% def ContraceptiveList=[message(code:'survey.q81.pill'),
												  message(code:'survey.q81.shot'),
												  message(code:'survey.q81.patch'),
												  message(code:'survey.q81.ring'),
												  message(code:'survey.q81.implantation'),
												  message(code:'survey.q81.IUD'),
												  message(code:'survey.q81.diaphragm'),
												  message(code:'survey.q81.female_condom'),
												  message(code:'survey.q81.other')]
						 %>
	                    	<td style="width:25%;font-weight:bold;"><label><g:message code="survey.q81" default="q81" /></label></td>
	                    	<td style="width:75%">
	                    		<g:select name="${('q81')}"
									from="${ContraceptiveList}"
									value="${surveyInstance?.('q81')}"
									noSelection="['':'']" />,
		                    	<label><g:message code="survey.q81.other" default="q81" /></label>: <g:textField name="q81_other"
		                    				 value="${surveyInstance?.q81_other}"
		                    				 onkeyup="checkIfNumberOnly(this.value, document.getElementById(\'${('q81_status')}\')); "/> <span id="${('q81_status')}"></span>
	                    	</td>
	                    </tr>
                    </tbody>
                    </table>
                    
                    <h1><g:message code="step11b.label" default="Step11b" /></h1>
                    
                    <table class="box-table-b-wide">
                    <tbody>                    	                    
	                    <tr>
	                    	<td style="width:25%;font-weight:bold;"><label><g:message code="survey.q82" default="q82" /></label></td>
	                    	<td style="width:75%">
	                        	<g:radioGroup name="q82"
	                            	value="${surveyInstance?.q82}" 
	                                labels="${yesno }"
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>
	                    	</td>
	                    </tr>	                    
                    </tbody>
                    </table>
                    <%--
                    <br/><label><g:message code="survey.q82.table" default="Family History of Breast Cancer" /></label><br/><br/>
                    --%>

                    <%
					def PersonList=[message(code:'survey.mother'),
									message(code:'survey.father'),
									message(code:'survey.sister'),
									message(code:'survey.brother'),
									message(code:'survey.daughter'), 
									message(code:'survey.son'),						
									message(code:'survey.grandmother.m'),
									message(code:'survey.grandfather.m'),
									message(code:'survey.aunt.m'),
									message(code:'survey.uncle.m'),
									message(code:'survey.grandmother.p'),
									message(code:'survey.grandfather.p'),
									message(code:'survey.aunt.p'),
									message(code:'survey.uncle.p'),
									message(code:'survey.others')]
					
					def BreastCancerTypeList=[message(code:'survey.breastcancer.diag1'), message(code:'survey.breastcancer.diag2'), message(code:'survey.breastcancer.diag3') ]
					def AliveDeadList=[message(code:'survey.alive'), message(code:'survey.dead')]
					%>
					<table class="box-table-b-wide">
					<thead>
					<tr>
						<th><g:message code="survey.q82.thead1" /></th>
						<th><g:message code="survey.q82.thead2" /></th>
						<th><g:message code="survey.q82.thead3" /></th>
						<th><g:message code="survey.q82.thead4" /></th>
						<th><g:message code="survey.q82.thead5" /></th>
					</tr>
					</thead>
					<g:each in="${PersonList }" status="i" var="person">
					<% def idx=i+1 %>
					<tr>
						<td style="width:10%; padding: 5px;font-weight:bold;">
						${idx}. ${person }
						<g:if test="${person==message(code:'survey.others') }">
							<g:textField name="q82_others" value="${surveyInstance?.q82_others}" />
						</g:if>
						</td>
						<td style="width:20%; padding: 5px">
                        	<g:radioGroup name="${('q82_'+idx)}"
                            	value="${surveyInstance?.('q82_'+idx)}" 
                                labels="${yesno }"
                                values="['yes','no']" >
								<g:render template="/common/checkmark_radio" model="[it:it]"/>
							</g:radioGroup>						
						</td>
						<td style="padding: 5px">
							<g:select name="${('q82_'+idx+'_type')}"
									from="${BreastCancerTypeList}"
									value="${surveyInstance?.('q82_'+idx+'_type')}"
									noSelection="['':'']" />
						</td>
						<td style="padding: 5px">
							<g:textField style="width:50px" 
										 name="${('q82_'+idx+'_whatAge')}"
										 value="${surveyInstance?.('q82_'+idx+'_whatAge')}"
										 onkeyup="checkIfValidNumber(this.value, 1, 120, document.getElementById(\'${('q82_age_status'+idx)}\')); "/> <span id="${('q82_age_status'+idx)}"></span> 
						</td>
						<td style="padding: 5px">
							<g:select name="${('q82_'+idx+'_aliveDead')}"
									from="${AliveDeadList}"
									value="${surveyInstance?.('q82_'+idx+'_aliveDead')}"
									noSelection="['':'']" />						
						</td>
					</tr>
					</g:each>
					</table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'button.save-finish-later.label', default: 'update')}"  onclick="DisableEnableForm(document.surveyform11,false);" /></span>
                    <span class="button"><g:actionSubmit class="back" action="step10" value="${message(code: 'button.go-back.label', default: 'back')}"  onclick="DisableEnableForm(document.surveyform11,false);" /></span>
                    <%--<span class="button"><g:render template="/common/back_button"/></span>
                    <span class="button"><input type="reset" value="${message(code: 'button.reset-all.label', default: 'reset')}"></span> --%>  
                    <g:if test="${surveyInstance?.sex=='female' }">  
                    	<span class="button"><g:actionSubmit class="next" action="update_unified" value="${message(code: 'button.save-then-go-to-next.label', default: 'next')}"  onclick="DisableEnableForm(document.surveyform11,false);" /></span>
                    </g:if>
                    <g:else>
                    	<g:link action="step12" id="${surveyInstance?.id}"><label style="color:green"><g:message code='button.save-then-go-to-next.label'/></label></g:link>
                    </g:else>
                    <span class="menuButton"><g:render template="/common/step_meter"/></span>
                 </div>
            </g:form>
        </div>
    </body>
</html>
