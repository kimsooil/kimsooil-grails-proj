<%@ page import="u56survey.Survey" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'survey.label', default: 'Survey')}" />
        <title><g:message code="step14.label" default="Step14" /></title>

		<%-- <jv:generateValidation domain="survey" form="surveyform14"  display="list" container="errors"/>--%>
		  
		<g:render template="errMsgsToJson-js"/>

		<g:javascript src="check_step14.js" />  
	
    </head>
    <body>
<g:javascript>
$(document).ready(function(){ 
	$("input[name='q90_1']").change(function(){
	    if ($("input[name='q90_1']:checked").val() == 'yes'){
	    	$("#q90_1_age").attr("disabled", '');
	    	$("[name*='q90_1_year']").attr("disabled", '');
	    }
	    else if ($("input[name='q90_1']:checked").val() == 'no'){
	    	$("#q90_1_age").val('');
	    	$("#q90_1_age").attr("disabled", true);
	    	$("[name*='q90_1_year']").val('');
	    	$("[name*='q90_1_year']").attr("disabled", true);
	    }
	});
	$("input[name='q90_2']").change(function(){
	    if ($("input[name='q90_2']:checked").val() == 'yes'){
	    	$("#q90_2_age").attr("disabled", '');
	    	$("[name*='q90_2_year']").attr("disabled", '');
	    }
	    else if ($("input[name='q90_2']:checked").val() == 'no'){
	    	$("#q90_2_age").val('');
	    	$("#q90_2_age").attr("disabled", true);
	    	$("[name*='q90_2_year']").val('');
	    	$("[name*='q90_2_year']").attr("disabled", true);
	    }
	});	
	$("input[name='q90_3']").change(function(){
	    if ($("input[name='q90_3']:checked").val() == 'yes'){
	    	$("#q90_3_age").attr("disabled", '');
	    	$("[name*='q90_3_year']").attr("disabled", '');
	    }
	    else if ($("input[name='q90_3']:checked").val() == 'no'){
	    	$("#q90_3_age").val('');
	    	$("#q90_3_age").attr("disabled", true);
	    	$("[name*='q90_3_year']").val('');
	    	$("[name*='q90_3_year']").attr("disabled", true);
	    }
	});
	$("input[name='q90_4']").change(function(){
	    if ($("input[name='q90_4']:checked").val() == 'yes'){
	    	$("#q90_4_age").attr("disabled", '');
	    	$("[name*='q90_4_year']").attr("disabled", '');
	    }
	    else if ($("input[name='q90_4']:checked").val() == 'no'){
	    	$("#q90_4_age").val('');
	    	$("#q90_4_age").attr("disabled", true);
	    	$("[name*='q90_4_year']").val('');
	    	$("[name*='q90_4_year']").attr("disabled", true);
	    }
	});
	$("input[name='q90_5']").change(function(){
	    if ($("input[name='q90_5']:checked").val() == 'yes'){
	    	$("#q90_5_age").attr("disabled", '');
	    	$("[name*='q90_5_year']").attr("disabled", '');
	    }
	    else if ($("input[name='q90_5']:checked").val() == 'no'){
	    	$("#q90_5_age").val('');
	    	$("#q90_5_age").attr("disabled", true);
	    	$("[name*='q90_5_year']").val('');
	    	$("[name*='q90_5_year']").attr("disabled", true);
	    }
	});
	$("input[name='q90_6']").change(function(){
	    if ($("input[name='q90_6']:checked").val() == 'yes'){
	    	$("#q90_6_age").attr("disabled", '');
	    	$("[name*='q90_6_year']").attr("disabled", '');
	    }
	    else if ($("input[name='q90_6']:checked").val() == 'no'){
	    	$("#q90_6_age").val('');
	    	$("#q90_6_age").attr("disabled", true);
	    	$("[name*='q90_6_year']").val('');
	    	$("[name*='q90_6_year']").attr("disabled", true);
	    }
	});
	$("input[name='q90_7']").change(function(){
	    if ($("input[name='q90_7']:checked").val() == 'yes'){
	    	$("#q90_7_age").attr("disabled", '');
	    	$("[name*='q90_7_year']").attr("disabled", '');
	    	$("[name*='q90_7_medcon']").attr("disabled", '');
	    }
	    else if ($("input[name='q90_7']:checked").val() == 'no'){
	    	$("#q90_7_age").val('');
	    	$("#q90_7_age").attr("disabled", true);
	    	$("[name*='q90_7_year']").val('');
	    	$("[name*='q90_7_year']").attr("disabled", true);
	    	$("[name*='q90_7_medcon']").val('');
	    	$("[name*='q90_7_medcon']").attr("disabled", true);	    	
	    }
	});	
	$("input[name='q90_8']").change(function(){
	    if ($("input[name='q90_8']:checked").val() == 'yes'){
	    	$("#q90_8_age").attr("disabled", '');
	    	$("[name*='q90_8_year']").attr("disabled", '');
	    	$("[name*='q90_8_medcon']").attr("disabled", '');
	    }
	    else if ($("input[name='q90_8']:checked").val() == 'no'){
	    	$("#q90_8_age").val('');
	    	$("#q90_8_age").attr("disabled", true);
	    	$("[name*='q90_8_year']").val('');
	    	$("[name*='q90_8_year']").attr("disabled", true);
	    	$("[name*='q90_8_medcon']").val('');
	    	$("[name*='q90_8_medcon']").attr("disabled", true);	    	
	    }
	});		
	$("input[name='q90_9']").change(function(){
	    if ($("input[name='q90_9']:checked").val() == 'yes'){
	    	$("#q90_9_age").attr("disabled", '');
	    	$("[name*='q90_9_year']").attr("disabled", '');
	    	$("[name*='q90_9_medcon']").attr("disabled", '');
	    }
	    else if ($("input[name='q90_9']:checked").val() == 'no'){
	    	$("#q90_9_age").val('');
	    	$("#q90_9_age").attr("disabled", true);
	    	$("[name*='q90_9_year']").val('');
	    	$("[name*='q90_9_year']").attr("disabled", true);
	    	$("[name*='q90_9_medcon']").val('');
	    	$("[name*='q90_9_medcon']").attr("disabled", true);	    	
	    }
	});
	$("input[name='q90_10']").change(function(){
	    if ($("input[name='q90_10']:checked").val() == 'yes'){
	    	$("#q90_10_age").attr("disabled", '');
	    	$("[name*='q90_10_year']").attr("disabled", '');
	    	$("[name*='q90_10_medcon']").attr("disabled", '');
	    }
	    else if ($("input[name='q90_10']:checked").val() == 'no'){
	    	$("#q90_10_age").val('');
	    	$("#q90_10_age").attr("disabled", true);
	    	$("[name*='q90_10_year']").val('');
	    	$("[name*='q90_10_year']").attr("disabled", true);
	    	$("[name*='q90_10_medcon']").val('');
	    	$("[name*='q90_10_medcon']").attr("disabled", true);	    	
	    }
	});
	$("input[name='q90_11']").change(function(){
	    if ($("input[name='q90_11']:checked").val() == 'yes'){
	    	$("#q90_11_age").attr("disabled", '');
	    	$("[name*='q90_11_year']").attr("disabled", '');
	    	$("[name*='q90_11_medcon']").attr("disabled", '');
	    }
	    else if ($("input[name='q90_11']:checked").val() == 'no'){
	    	$("#q90_11_age").val('');
	    	$("#q90_11_age").attr("disabled", true);
	    	$("[name*='q90_11_year']").val('');
	    	$("[name*='q90_11_year']").attr("disabled", true);
	    	$("[name*='q90_11_medcon']").val('');
	    	$("[name*='q90_11_medcon']").attr("disabled", true);	    	
	    }
	});									
	$("input[name='q91_1']").change(function(){
	    if ($("input[name='q91_1']:checked").val() != 'never'){
	    	$("#q91_1_howManyYears").attr("disabled", '');
	    }
	    else if ($("input[name='q91_1']:checked").val() == 'never'){
	    	$("#q91_1_howManyYears").val('');
	    	$("#q91_1_howManyYears").attr("disabled", true);
	    }
	});	
	$("input[name='q91_2']").change(function(){
	    if ($("input[name='q91_2']:checked").val() != 'never'){
	    	$("#q91_2_howManyYears").attr("disabled", '');
	    }
	    else if ($("input[name='q91_2']:checked").val() == 'never'){
	    	$("#q91_2_howManyYears").val('');
	    	$("#q91_2_howManyYears").attr("disabled", true);
	    }
	});		
	$("input[name='q91_3']").change(function(){
	    if ($("input[name='q91_3']:checked").val() != 'never'){
	    	$("#q91_3_howManyYears").attr("disabled", '');
	    }
	    else if ($("input[name='q91_3']:checked").val() == 'never'){
	    	$("#q91_3_howManyYears").val('');
	    	$("#q91_3_howManyYears").attr("disabled", true);
	    }
	});	
	$("input[name='q92_1']").change(function(){
	    if ($("input[name='q92_1']:checked").val() != 'never'){
	    	$("#q92_1_howManyYears").attr("disabled", '');
	    }
	    else if ($("input[name='q92_1']:checked").val() == 'never'){
	    	$("#q92_1_howManyYears").val('');
	    	$("#q92_1_howManyYears").attr("disabled", true);
	    }
	});	
	$("input[name='q92_2']").change(function(){
	    if ($("input[name='q92_2']:checked").val() != 'never'){
	    	$("#q92_2_howManyYears").attr("disabled", '');
	    }
	    else if ($("input[name='q92_2']:checked").val() == 'never'){
	    	$("#q92_2_howManyYears").val('');
	    	$("#q92_2_howManyYears").attr("disabled", true);
	    }
	});
	$("input[name='q92_3']").change(function(){
	    if ($("input[name='q92_3']:checked").val() != 'never'){
	    	$("#q92_3_howManyYears").attr("disabled", '');
	    }
	    else if ($("input[name='q92_3']:checked").val() == 'never'){
	    	$("#q92_3_howManyYears").val('');
	    	$("#q92_3_howManyYears").attr("disabled", true);
	    }
	});	
	$("input[name='q92_4']").change(function(){
	    if ($("input[name='q92_4']:checked").val() != 'never'){
	    	$("#q92_4_howManyYears").attr("disabled", '');
	    }
	    else if ($("input[name='q92_4']:checked").val() == 'never'){
	    	$("#q92_4_howManyYears").val('');
	    	$("#q92_4_howManyYears").attr("disabled", true);
	    }
	});	
	$("input[name='q92_5']").change(function(){
	    if ($("input[name='q92_5']:checked").val() != 'never'){
	    	$("#q92_5_howManyYears").attr("disabled", '');
	    }
	    else if ($("input[name='q92_5']:checked").val() == 'never'){
	    	$("#q92_5_howManyYears").val('');
	    	$("#q92_5_howManyYears").attr("disabled", true);
	    }
	});	
	$("input[name='q92_6']").change(function(){
	    if ($("input[name='q92_6']:checked").val() != 'never'){
	    	$("#q92_6_howManyYears").attr("disabled", '');
	    }
	    else if ($("input[name='q92_6']:checked").val() == 'never'){
	    	$("#q92_6_howManyYears").val('');
	    	$("#q92_6_howManyYears").attr("disabled", true);
	    }
	});	
	$("input[name='q92_7']").change(function(){
	    if ($("input[name='q92_7']:checked").val() != 'never'){
	    	$("#q92_7_howManyYears").attr("disabled", '');
	    }
	    else if ($("input[name='q92_7']:checked").val() == 'never'){
	    	$("#q92_7_howManyYears").val('');
	    	$("#q92_7_howManyYears").attr("disabled", true);
	    }
	});	
	$("input[name='q92_8']").change(function(){
	    if ($("input[name='q92_8']:checked").val() != 'never'){
	    	$("#q92_8_howManyYears").attr("disabled", '');
	    }
	    else if ($("input[name='q92_8']:checked").val() == 'never'){
	    	$("#q92_8_howManyYears").val('');
	    	$("#q92_8_howManyYears").attr("disabled", true);
	    }
	});	
	$("input[name='q92_9']").change(function(){
	    if ($("input[name='q92_9']:checked").val() != 'never'){
	    	$("#q92_9_howManyYears").attr("disabled", '');
	    }
	    else if ($("input[name='q92_9']:checked").val() == 'never'){
	    	$("#q92_9_howManyYears").val('');
	    	$("#q92_9_howManyYears").attr("disabled", true);
	    }
	});	
	$("input[name='q93']").change(function(){
	    if ($("input[name='q93']:checked").val() == 'yes'){
			$("[name*='q93_'][type=radio]").attr("disabled", '');
			$("[name*='q93_'][type=text]").attr("disabled", '');
	    }
	    else if ($("input[name='q93']:checked").val() == 'no'){
	    	//$("[name*='q93_'][type=radio]").attr('checked', false);
	    	$("[name*='q93_'][type=radio]").filter('[value="never"]').attr('checked', 'checked');
	    	$("[name*='q93_'][type=radio]").attr("disabled", true);	  
	    	$("[name*='q93_'][type=text]").val('');
	    	$("[name*='q93_'][type=text]").attr("disabled", true);
	    }
	});	
	$("input[name='q93_1']").change(function(){
	    if ($("input[name='q93_1']:checked").val() != 'never'){
	    	$("#q93_1_howManyMonths").attr("disabled", '');
	    }
	    else if ($("input[name='q93_1']:checked").val() == 'never'){
	    	$("#q93_1_howManyMonths").val('');
	    	$("#q93_1_howManyMonths").attr("disabled", true);
	    }
	});	
	$("input[name='q93_2']").change(function(){
	    if ($("input[name='q93_2']:checked").val() != 'never'){
	    	$("#q93_2_howManyMonths").attr("disabled", '');
	    }
	    else if ($("input[name='q93_2']:checked").val() == 'never'){
	    	$("#q93_2_howManyMonths").val('');
	    	$("#q93_2_howManyMonths").attr("disabled", true);
	    }
	});	
	$("input[name='q93_3']").change(function(){
	    if ($("input[name='q93_3']:checked").val() != 'never'){
	    	$("#q93_3_howManyMonths").attr("disabled", '');
	    }
	    else if ($("input[name='q93_3']:checked").val() == 'never'){
	    	$("#q93_3_howManyMonths").val('');
	    	$("#q93_3_howManyMonths").attr("disabled", true);
	    }
	});	
	$("input[name='q93_4']").change(function(){
	    if ($("input[name='q93_4']:checked").val() != 'never'){
	    	$("#q93_4_howManyMonths").attr("disabled", '');
	    }
	    else if ($("input[name='q93_4']:checked").val() == 'never'){
	    	$("#q93_4_howManyMonths").val('');
	    	$("#q93_4_howManyMonths").attr("disabled", true);
	    }
	});	
	$("input[name='q93_5']").change(function(){
	    if ($("input[name='q93_5']:checked").val() != 'never'){
	    	$("#q93_5_howManyMonths").attr("disabled", '');
	    }
	    else if ($("input[name='q93_5']:checked").val() == 'never'){
	    	$("#q93_5_howManyMonths").val('');
	    	$("#q93_5_howManyMonths").attr("disabled", true);
	    }
	});	
	$("input[name='q94_1']").change(function(){
	    if ($("input[name='q94_1']:checked").val() != 'still_using'){
	    	$("#q94_1_ageStop").attr("disabled", '');
	    }
	    else if ($("input[name='q94_1']:checked").val() == 'still_using'){
	    	$("#q94_1_ageStop").val('');
	    	$("#q94_1_ageStop").attr("disabled", true);
	    }
	});
	$("input[name='q94_2']").change(function(){
	    if ($("input[name='q94_2']:checked").val() != 'still_using'){
	    	$("#q94_2_ageStop").attr("disabled", '');
	    }
	    else if ($("input[name='q94_2']:checked").val() == 'still_using'){
	    	$("#q94_2_ageStop").val('');
	    	$("#q94_2_ageStop").attr("disabled", true);
	    }
	});	
	$("input[name='q94_3']").change(function(){
	    if ($("input[name='q94_3']:checked").val() != 'still_using'){
	    	$("#q94_3_ageStop").attr("disabled", '');
	    }
	    else if ($("input[name='q94_3']:checked").val() == 'still_using'){
	    	$("#q94_3_ageStop").val('');
	    	$("#q94_3_ageStop").attr("disabled", true);
	    }
	});	
	$("input[name='q94_4']").change(function(){
	    if ($("input[name='q94_4']:checked").val() != 'still_using'){
	    	$("#q94_3_ageStop").attr("disabled", '');
	    }
	    else if ($("input[name='q94_4']:checked").val() == 'still_using'){
	    	$("#q94_4_ageStop").val('');
	    	$("#q94_4_ageStop").attr("disabled", true);
	    }
	});	
	$("input[name='q94_4']").change(function(){
	    if ($("input[name='q94_4']:checked").val() != 'still_using'){
	    	$("#q94_4_ageStop").attr("disabled", '');
	    }
	    else if ($("input[name='q94_4']:checked").val() == 'still_using'){
	    	$("#q94_4_ageStop").val('');
	    	$("#q94_4_ageStop").attr("disabled", true);
	    }
	});	
	$("input[name='q94_5']").change(function(){
	    if ($("input[name='q94_5']:checked").val() != 'still_using'){
	    	$("#q94_5_ageStop").attr("disabled", '');
	    }
	    else if ($("input[name='q94_5']:checked").val() == 'still_using'){
	    	$("#q94_5_ageStop").val('');
	    	$("#q94_5_ageStop").attr("disabled", true);
	    }
	});	
	$("input[name='q94_6']").change(function(){
	    if ($("input[name='q94_6']:checked").val() != 'still_using'){
	    	$("#q94_6_ageStop").attr("disabled", '');
	    }
	    else if ($("input[name='q94_6']:checked").val() == 'still_using'){
	    	$("#q94_6_ageStop").val('');
	    	$("#q94_6_ageStop").attr("disabled", true);
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
<%
	def birth=surveyInstance?.DOB ? surveyInstance?.DOB : new Date() 
%>   
        <div class="nav">

	<span class="menuButton"><g:render template="/common/step_meter"/></span>
            <g:if test="${session.user.location=='MOFF' }">
            <span class="menuButton"><g:select name="mode" 
          			from="${['paper', 'screen']}"
          			value="${surveyInstance?.mode}"
          			noSelection="['':'-Mode-']"  />
          	</span>
          	</g:if>
        </div>
        <div class="body">
<g:javascript>
$(document).ready(function(){ 

if ($("input[name='q90_1']:checked").val() == 'no'){
	    	$("#q90_1_age").val('');
	    	$("#q90_1_age").attr("disabled", true);
	    	//$("[name*='q90_1_year']").val('');
	    	$("[name*='q90_1_year']").attr("disabled", true);
	    }

if ($("input[name='q90_2']:checked").val() == 'no'){
	    	$("#q90_2_age").val('');
	    	$("#q90_2_age").attr("disabled", true);
	    	//$("[name*='q90_2_year']").val('');
	    	$("[name*='q90_2_year']").attr("disabled", true);
	    }
if ($("input[name='q90_3']:checked").val() == 'no'){
	    	$("#q90_3_age").val('');
	    	$("#q90_3_age").attr("disabled", true);
	    	//$("[name*='q90_3_year']").val('');
	    	$("[name*='q90_3_year']").attr("disabled", true);
	    }

if ($("input[name='q90_4']:checked").val() == 'no'){
	    	$("#q90_4_age").val('');
	    	$("#q90_4_age").attr("disabled", true);
	    	//$("[name*='q90_4_year']").val('');
	    	$("[name*='q90_4_year']").attr("disabled", true);
	    }

if ($("input[name='q90_5']:checked").val() == 'no'){
	    	$("#q90_5_age").val('');
	    	$("#q90_5_age").attr("disabled", true);
	    	//$("[name*='q90_5_year']").val('');
	    	$("[name*='q90_5_year']").attr("disabled", true);
	    }

if ($("input[name='q90_6']:checked").val() == 'no'){
	    	$("#q90_6_age").val('');
	    	$("#q90_6_age").attr("disabled", true);
	    	//$("[name*='q90_6_year']").val('');
	    	$("[name*='q90_6_year']").attr("disabled", true);
	    }


if ($("input[name='q91_1']:checked").val() == 'never'){
	    	//$("#q91_1_howManyYears").val('');
	    	$("#q91_1_howManyYears").attr("disabled", true);
	    }

if ($("input[name='q91_2']:checked").val() == 'never'){
	    	//$("#q91_2_howManyYears").val('');
	    	$("#q91_2_howManyYears").attr("disabled", true);
	    }

if ($("input[name='q91_3']:checked").val() == 'never'){
	    	//$("#q91_3_howManyYears").val('');
	    	$("#q91_3_howManyYears").attr("disabled", true);
	    }
if ($("input[name='q92_1']:checked").val() == 'never'){
	    	//$("#q92_1_howManyYears").val('');
	    	$("#q92_1_howManyYears").attr("disabled", true);
	    }
if ($("input[name='q92_2']:checked").val() == 'never'){
	    	//$("#q92_2_howManyYears").val('');
	    	$("#q92_2_howManyYears").attr("disabled", true);
	    }
if ($("input[name='q92_3']:checked").val() == 'never'){
	    	//$("#q92_3_howManyYears").val('');
	    	$("#q92_3_howManyYears").attr("disabled", true);
	    }
if ($("input[name='q92_4']:checked").val() == 'never'){
	    	//$("#q92_4_howManyYears").val('');
	    	$("#q92_4_howManyYears").attr("disabled", true);
	    }
if ($("input[name='q92_5']:checked").val() == 'never'){
	    	//$("#q92_5_howManyYears").val('');
	    	$("#q92_5_howManyYears").attr("disabled", true);
	    }
if ($("input[name='q92_6']:checked").val() == 'never'){
	    	//$("#q92_6_howManyYears").val('');
	    	$("#q92_6_howManyYears").attr("disabled", true);
	    }
if ($("input[name='q92_7']:checked").val() == 'never'){
	    	//$("#q92_7_howManyYears").val('');
	    	$("#q92_7_howManyYears").attr("disabled", true);
	    }
if ($("input[name='q92_8']:checked").val() == 'never'){
	    	//$("#q92_8_howManyYears").val('');
	    	$("#q92_8_howManyYears").attr("disabled", true);
	    }
if ($("input[name='q92_9']:checked").val() == 'never'){
	    	//$("#q92_9_howManyYears").val('');
	    	$("#q92_9_howManyYears").attr("disabled", true);
	    }
if ($("input[name='q93']:checked").val() == 'no'){
	    	//$("[name*='q93_'][type=radio]").attr('checked', false);
	    	$("[name*='q93_'][type=radio]").filter('[value="never"]').attr('checked', 'checked');
	    	$("[name*='q93_'][type=radio]").attr("disabled", true);	  
	    //	$("[name*='q93_'][type=text]").val('');
	    	$("[name*='q93_'][type=text]").attr("disabled", true);
	    }
if ($("input[name='q93_1']:checked").val() == 'never'){
	    	//$("#q93_1_howManyMonths").val('');
	    	$("#q93_1_howManyMonths").attr("disabled", true);
	    }
if ($("input[name='q93_2']:checked").val() == 'never'){
	    	//$("#q93_2_howManyMonths").val('');
	    	$("#q93_2_howManyMonths").attr("disabled", true);
	    }
if ($("input[name='q93_3']:checked").val() == 'never'){
	    	//$("#q93_3_howManyMonths").val('');
	    	$("#q93_3_howManyMonths").attr("disabled", true);
	    }
if ($("input[name='q93_4']:checked").val() == 'never'){
	    	//$("#q93_4_howManyMonths").val('');
	    	$("#q93_4_howManyMonths").attr("disabled", true);
	    }
if ($("input[name='q93_5']:checked").val() == 'never'){
	    	//$("#q93_5_howManyMonths").val('');
	    	$("#q93_5_howManyMonths").attr("disabled", true);
	    }
if ($("input[name='q94_1']:checked").val() == 'still_using'){
	    	//$("#q94_1_ageStop").val('');
	    	$("#q94_1_ageStop").attr("disabled", true);
	    }
if ($("input[name='q94_2']:checked").val() == 'still_using'){
	    	//$("#q94_2_ageStop").val('');
	    	$("#q94_2_ageStop").attr("disabled", true);
	    }
if ($("input[name='q94_3']:checked").val() == 'still_using'){
	    	//$("#q94_3_ageStop").val('');
	    	$("#q94_3_ageStop").attr("disabled", true);
	    }
if ($("input[name='q94_4']:checked").val() == 'still_using'){
	    	//$("#q94_4_ageStop").val('');
	    	$("#q94_4_ageStop").attr("disabled", true);
	    }
if ($("input[name='q94_4']:checked").val() == 'still_using'){
	    	//$("#q94_4_ageStop").val('');
	    	$("#q94_4_ageStop").attr("disabled", true);
	    }
if ($("input[name='q94_5']:checked").val() == 'still_using'){
	    	//$("#q94_5_ageStop").val('');
	    	$("#q94_5_ageStop").attr("disabled", true);
	    }
if ($("input[name='q94_6']:checked").val() == 'still_using'){
	    	//$("#q94_6_ageStop").val('');
	    	$("#q94_6_ageStop").attr("disabled", true);
	    }

	if ($("#mode").val()=='paper'){
			$('body').css('background-color', '#CCCCCC');
	}
		
});	 

function clear_q99()
{
	$("[name*='q94_'][type=radio]").attr("checked", false);
	$("[name*='q94_'][name$='ageStart']").val('');
	$("[name*='q94_'][name$='ageStop']").val('');
	$("[name*='q94_'][name$='NumPillsPerWeek']").val('');
	$("[name*='q94_otherMedName']").val('');
	$("[name*='q94_ageStart_status']").html('');
	$("[name*='q94_ageStop_status']").html('');
	$("[name*='q94_pills_status']").html('');
}
</g:javascript>
            <h1><g:message code="step14.label" default="Step14" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
<div id="errors" class="errors" style="display:none;">
</div>
            <g:form name="surveyform14"
            		onsubmit="if (document.getElementById('mode').value!='paper'){ return (checkForm14());} else {return confirmIfSure();}"
            		method="post" >
                <g:hiddenField name="id" value="${surveyInstance?.id}" />
                <g:hiddenField name="version" value="${surveyInstance?.version}" />
                <g:if test="${session.user.location!='MOFF' }">
                	<g:hiddenField name="mode" value="${surveyInstance?.mode}" />
                </g:if>
                <g:render template="/common/status_info"  model="['dob':surveyInstance?.DOB]"/>
                <div class="dialog">
                <br/><ul><label><g:message code="survey.q90" default="q90" /></label></ul>
                <%
				def yesno=[message(code:'survey.yes'), message(code:'survey.no')]
				def MedicalConditionList=[message(code:'survey.q90.t1'),
										message(code:'survey.q90.t2'),
										message(code:'survey.q90.t3'),
										message(code:'survey.q90.t4'),
										message(code:'survey.q90.t5'),
										message(code:'survey.q90.t6')]

				def q91and92freqList=[message(code:'survey.q91.freq1'),message(code:'survey.q91.freq2'),message(code:'survey.q91.freq3')]
				def q91and92freqList2=[message(code:'survey.never2'),message(code:'survey.q91.freq2'),message(code:'survey.q91.freq3')]

				 %>
                    <table class="box-table-b-wide">
                        <tbody>
						<g:each in="${MedicalConditionList}" status="i" var="medcond">
						<%def idx=i+1 %>
						<tr>
							<td style="width:35%;border: 1px solid #9baff1;font-weight:bold;">${idx}. ${medcond }</td>
							<td style="width:20%;border: 1px solid #9baff1;">
								<g:radioGroup name="${('q90_'+idx)}"
	                            	value="${surveyInstance?.('q90_'+idx)}" 
	                                labels="${yesno }" 
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>
							</td>
							<td style="width:20%;border: 1px solid #9baff1;">
								<g:message code="survey.age" /> <g:textField name="${('q90_'+idx+'_age')}" 
																			 value="${surveyInstance?.('q90_'+idx+'_age')}"  style="width:90px"
																			 onkeyup="checkIfValidNumber(this.value, 0, ageCalculated, document.getElementById(\'${('q90_age_status'+idx)}\')); "/> <span id="${('q90_age_status'+idx)}"></span>
							
							</td>
							<td style="border: 1px solid #9baff1;">
								<g:message code="survey.year" /> <g:datePicker name="${('q90_'+idx+'_year')}" precision="year" value="${surveyInstance?.('q90_'+idx+'_year')}"  
                                      years="${thisyear..birth[java.util.Calendar.YEAR]}" default="none" noSelection="${['':'--']}" />
							</td>
						</tr>
						</g:each>
						<tr>
							<td>
							 		7. <g:select name="${('q90_7_medcon')}"
							 				  value="${surveyInstance?.('q90_7_medcon')}"
							 				  from="${MedicalConditionList}"
							 				  noSelection="['':'']"/>									
							</td>
							<td>
								<g:radioGroup name="${('q90_7')}"
	                            	value="${surveyInstance?.('q90_7')}" 
	                                labels="${yesno }" 
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>							
							</td>
							<td>
								<g:message code="survey.age" /> <g:textField name="${('q90_7_age')}" 
																			 value="${surveyInstance?.('q90_7_age')}"  style="width:90px"
																			 onkeyup="checkIfValidNumber(this.value, 0, ageCalculated, document.getElementById(\'${('q90_age_status7')}\')); "/> <span id="${('q90_age_status7')}"></span>
							
							</td>
							<td>
							<g:message code="survey.year" /> <g:datePicker name="${('q90_7_year')}" precision="year" value="${surveyInstance?.('q90_7_year')}"  
                                      years="${thisyear..birth[java.util.Calendar.YEAR]}" default="none" noSelection="${['':'--']}" />
							
							</td>
						</tr>
						<tr>
							<td>
							 		8. <g:select name="${('q90_8_medcon')}"
							 				  value="${surveyInstance?.('q90_8_medcon')}"
							 				  from="${MedicalConditionList}"
							 				  noSelection="['':'']"/>									
							</td>
							<td>
								<g:radioGroup name="${('q90_8')}"
	                            	value="${surveyInstance?.('q90_8')}" 
	                                labels="${yesno }" 
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>							
							</td>
							<td>
								<g:message code="survey.age" /> <g:textField name="${('q90_8_age')}" 
																			 value="${surveyInstance?.('q90_8_age')}"  style="width:90px"
																			 onkeyup="checkIfValidNumber(this.value, 0, ageCalculated, document.getElementById(\'${('q90_age_status8')}\')); "/> <span id="${('q90_age_status8')}"></span>
							
							</td>
							<td>
							<g:message code="survey.year" /> <g:datePicker name="${('q90_8_year')}" precision="year" value="${surveyInstance?.('q90_8_year')}"  
                                      years="${thisyear..birth[java.util.Calendar.YEAR]}" default="none" noSelection="${['':'--']}" />
							
							</td>
						</tr>						
						<tr>
							<td>
							 		9. <g:select name="${('q90_9_medcon')}"
							 				  value="${surveyInstance?.('q90_9_medcon')}"
							 				  from="${MedicalConditionList}"
							 				  noSelection="['':'']"/>									
							</td>
							<td>
								<g:radioGroup name="${('q90_9')}"
	                            	value="${surveyInstance?.('q90_9')}" 
	                                labels="${yesno }" 
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>							
							</td>
							<td>
								<g:message code="survey.age" /> <g:textField name="${('q90_9_age')}" 
																			 value="${surveyInstance?.('q90_9_age')}"  style="width:90px"
																			 onkeyup="checkIfValidNumber(this.value, 0, ageCalculated, document.getElementById(\'${('q90_age_status9')}\')); "/> <span id="${('q90_age_status9')}"></span>
							
							</td>
							<td>
							<g:message code="survey.year" /> <g:datePicker name="${('q90_9_year')}" precision="year" value="${surveyInstance?.('q90_9_year')}"  
                                      years="${thisyear..birth[java.util.Calendar.YEAR]}" default="none" noSelection="${['':'--']}" />
							
							</td>
						</tr>						
						<tr>
							<td>
							 		10. <g:select name="${('q90_10_medcon')}"
							 				  value="${surveyInstance?.('q90_10_medcon')}"
							 				  from="${MedicalConditionList}"
							 				  noSelection="['':'']"/>									
							</td>
							<td>
								<g:radioGroup name="${('q90_10')}"
	                            	value="${surveyInstance?.('q90_10')}" 
	                                labels="${yesno }" 
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>							
							</td>
							<td>
								<g:message code="survey.age" /> <g:textField name="${('q90_10_age')}" 
																			 value="${surveyInstance?.('q90_10_age')}"  style="width:90px"
																			 onkeyup="checkIfValidNumber(this.value, 0, ageCalculated, document.getElementById(\'${('q90_age_status10')}\')); "/> <span id="${('q90_age_status10')}"></span>
							
							</td>
							<td>
							<g:message code="survey.year" /> <g:datePicker name="${('q90_10_year')}" precision="year" value="${surveyInstance?.('q90_10_year')}"  
                                      years="${thisyear..birth[java.util.Calendar.YEAR]}" default="none" noSelection="${['':'--']}" />
							
							</td>
						</tr>						
						<tr>
							<td>
							 		11. <g:select name="${('q90_11_medcon')}"
							 				  value="${surveyInstance?.('q90_11_medcon')}"
							 				  from="${MedicalConditionList}"
							 				  noSelection="['':'']"/>									
							</td>
							<td>
								<g:radioGroup name="${('q90_11')}"
	                            	value="${surveyInstance?.('q90_11')}" 
	                                labels="${yesno }" 
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>							
							</td>
							<td>
								<g:message code="survey.age" /> <g:textField name="${('q90_11_age')}" 
																			 value="${surveyInstance?.('q90_11_age')}"  style="width:90px"
																			 onkeyup="checkIfValidNumber(this.value, 0, ageCalculated, document.getElementById(\'${('q90_age_status11')}\')); "/> <span id="${('q90_age_status11')}"></span>
							
							</td>
							<td>
							<g:message code="survey.year" /> <g:datePicker name="${('q90_11_year')}" precision="year" value="${surveyInstance?.('q90_11_year')}"  
                                      years="${thisyear..birth[java.util.Calendar.YEAR]}" default="none" noSelection="${['':'--']}" />
							
							</td>
						</tr>						

                        </tbody>
                    </table>
                    
                    <br/><ul><label><g:message code="survey.q91" default="q91" /></label></ul>
                    <%
					def WhereList=[message(code:'survey.q91.t1'),message(code:'survey.q91.t2'),message(code:'survey.q91.t3')]
					 %>
					 <table class="box-table-b-wide">
					 <thead>
					 <tr>
					 	<th style="border: 1px solid #9baff1;" colspan="2"><strong><g:message code="survey.q91.table" default="q91.table" /></strong></td>
					 </tr>
					 </thead>
					 <tbody>
					 <g:each in="${WhereList }" status="i" var="location">
					 <%def idx=i+1 %>
					 <tr>
					 	<td style="width:25%;font-weight:bold;">
					 		${idx}. ${location }
					 	</td>
					 	<td>

								<g:radioGroup name="${('q91_'+idx)}"
	                            	value="${surveyInstance?.('q91_'+idx)}" 
	                                labels="${q91and92freqList }" 
	                                values="['never','yes_in_the_past', 'yes_currently']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>
								<br/>
								<div style="clear:left;">
									<g:message code="survey.howmanyyears" /> <g:textField name="${('q91_'+idx+'_howManyYears')}"
																			value="${surveyInstance?.('q91_'+idx+'_howManyYears')}" 
																			onkeyup="checkIfValidNumber(this.value, 0, ageCalculated, document.getElementById(\'${('q91_years_status'+idx)}\')); "/> <span id="${('q91_years_status'+idx)}"></span>
								</div>
					 	</td>
					 </tr>
					 </g:each>
					 </tbody>
					 </table>
					 
					 <br/><ul>
					 	<label><font color="blue"><g:message code="survey.q91.footnote.leisure" default="q91.leisure.footnote" /></font></label>
					 	<br/><br/><br/>
					 	<label><g:message code="survey.q92" default="q92" /></label>
					 </ul>
					 <%
					 def MaterialSubstanceList=[message(code:'survey.q92.t1'),
						 message(code:'survey.q92.t2'),
						 message(code:'survey.q92.t3'),
						 message(code:'survey.q92.t4'),
						 message(code:'survey.q92.t5'),
						 message(code:'survey.q92.t6'),
						 message(code:'survey.q92.t7'),
						 message(code:'survey.q92.t8'),
						 message(code:'survey.q92.t9')]
					  %>
					  <table class="box-table-b-wide">
					  <tbody>
					  <g:each in="${MaterialSubstanceList }" status="i" var="mat">
					  <% def idx=i+1 %>
					  <tr>
					  	<td style="width:25%;font-weight:bold;">
					  		${idx}. ${mat }
					  	</td>
					  	<td>
								<g:radioGroup name="${('q92_'+idx)}"
	                            	value="${surveyInstance?.('q92_'+idx)}" 
	                                labels="${q91and92freqList }" 
	                                values="['never','yes_in_the_past', 'yes_currently']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>
								<br/>
								<div style="clear:left;">
									<g:message code="survey.howmanyyears" /> <g:textField name="${('q92_'+idx+'_howManyYears')}" 
																						  value="${surveyInstance?.('q92_'+idx+'_howManyYears')}" 
																						  onkeyup="checkIfValidNumber(this.value, 0, ageCalculated, document.getElementById(\'${('q92_years_status'+idx)}\')); "/> <span id="${('q92_years_status'+idx)}"></span>
								</div>
					  	</td>
					  </tr>
					  </g:each>
					  </tbody>
					  </table>
					  
					  <br/>
					  <ul>
					  
					  	<div>
					  		<label><g:message code="survey.q93" default="q93" /></label>
					  	</div>
					  	<br/>
					  	<ul>
					  	<div>
					  		<g:radioGroup name="q93"
	                            	value="${surveyInstance?.q93}" 
	                                labels="${yesno }"
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
							</g:radioGroup>
						</div>
						</ul>
					  </ul>
					 
					<br/><br/>
					 <ul><g:message code="survey.q93.table" default="q93.table" /></ul>
					 <%
					 def NicotineReplacementList=[message(code:'survey.q93.t1'),
						 						message(code:'survey.q93.t2'),
												message(code:'survey.q93.t3'),
												message(code:'survey.q93.t4'),
												message(code:'survey.q93.t5')]
					  %>
					  <table class="box-table-b-wide">
					  <tbody>
					  <g:each in="${NicotineReplacementList }" status="i" var="replacement">
					  <%def idx=i+1 %>
					  <tr>
					  	<td style="width:25%;font-weight:bold;">${idx}. ${replacement }</td>
					  	<td>
								<g:radioGroup name="${('q93_'+idx)}"
	                            	value="${surveyInstance?.('q93_'+idx)}" 
	                                labels="${q91and92freqList2 }" 
	                                values="['never','yes_in_the_past', 'yes_currently']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>
								<br/>
								<div style="clear:left;">
									<g:message code="survey.monthsofuse" /> <g:textField name="${('q93_'+idx+'_howManyMonths')}"
																						 value="${surveyInstance?.('q93_'+idx+'_howManyMonths')}"
																						 onkeyup="checkIfValidNumber(this.value, 0, ageCalculated, document.getElementById(\'${('q93_months_status'+idx)}\')); "/> <span id="${('q93_months_status'+idx)}"></span>
								</div>					  	
					  	</td>
					  </tr>
					  </g:each>
					  </tbody>
					  </table>
					  
					  <br/><ul><label><g:message code="survey.q94" default="q94" /></label></ul>
					  <%
					  def DrugMedicineList=[message(code:'survey.q94.t1'),
						  					message(code:'survey.q94.t2'),
											message(code:'survey.q94.t3'),
											message(code:'survey.q94.t4'),
											message(code:'survey.q94.t5'),
											message(code:'survey.q94.t6')]
					  def q94StillNoLongerList=[message(code:'survey.stillusing'),message(code:'survey.nolongerusing')] 
					 %>					   
					   <table class="box-table-b-wide">
					   <thead>
					   <tr>
					   		<th style="border: 1px solid #9baff1;;font-weight:bold;" colspan="5">
					   		<g:message code="survey.q94.table" /><input onclick="clear_q99();" type="button" value="Clear Q99" />
					   		</th>
					   </tr>
					   <tr>
					   		<th><g:message code="survey.q94.th1" /></th>
					   		<th><g:message code="survey.q94.th2" /></th>
					   		<th><g:message code="survey.q94.th3" /></th>
					   		<th><g:message code="survey.q94.th4" /></th>
					   		<th><g:message code="survey.q94.th5" /></th>
					   </tr>
					   </thead>
					   <tbody>
					   <g:each in="${DrugMedicineList }" status="i" var="drug">
					   <%def idx=i+1 %>
					   <tr>
					   		<td style="width:40%;font-weight:bold;">${idx}. ${drug }
					   		<g:if test="${idx==5}">
					   			<g:textField style="width:100px" name="q94_otherMedName1" value="${surveyInstance?.q94_otherMedName1}" />
					   		</g:if>
					   		<g:if test="${idx==6}">
					   			<g:textField style="width:100px" name="q94_otherMedName2" value="${surveyInstance?.q94_otherMedName2}" />
					   		</g:if>
					   		</td>
					   		<td style="width:5%">
					   			<g:textField style="width:50px" 
					   				name="${('q94_'+idx+'_ageStart')}" 
					   				value="${surveyInstance?.('q94_'+idx+'_ageStart')}"
									onkeyup="checkIfValidNumber(this.value, 0, ageCalculated, document.getElementById(\'${('q94_ageStart_status'+idx)}\')); "/> <span name="${('q94_ageStart_status'+idx)}" id="${('q94_ageStart_status'+idx)}"></span>
					   		</td>
					   		<td style="width:5%">
					   			<g:textField style="width:100px" 
					   				name="${('q94_'+idx+'_NumPillsPerWeek')}" 
					   				value="${surveyInstance?.('q94_'+idx+'_NumPillsPerWeek')}"
					   				onkeyup="checkIfValidNumber(this.value, 0, 200, document.getElementById(\'${('q94_pills_status'+idx)}\')); "/> <span name="${('q94_pills_status'+idx)}" id="${('q94_pills_status'+idx)}"></span>
					   		</td>
					   		<td style="width:30%">

					   			<g:radioGroup name="${('q94_'+idx)}"
	                            	value="${surveyInstance?.('q94_'+idx)}" 
	                                labels="${q94StillNoLongerList}" 
	                                values="['still_using','no_longer_using']" >
									<g:render template="/common/checkmark_radio_v" model="[it:it]"/>
								</g:radioGroup>
					   		</td>
					   		<td style="width:5%">
					   			<g:textField style="width:50px" 
					   				name="${('q94_'+idx+'_ageStop')}" 
					   				value="${surveyInstance?.('q94_'+idx+'_ageStop')}"
					   				onkeyup="checkIfValidNumber(this.value, document.getElementById('q94_${idx}_ageStart').value, ${surveyInstance?.age ? surveyInstance?.age : 100 }, document.getElementById(\'${('q94_ageStop_status'+idx)}\')); "/> <span name="${('q94_ageStop_status'+idx)}" id="${('q94_ageStop_status'+idx)}"></span>
					   		</td>
					   </tr>
					   </g:each>
					   <tr>
					   		<td style="width:30%;font-weight:bold;">
					   			7. <g:message code="survey.q94.t.other" /> #3
					   			<g:textField style="width:100px" name="q94_otherMedName3" value="${surveyInstance?.q94_otherMedName3}" />
					   		</td>
					   		<td>
					   			<g:textField style="width:50px" 
					   				name="${('q94_7_ageStart')}" 
					   				value="${surveyInstance?.('q94_7_ageStart')}"
									onkeyup="checkIfValidNumber(this.value, 0, ageCalculated, document.getElementById(\'${('q94_ageStart_status7')}\')); "/> <span id="${('q94_ageStart_status7')}"></span>
					   		
					   		</td>
					   		<td>
					   			<g:textField style="width:100px" 
					   				name="${('q94_7_NumPillsPerWeek')}" 
					   				value="${surveyInstance?.('q94_7_NumPillsPerWeek')}"
					   				onkeyup="checkIfValidNumber(this.value, 0, 200, document.getElementById(\'${('q94_pills_status7')}\')); "/> <span id="${('q94_pills_status7')}"></span>
					   		
					   		</td>
					   		<td>
					   			<g:radioGroup name="${('q94_7')}"
	                            	value="${surveyInstance?.('q94_7')}" 
	                                labels="${q94StillNoLongerList}" 
	                                values="['still_using','no_longer_using']" >
									<g:render template="/common/checkmark_radio_v" model="[it:it]"/>
								</g:radioGroup>					   		
					   		</td>
					   		<td>
					   			<g:textField style="width:50px" 
					   				name="${('q94_7_ageStop')}" 
					   				value="${surveyInstance?.('q94_7_ageStop')}"
					   				onkeyup="checkIfValidNumber(this.value, document.getElementById('q94_7_ageStart').value, ${surveyInstance?.age ? surveyInstance?.age : 100 }, document.getElementById(\'${('q94_ageStop_status7')}\')); "/> <span id="${('q94_ageStop_status7')}"></span>
					   		</td>
					   </tr>
					   <tr>
					   		<td style="width:30%;font-weight:bold;">
					   			8. <g:message code="survey.q94.t.other" /> #4
					   			<g:textField style="width:100px" name="q94_otherMedName4" value="${surveyInstance?.q94_otherMedName4}" />
					   		</td>
					   		<td>
					   			<g:textField style="width:50px" 
					   				name="${('q94_8_ageStart')}" 
					   				value="${surveyInstance?.('q94_8_ageStart')}"
									onkeyup="checkIfValidNumber(this.value, 0, ageCalculated, document.getElementById(\'${('q94_ageStart_status8')}\')); "/> <span id="${('q94_ageStart_status8')}"></span>
					   		
					   		</td>
					   		<td>
					   			<g:textField style="width:100px" 
					   				name="${('q94_8_NumPillsPerWeek')}" 
					   				value="${surveyInstance?.('q94_8_NumPillsPerWeek')}"
					   				onkeyup="checkIfValidNumber(this.value, 0, 200, document.getElementById(\'${('q94_pills_status8')}\')); "/> <span id="${('q94_pills_status8')}"></span>
					   		
					   		</td>
					   		<td>
					   			<g:radioGroup name="${('q94_8')}"
	                            	value="${surveyInstance?.('q94_8')}" 
	                                labels="${q94StillNoLongerList}" 
	                                values="['still_using','no_longer_using']" >
									<g:render template="/common/checkmark_radio_v" model="[it:it]"/>
								</g:radioGroup>					   		
					   		</td>
					   		<td>
					   			<g:textField style="width:50px" 
					   				name="${('q94_8_ageStop')}" 
					   				value="${surveyInstance?.('q94_8_ageStop')}"
					   				onkeyup="checkIfValidNumber(this.value, document.getElementById('q94_8_ageStart').value, ${surveyInstance?.age ? surveyInstance?.age : 100 }, document.getElementById(\'${('q94_ageStop_status8')}\')); "/> <span id="${('q94_ageStop_status8')}"></span>
					   		</td>
					   </tr>
					   <tr>
					   		<td style="width:30%;font-weight:bold;">
					   			9. <g:message code="survey.q94.t.other" /> #5
					   			<g:textField style="width:100px" name="q94_otherMedName5" value="${surveyInstance?.q94_otherMedName5}" />
					   		</td>
					   		<td>
					   			<g:textField style="width:50px" 
					   				name="${('q94_9_ageStart')}" 
					   				value="${surveyInstance?.('q94_9_ageStart')}"
									onkeyup="checkIfValidNumber(this.value, 0, ageCalculated, document.getElementById(\'${('q94_ageStart_status9')}\')); "/> <span id="${('q94_ageStart_status9')}"></span>
					   		
					   		</td>
					   		<td>
					   			<g:textField style="width:100px" 
					   				name="${('q94_9_NumPillsPerWeek')}" 
					   				value="${surveyInstance?.('q94_9_NumPillsPerWeek')}"
					   				onkeyup="checkIfValidNumber(this.value, 0, 200, document.getElementById(\'${('q94_pills_status9')}\')); "/> <span id="${('q94_pills_status9')}"></span>
					   		
					   		</td>
					   		<td>
					   			<g:radioGroup name="${('q94_9')}"
	                            	value="${surveyInstance?.('q94_9')}" 
	                                labels="${q94StillNoLongerList}" 
	                                values="['still_using','no_longer_using']" >
									<g:render template="/common/checkmark_radio_v" model="[it:it]"/>
								</g:radioGroup>					   		
					   		</td>
					   		<td>
					   			<g:textField style="width:50px" 
					   				name="${('q94_9_ageStop')}" 
					   				value="${surveyInstance?.('q94_9_ageStop')}"
					   				onkeyup="checkIfValidNumber(this.value, document.getElementById('q94_9_ageStart').value, ${surveyInstance?.age ? surveyInstance?.age : 100 }, document.getElementById(\'${('q94_ageStop_status9')}\')); "/> <span id="${('q94_ageStop_status9')}"></span>
					   		</td>
					   </tr>
					   
					   
					   </tbody>
					   </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'button.save-finish-later.label', default: 'update')}"  onclick="DisableEnableForm(document.surveyform14,false);" /></span>
                    <span class="button"><g:actionSubmit class="back" action="step13" value="${message(code: 'button.go-back.label', default: 'back')}"  onclick="DisableEnableForm(document.surveyform14,false);" /></span>
                    <%--<span class="button"><g:render template="/common/back_button"/></span>
                    <span class="button"><input type="reset" value="${message(code: 'button.reset-all.label', default: 'reset')}"></span> --%>  
                    <span class="button"><g:actionSubmit class="next" action="update_unified" value="${message(code: 'button.save-then-go-to-next.label', default: 'next')}"  onclick="DisableEnableForm(document.surveyform14,false);" /></span>
                    <span class="menuButton"><g:render template="/common/step_meter"/></span>
                 </div>
            </g:form>
        </div>
    </body>
</html>
