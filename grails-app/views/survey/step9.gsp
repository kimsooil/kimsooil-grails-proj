<%@ page import="u56survey.Survey" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'survey.label', default: 'Survey')}" />
        <title><g:message code="step9.label" default="Step9" /></title>

		<%-- <jv:generateValidation domain="survey" form="surveyform9"  display="list" container="errors"/> --%>  

		<g:render template="errMsgsToJson-js"/>

		<g:javascript src="check_step9.js" />       

			
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
  DisableEnableForm(document.surveyform9,true);
  $("[name=_action_update]").attr("disabled", false);
  $("[name=_action_step8]").attr("disabled", false);
  $("[name=_action_update_unified]").attr("disabled", false);  
}   
</g:if>
function IsDateQ48()
{
	if ( ($("#q48dateLastVisitGynecologist_year").val() == "<%=today[java.util.Calendar.YEAR]%>")  &&
		(parseInt($("#q48dateLastVisitGynecologist_month").val()) > <%=today[java.util.Calendar.MONTH]+1%>)
	){
		return false;
	}
	else if ( ($("#q48dateLastVisitGynecologist_year").val() == "<%=birth[java.util.Calendar.YEAR]%>")  &&
		(parseInt($("#q48dateLastVisitGynecologist_month").val()) < <%=birth[java.util.Calendar.MONTH]+1%>)
	){
		return false;
	}
	
	else {
		return true;
	}
}
function IsDateQ51_1()
{
	if ( ($("#q51date1_year").val() == "<%=today[java.util.Calendar.YEAR]%>")  &&
		(parseInt($("#q51date1_month").val()) > <%=today[java.util.Calendar.MONTH]+1%>)
	){
		return false;
	}
	else if ( ($("#q51date1_year").val() == "<%=birth[java.util.Calendar.YEAR]%>")  &&
		(parseInt($("#q51date1_month").val()) < <%=birth[java.util.Calendar.MONTH]+1%>)
	){
		return false;
	}
	else {
		return true;
	}
}
function IsDateQ51_2()
{
	if ( ($("#q51date2_year").val() == "<%=today[java.util.Calendar.YEAR]%>")  &&
		(parseInt($("#q51date2_month").val()) > <%=today[java.util.Calendar.MONTH]+1%>)
	){
		return false;
	}
	else if ( ($("#q51date2_year").val() == "<%=birth[java.util.Calendar.YEAR]%>")  &&
		(parseInt($("#q51date2_month").val()) < <%=birth[java.util.Calendar.MONTH]+1%>)
	){
		return false;
	}
	else {
		return true;
	}
}
function IsDateQ51_3()
{
	if ( ($("#q51date3_year").val() == "<%=today[java.util.Calendar.YEAR]%>")  &&
		(parseInt($("#q51date3_month").val()) > <%=today[java.util.Calendar.MONTH]+1%>)
	){
		return false;
	}
	else if ( ($("#q51date3_year").val() == "<%=birth[java.util.Calendar.YEAR]%>")  &&
		(parseInt($("#q51date3_month").val()) < <%=birth[java.util.Calendar.MONTH]+1%>)
	){
		return false;
	}
	else {
		return true;
	}
}
function IsDateQ51_4()
{
	if ( ($("#q51date4_year").val() == "<%=today[java.util.Calendar.YEAR]%>")  &&
		(parseInt($("#q51date4_month").val()) > <%=today[java.util.Calendar.MONTH]+1%>)
	){
		return false;
	}
	else if ( ($("#q51date4_year").val() == "<%=birth[java.util.Calendar.YEAR]%>")  &&
		(parseInt($("#q51date4_month").val()) < <%=birth[java.util.Calendar.MONTH]+1%>)
	){
		return false;
	}
	else {
		return true;
	}
}
function IsDateQ51_5()
{
	if ( ($("#q51date5_year").val() == "<%=today[java.util.Calendar.YEAR]%>")  &&
		(parseInt($("#q51date5_month").val()) > <%=today[java.util.Calendar.MONTH]+1%>)
	){
		return false;
	}
	else if ( ($("#q51date5_year").val() == "<%=birth[java.util.Calendar.YEAR]%>")  &&
		(parseInt($("#q51date5_month").val()) < <%=birth[java.util.Calendar.MONTH]+1%>)
	){
		return false;
	}
	else {
		return true;
	}
}
function IsDateQ51_6()
{
	if ( ($("#q51date6_year").val() == "<%=today[java.util.Calendar.YEAR]%>")  &&
		(parseInt($("#q51date6_month").val()) > <%=today[java.util.Calendar.MONTH]+1%>)
	){
		return false;
	}
	else if ( ($("#q51date6_year").val() == "<%=birth[java.util.Calendar.YEAR]%>")  &&
		(parseInt($("#q51date6_month").val()) < <%=birth[java.util.Calendar.MONTH]+1%>)
	){
		return false;
	}
	
	else {
		return true;
	}
}

function IsDateQ52()
{
	if ( ($("#q52dateMostRecentPapSmear_year").val() == "<%=today[java.util.Calendar.YEAR]%>")  &&
		(parseInt($("#q52dateMostRecentPapSmear_month").val()) > <%=today[java.util.Calendar.MONTH]+1%>)
	){
		return false;
	}
	else if ( ($("#q52dateMostRecentPapSmear_year").val() == "<%=birth[java.util.Calendar.YEAR]%>")  &&
		(parseInt($("#q52dateMostRecentPapSmear_month").val()) < <%=birth[java.util.Calendar.MONTH]+1%>)
	){
		return false;
	}
	
	else {
		return true;
	}
}
$(document).ready(function(){

$.jqDialog.alert('<p align="center"><img src="${resource(dir:'images',file:'female.gif')}" align="absmiddle" alt="female" /><br/><g:message code="female.only.page" /><br/></p>');

	$("input[name='q47']").change(function(){
	    if ($("input[name='q47']:checked").val() != 'never'){
	    	$("[name*='q48dateLastVisitGynecologist']").attr("disabled", '');	    			    
	    }
	    else if ($("input[name='q47']:checked").val() == 'never'){
	    	$("[name*='q48dateLastVisitGynecologist']").val('');
	    	$("[name*='q48dateLastVisitGynecologist']").attr("disabled", true);	  
	    }
	});
	$("#q48dateLastVisitGynecologist_month").change(function() {
			if (!IsDateQ48())
			{
				$('#alertIfInvalid48').attr('innerHTML', " <label style='color:#ff0000'>(!)</label>");
				$("q48dateLastVisitGynecologist_month").focus();
			}
			else {
				$('#alertIfInvalid48').attr('innerHTML', "");
			}	
		}
	);
	$("#q48dateLastVisitGynecologist_year").change(function() {
			if (!IsDateQ48())
			{
				$('#alertIfInvalid48').attr('innerHTML', " <label style='color:#ff0000'>(!)</label>");
				$("#q48dateLastVisitGynecologist_year").focus();
			}
			else {
				$('#alertIfInvalid48').attr('innerHTML', "");
			}	
		}
	);	 
	$("input[name='q49']").change(function(){
	    if ($("input[name='q49']:checked").val() == 'yes'){

	    	$("#q49_findings_pelvic_exam").attr("disabled", '');	    			    
	    }
	    else if ($("input[name='q49']:checked").val() == 'no'){
	    	$("#q49_findings_pelvic_exam").val('');
	    	$("#q49_findings_pelvic_exam").attr("disabled", true);	  
	    }
	});
	$("input[name='q50']").change(function(){
	    if ($("input[name='q50']:checked").val() == 'yes'){

	    	$("#q50_findings_digital_rectal_exam").attr("disabled", '');	    			    
	    }
	    else if ($("input[name='q50']:checked").val() == 'no'){
	    	$("#q50_findings_digital_rectal_exam").val('');
	    	$("#q50_findings_digital_rectal_exam").attr("disabled", true);	  
	    }
	});
	$("input[name='q51']").change(function(){
	    if ($("input[name='q51']:checked").val() == 'yes'){

	    	$("[name*='q51_']").attr("disabled", '');	    			    
	    }
	    else if ($("input[name='q51']:checked").val() == 'no'){
	    	$("[name*='q51_']").val('');
	    	$("[name*='q51_']").attr("disabled", true);	  
	    }
	});
	$("input[name='q51_1']").change(function(){
	    if ($("input[name='q51_1']:checked").val() == 'yes'){
	    	$("[name*='q51_1_']").attr("disabled", '');	  
	    }
	    else if ($("input[name='q51_1']:checked").val() == 'no'){
	    	$("[name*='q51_1_']").val('');
	    	$("[name*='q51_1_']").attr("disabled", true);	  	 
	    }
	});
	$("#q51date1_month").change(function() {
			if (!IsDateQ51_1())
			{
				$('#q51_1_status').attr('innerHTML', " <label style='color:#ff0000'>(!)</label>");
				$("q51date1_month").focus();
			}
			else {
				$('#q51_1_status').attr('innerHTML', "");
			}	
		}
	);
	$("#q51date1_year").change(function() {
			if (!IsDateQ51_1())
			{
				$('#q51_1_status').attr('innerHTML', " <label style='color:#ff0000'>(!)</label>");
				$("#q51date1_year").focus();
			}
			else {
				$('#q51_1_status').attr('innerHTML', "");
			}	
		}
	);		
	$("input[name='q51_2']").change(function(){
	    if ($("input[name='q51_2']:checked").val() == 'yes'){
	    	$("[name*='q51_2_']").attr("disabled", '');	  
	    }
	    else if ($("input[name='q51_2']:checked").val() == 'no'){
	    	$("[name*='q51_2_']").val('');
	    	$("[name*='q51_2_']").attr("disabled", true);	  	 
	    }
	});
	$("#q51date2_month").change(function() {
			if (!IsDateQ51_2())
			{
				$('#q51_2_status').attr('innerHTML', " <label style='color:#ff0000'>(!)</label>");
				$("q51date2_month").focus();
			}
			else {
				$('#q51_2_status').attr('innerHTML', "");
			}	
		}
	);
	$("#q51date2_year").change(function() {
			if (!IsDateQ51_2())
			{
				$('#q51_2_status').attr('innerHTML', " <label style='color:#ff0000'>(!)</label>");
				$("#q51date2_year").focus();
			}
			else {
				$('#q51_2_status').attr('innerHTML', "");
			}	
		}
	);
	$("input[name='q51_3']").change(function(){
	    if ($("input[name='q51_3']:checked").val() == 'yes'){
	    	$("[name*='q51_3_']").attr("disabled", '');	  
	    }
	    else if ($("input[name='q51_3']:checked").val() == 'no'){
	    	$("[name*='q51_3_']").val('');
	    	$("[name*='q51_3_']").attr("disabled", true);	  	 
	    }
	});	
	$("#q51date3_month").change(function() {
			if (!IsDateQ51_3())
			{
				$('#q51_3_status').attr('innerHTML', " <label style='color:#ff0000'>(!)</label>");
				$("q51date3_month").focus();
			}
			else {
				$('#q51_3_status').attr('innerHTML', "");
			}	
		}
	);
	$("#q51date3_year").change(function() {
			if (!IsDateQ51_3())
			{
				$('#q51_3_status').attr('innerHTML', " <label style='color:#ff0000'>(!)</label>");
				$("#q51date3_year").focus();
			}
			else {
				$('#q51_3_status').attr('innerHTML', "");
			}	
		}
	);
	$("input[name='q51_4']").change(function(){
	    if ($("input[name='q51_4']:checked").val() == 'yes'){
	    	$("[name*='q51_4_']").attr("disabled", '');	  
	    }
	    else if ($("input[name='q51_4']:checked").val() == 'no'){
	    	$("[name*='q51_4_']").val('');
	    	$("[name*='q51_4_']").attr("disabled", true);	  	 
	    }
	});
	$("#q51date4_month").change(function() {
			if (!IsDateQ51_4())
			{
				$('#q51_4_status').attr('innerHTML', " <label style='color:#ff0000'>(!)</label>");
				$("q51date4_month").focus();
			}
			else {
				$('#q51_4_status').attr('innerHTML', "");
			}	
		}
	);
	$("#q51date4_year").change(function() {
			if (!IsDateQ51_4())
			{
				$('#q51_4_status').attr('innerHTML', " <label style='color:#ff0000'>(!)</label>");
				$("#q51date4_year").focus();
			}
			else {
				$('#q51_4_status').attr('innerHTML', "");
			}	
		}
	);
	$("input[name='q51_5']").change(function(){
	    if ($("input[name='q51_5']:checked").val() == 'yes'){
	    	$("[name*='q51_5_']").attr("disabled", '');	  
	    }
	    else if ($("input[name='q51_5']:checked").val() == 'no'){
	    	$("[name*='q51_5_']").val('');
	    	$("[name*='q51_5_']").attr("disabled", true);	  	 
	    }
	});	
	$("#q51date5_month").change(function() {
			if (!IsDateQ51_5())
			{
				$('#q51_5_status').attr('innerHTML', " <label style='color:#ff0000'>(!)</label>");
				$("q51date5_month").focus();
			}
			else {
				$('#q51_5_status').attr('innerHTML', "");
			}	
		}
	);
	$("#q51date5_year").change(function() {
			if (!IsDateQ51_5())
			{
				$('#q51_5_status').attr('innerHTML', " <label style='color:#ff0000'>(!)</label>");
				$("#q51date5_year").focus();
			}
			else {
				$('#q51_5_status').attr('innerHTML', "");
			}	
		}
	);
	$("input[name='q51_6']").change(function(){
	    if ($("input[name='q51_6']:checked").val() == 'yes'){
	    	$("[name*='q51_6_']").attr("disabled", '');	  
	    }
	    else if ($("input[name='q51_6']:checked").val() == 'no'){
	    	$("[name*='q51_6_']").val('');
	    	$("[name*='q51_6_']").attr("disabled", true);	  	 
	    }
	});	
	$("#q51date6_month").change(function() {
			if (!IsDateQ51_6())
			{
				$('#q51_6_status').attr('innerHTML', " <label style='color:#ff0000'>(!)</label>");
				$("q51date6_month").focus();
			}
			else {
				$('#q51_6_status').attr('innerHTML', "");
			}	
		}
	);
	$("#q51date6_year").change(function() {
			if (!IsDateQ51_6())
			{
				$('#q51_6_status').attr('innerHTML', " <label style='color:#ff0000'>(!)</label>");
				$("#q51date6_year").focus();
			}
			else {
				$('#q51_6_status').attr('innerHTML', "");
			}	
		}
	);
	$("input[name='q52']").change(function(){
	    if ($("input[name='q52']:checked").val() == 'yes'){
	    	$("[name*='q52_']").attr("disabled", '');	  
	    }
	    else if ($("input[name='q52']:checked").val() == 'no'){
	    	$("[name*='q52_']").val('');
	    	$("[name*='q52_']").attr("disabled", true);	  
	    		 
	    }
	});
	$("#q52dateMostRecentPapSmear_month").change(function() {
			if (!IsDateQ52())
			{
				$('#alertIfInvalid52').attr('innerHTML', " <label style='color:#ff0000'>(!)</label>");
				$("q52dateMostRecentPapSmear_month").focus();
			}
			else {
				$('#alertIfInvalid52').attr('innerHTML', "");
			}	
		}
	);
	$("#q52dateMostRecentPapSmear_year").change(function() {
			if (!IsDateQ52())
			{
				$('#alertIfInvalid52').attr('innerHTML', " <label style='color:#ff0000'>(!)</label>");
				$("#q52dateMostRecentPapSmear_year").focus();
			}
			else {
				$('#alertIfInvalid52').attr('innerHTML', "");
			}	
		}
	);	 
	
	$("input[name='q53']").change(function(){
	    if ($("input[name='q53']:checked").val() == 'yes'){
	    	
	    	$("[name*='q53_']").attr("disabled", '');	  
	    }
	    else if ($("input[name='q53']:checked").val() == 'no'){
	    	$("[name*='q53_']").val('');
	    	$("[name*='q53_']").attr("disabled", true);	  
	    		 
	    }
	});									
});	
</g:javascript>    
	
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
			<span class="menuButton"><g:render template="/common/step_meter"/></span>
        </div>
        <div class="body">
<g:javascript>
$(document).ready(function(){



	    if ($("input[name='q47']:checked").val() != 'never'){
	    	$("[name*='q48dateLastVisitGynecologist']").attr("disabled", '');	    			    
	    }
	    else if ($("input[name='q47']:checked").val() == 'never'){
	    	$("[name*='q48dateLastVisitGynecologist']").val('');
	    	$("[name*='q48dateLastVisitGynecologist']").attr("disabled", true);	  
	    }

	    if ($("input[name='q49']:checked").val() == 'yes'){

	    	$("#q49_findings_pelvic_exam").attr("disabled", '');	    			    
	    }
	    else if ($("input[name='q49']:checked").val() == 'no'){
	    	$("#q49_findings_pelvic_exam").val('');
	    	$("#q49_findings_pelvic_exam").attr("disabled", true);	  
	    }


	    if ($("input[name='q50']:checked").val() == 'yes'){

	    	$("#q50_findings_digital_rectal_exam").attr("disabled", '');	    			    
	    }
	    else if ($("input[name='q50']:checked").val() == 'no'){
	    	$("#q50_findings_digital_rectal_exam").val('');
	    	$("#q50_findings_digital_rectal_exam").attr("disabled", true);	  
	    }

	    if ($("input[name='q51']:checked").val() == 'yes'){

	    	$("[name*='q51_']").attr("disabled", '');	    			    
	    }
	    else if ($("input[name='q51']:checked").val() == 'no'){
	    	$("[name*='q51_']").val('');
	    	$("[name*='q51_']").attr("disabled", true);	  
	    }

	    if ($("input[name='q51_1']:checked").val() == 'yes'){
	    	$("[name*='q51_1_']").attr("disabled", '');	  
	    }
	    else if ($("input[name='q51_1']:checked").val() == 'no'){
	    	$("[name*='q51_1_']").val('');
	    	$("[name*='q51_1_']").attr("disabled", true);	  	 
	    }
	    if ($("input[name='q51_2']:checked").val() == 'yes'){
	    	$("[name*='q51_2_']").attr("disabled", '');	  
	    }
	    else if ($("input[name='q51_2']:checked").val() == 'no'){
	    	$("[name*='q51_2_']").val('');
	    	$("[name*='q51_2_']").attr("disabled", true);	  	 
	    }
	    if ($("input[name='q51_3']:checked").val() == 'yes'){
	    	$("[name*='q51_3_']").attr("disabled", '');	  
	    }
	    else if ($("input[name='q51_3']:checked").val() == 'no'){
	    	$("[name*='q51_3_']").val('');
	    	$("[name*='q51_3_']").attr("disabled", true);	  	 
	    }
	    if ($("input[name='q51_4']:checked").val() == 'yes'){
	    	$("[name*='q51_4_']").attr("disabled", '');	  
	    }
	    else if ($("input[name='q51_4']:checked").val() == 'no'){
	    	$("[name*='q51_4_']").val('');
	    	$("[name*='q51_4_']").attr("disabled", true);	  	 
	    }
	    if ($("input[name='q51_5']:checked").val() == 'yes'){
	    	$("[name*='q51_5_']").attr("disabled", '');	  
	    }
	    else if ($("input[name='q51_5']:checked").val() == 'no'){
	    	$("[name*='q51_5_']").val('');
	    	$("[name*='q51_5_']").attr("disabled", true);	  	 
	    }
	    if ($("input[name='q51_6']:checked").val() == 'yes'){
	    	$("[name*='q51_6_']").attr("disabled", '');	  
	    }
	    else if ($("input[name='q51_6']:checked").val() == 'no'){
	    	$("[name*='q51_6_']").val('');
	    	$("[name*='q51_6_']").attr("disabled", true);	  	 
	    }
	    if ($("input[name='q52']:checked").val() == 'yes'){
	    	$("[name*='q52_']").attr("disabled", '');	  
	    }
	    else if ($("input[name='q52']:checked").val() == 'no'){
	    	$("[name*='q52_']").val('');
	    	$("[name*='q52_']").attr("disabled", true);	  
	    		 
	    }
	    if ($("input[name='q53']:checked").val() == 'yes'){
	    	
	    	$("[name*='q53_']").attr("disabled", '');	  
	    }
	    else if ($("input[name='q53']:checked").val() == 'no'){
	    	$("[name*='q53_']").val('');
	    	$("[name*='q53_']").attr("disabled", true);	  
	    		 
	    }
								
});	

</g:javascript>        
            <h1><g:message code="step9.label" default="Step9" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
<div id="errors" class="errors" style="display:none;">
</div>
            <g:form name="surveyform9"
            		onsubmit="return checkForm9();"
            		method="post" >
                <g:hiddenField name="id" value="${surveyInstance?.id}" />
                <g:hiddenField name="version" value="${surveyInstance?.version}" />
                <g:render template="/common/status_info" model="['dob':surveyInstance?.DOB]"/>
                <div class="dialog">
					<br/><ul><label><g:message code="survey.q45" default="q45" /></label></ul>
					<%

					def yesno=[message(code:'survey.yes'), message(code:'survey.no')]
					
					def GynecologicalProblemList=[message(code:'survey.q45.t1'),
												message(code:'survey.q45.t2'),
												message(code:'survey.q45.t3'),
												message(code:'survey.q45.t4'),
												message(code:'survey.q45.t5'),
												message(code:'survey.q45.t6'),
												message(code:'survey.q45.t7')]
					
					 %>
					<table class="box-table-b-wide">
					<thead>
					<tr>
						<th><g:message code="survey.gynecologicalProblem" default="Gynecological Problem" /></th>
						<th><g:message code="survey.yesno" default="Yes / No" /></th>
					</tr>
					</thead>
					<tbody>
					<g:each in="${GynecologicalProblemList}" status="i" var="problem">
					<% def idx=i+1 %>
					<tr>
						<td style="width:50%;font-weight:bold;">${idx}. ${problem }
						</td>
						<td>
                        	<g:radioGroup name="${('q45_'+idx)}"
                            	value="${surveyInstance?.('q45_'+idx)}" 
                                labels="${yesno }"
                                values="['yes','no']" >
								<g:render template="/common/checkmark_radio" model="[it:it]"/>
							</g:radioGroup>						
						</td>
					</tr>
					</g:each>
					</tbody>
					</table>
					   
					<br/><ul><label><g:message code="survey.q46" default="q46" /></label></ul>
					<%
					def GastrointestinalSymptomList=[message(code:'survey.q46.t1'),
												message(code:'survey.q46.t2'),
												message(code:'survey.q46.t3'),
												message(code:'survey.q46.t4'),
												message(code:'survey.q46.t5'),
												message(code:'survey.q46.t6')]

					 %>
					<table class="box-table-b-wide">
					<thead>
					<tr>
						<th><g:message code="survey.gastrointestinalSymptom" default="Gastrointestinal Symptom" /></th>
						<th><g:message code="survey.yesno" default="Yes / No" /></th>
					</tr>
					</thead>
					<tbody>
					<g:each in="${GastrointestinalSymptomList}" status="i" var="symptom">
					<% def idx=i+1 %>
					<tr>
						<td style="width:50%;font-weight:bold;">${idx}. ${symptom }
						</td>
						<td>
                        	<g:radioGroup name="${('q46_'+idx)}"
                            	value="${surveyInstance?.('q46_'+idx)}" 
                                labels="${yesno }"
                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
									
							</g:radioGroup>						
						</td>
					</tr>
					</g:each>
					<tr>
						<td><label style="font-weight:bold;"><g:message code="survey.q46.t7" default="other" /></label></td>
						<td><g:textField name="q46_7"
										 value="${surveyInstance?.q46_7}"
										 onkeyup="checkIfNumberOnly(this.value, document.getElementById(\'${('q46_7status')}\')); "/> <span id="${('q46_7status')}"></span>
						</td>
					</tr>					
					</tbody>
					</table>   

					
                    <table class="box-table-b-wide">
                        <tbody>
	                    <tr>
	                    	<td style="width:50%;font-weight:bold;"><label><g:message code="survey.q47" default="q47" /></label></td>
	                    	<td>
	                    	<%
							def q47lbls=[message(code:'survey.q47.f1'),
								message(code:'survey.q47.f2'),
								message(code:'survey.q47.f3'),
								message(code:'survey.q47.f4')]
							 %>
	                        	<g:radioGroup name="q47"
	                            	value="${surveyInstance?.q47}" 
	                                labels="${q47lbls }" 
	                                values="['every6mon', 'everyyear', 'lessthan6mon', 'never']" >
									<g:render template="/common/checkmark_radio_v" model="[it:it]"/>
								</g:radioGroup>                  	
	                    	</td>
	                    </tr> 
	                    <tr>
	                    	<td style="font-weight:bold;"><label><g:message code="survey.q48" default="q48" /></label></td>
	                    	<td>
								<g:datePicker name="q48dateLastVisitGynecologist" precision="month" value="${surveyInstance?.q48dateLastVisitGynecologist}"
                                      years="${thisyear..birth[java.util.Calendar.YEAR]}" default="none" noSelection="${['':'--']}" /> <span id="alertIfInvalid48"></span>               	
	                    	</td>
	                    </tr>
	                    <tr>
	                    	<td style="font-weight:bold;"><label><g:message code="survey.q49" default="q49" /></label></td>
	                    	<td>
	                        	<g:radioGroup name="q49"
	                            	value="${surveyInstance?.q49}" 
	                                labels="${yesno }"
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>
								<br/>
								<div style="clear:left">
									<g:message code="survey.findings" default="findings" />: <g:textField name="q49_findings_pelvic_exam" 
																										  value="${surveyInstance?.q49_findings_pelvic_exam}"
																										  onkeyup="checkIfNumberOnly(this.value, document.getElementById(\'${('q49_findings_status')}\')); "/> <span id="${('q49_findings_status')}"></span>
								</div>
	                    	</td>
	                    </tr>
	                    <tr>
	                    	<td style="font-weight:bold;"><label><g:message code="survey.q50" default="q50" /></label></td>
	                    	<td>
	                        	<g:radioGroup name="q50"
	                            	value="${surveyInstance?.q50}" 
	                                labels="${yesno }"
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>
								<br/>
								<div style="clear:left">
									<g:message code="survey.findings" default="findings" />: <g:textField name="q50_findings_digital_rectal_exam"
																										  value="${surveyInstance?.q50_findings_digital_rectal_exam}"
																										  onkeyup="checkIfNumberOnly(this.value, document.getElementById(\'${('q50_findings_status')}\')); "/> <span id="${('q50_findings_status')}"></span>
								</div>
	                    	</td>
	                    </tr>	                    	                                                                                                         
                        </tbody>
                    </table>
                    <br/><ul>
                    <div>
                    	<label><g:message code="survey.q51" default="q51" /></label>
                    </div>
                    <br/>
                    <ul>
	                    <div>
			                <g:radioGroup name="q51"
			                            	value="${surveyInstance?.q51}" 
			                                labels="${yesno }"
			                                values="['yes','no']" >
											<g:render template="/common/checkmark_radio" model="[it:it]"/>
							</g:radioGroup>                   
	                    </div>
	                    <br/> <br/>
	                    <div style="clear:left;">
		                    <label>&nbsp;&nbsp;<g:message code="survey.q51.table" default="q51.table" /></label>
		                </div>
                    </ul>
                    
                    </ul>
                    <%
					def DiagnosticTestList=[message(code:'survey.q51.t1'),
											message(code:'survey.q51.t2'),
											message(code:'survey.q51.t3'),
											message(code:'survey.q51.t4'),
											message(code:'survey.q51.t5'),
											message(code:'survey.q51.t6')]
					 %>
					<table class="box-table-b-wide">
					<thead>
					<tr>
						<th><g:message code="survey.diagnosticTest" default="Diagnostic Test" /></th>
						<th><g:message code="survey.yesno" default="Yes / No" /></th>
						<th><g:message code="survey.monthYear" default="Month / Year" /></th>
						<th><g:message code="survey.results" default="Result" /> (<label style="color:red">#</label>: <g:message code="survey.numberonly" />)</th>
					</tr>
					</thead>
					<tbody>
					<g:each in="${DiagnosticTestList }" status="i" var="diagnostic">
					<% def idx=i+1 %>
                    <tr>
                    	<td style="width:20%;font-weight:bold;"><label>${idx}. ${diagnostic }</label></td>
                    	<td>
                        	<g:radioGroup name="${('q51_'+idx)}"
                            	value="${surveyInstance?.('q51_'+idx)}"  
                                labels="${yesno }"
                                values="['yes','no']" >
								<g:render template="/common/checkmark_radio_v" model="[it:it]"/>
							</g:radioGroup>
						</td>
                        <td>    
                             <g:datePicker name="${('q51date'+idx)}" precision="month" value="${surveyInstance?.('q51date'+idx)}"  
                                      years="${thisyear..birth[java.util.Calendar.YEAR]}" default="none" noSelection="${['':'--']}" /> <span id="${('q51_'+idx+'_status')}"></span> 
						</td>
						<td>
						<g:if test="${idx==1}">
						 <label style="color:red">#</label><g:textField name="${('q51_'+idx+'_result')}"
						 			  value="${surveyInstance?.('q51_'+idx+'_result')}"
						 			  onkeyup="checkIfValidNumber(this.value, 0, 1000, document.getElementById(\'${('q51_result'+idx)}\')); "/>
						 
						 </g:if>
						 <g:elseif  test="${idx==4 || idx==5 || idx==6}">
						 <g:textField name="${('q51_'+idx+'_result')}"
						 			  value="${surveyInstance?.('q51_'+idx+'_result')}" />

						 </g:elseif>						 
						 <g:else>
						 <label style="color:red">#</label><g:textField name="${('q51_'+idx+'_result')}"
						 			  value="${surveyInstance?.('q51_'+idx+'_result')}"
						 			  onkeyup="checkIfNumber(this.value, document.getElementById(\'${('q51_result'+idx)}\')); "/>
						 
						 </g:else>
						 
						 <g:if test="${idx==1}">
						 U/mL
						 </g:if>
						 <g:elseif test="${idx==2}">
						 ng/mL
						 </g:elseif>
						 <g:elseif test="${idx==3}">
						 mIU/mL
						 </g:elseif>
						  <span id="${('q51_result'+idx)}"></span>
						 

                    	</td>
                    </tr>
                    </g:each>					
					</tbody>
					</table>


                    <table class="box-table-b-wide">
                    <tbody>
                    <tr>
                    	<td style="width:30%;font-weight:bold;"><label><g:message code="survey.q52" default="q52" /></label></td>
                    	<td>
                        	<g:radioGroup name="q52"
                            	value="${surveyInstance?.q52}" 
                                labels="${yesno }" 
                                values="['yes','no']" >
								<g:render template="/common/checkmark_radio" model="[it:it]"/>
							</g:radioGroup>
							<br/>
							<div style="clear:left">
								<g:message code="survey.mostRecently" default="Most recently" />: <g:datePicker name="q52dateMostRecentPapSmear" precision="month" value="${surveyInstance?.q52dateMostRecentPapSmear}"  
                                      years="${thisyear..birth[java.util.Calendar.YEAR]}" default="none" noSelection="${['':'--']}" /> <span id="alertIfInvalid52"></span>  
								<br/>
                            	<g:message code="survey.results" default="results" />: <g:textField name="q52_results_pap_smear"
                            																		value="${surveyInstance?.q52_results_pap_smear}"
                            																		onkeyup="checkIfNumberOnly(this.value, document.getElementById(\'${('q52_status')}\')); "/> <span id="${('q52_status')}"></span>
                            </div>
                    	</td>
                    </tr>
                    <tr>
                    	<td style="width:30%;font-weight:bold;"><label><g:message code="survey.q53" default="q53" /></label></td>
                    	<td>
                        	<g:radioGroup name="q53"
                            	value="${surveyInstance?.q53}" 
                                labels="${yesno }"
                                values="['yes','no']" >
								<g:render template="/common/checkmark_radio" model="[it:it]"/>
							</g:radioGroup>
							<br/>
							<div style="clear:left">
							<label><g:message code="survey.q53.which" default="q53_which" /></label>: 
							<g:textField name="q53_medication_fertility"
										 value="${surveyInstance?.q53_medication_fertility}"
										 onkeyup="checkIfNumberOnly(this.value, document.getElementById(\'${('q53_which_status')}\')); "/> <span id="${('q53_which_status')}"></span>
										 &nbsp;&nbsp;&nbsp;
							<br/>
                            <label><g:message code="survey.q53.howlong" default="q53_howlong" /></label>: 
                            <g:textField name="q53_how_long_use_fertility_medication"
                            			 value="${surveyInstance?.q53_how_long_use_fertility_medication}"
                            			 onkeyup="checkIfValidNumber(this.value, 1, 360, document.getElementById(\'q53_length_status\')); "/>
                            <span id="q53_length_status"></span>
                            </div>
                    	</td>
                    </tr>                    
                    </tbody>
                    </table>
					                    
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'button.save-finish-later.label', default: 'update')}"  onclick="DisableEnableForm(document.surveyform9,false);" /></span>
                    <span class="button"><g:actionSubmit class="back" action="step8" value="${message(code: 'button.go-back.label', default: 'back')}"   onclick="DisableEnableForm(document.surveyform9,false);" /></span>
                    <%--<span class="button"><g:render template="/common/back_button"/></span>
                    <span class="button"><input type="reset" value="${message(code: 'button.reset-all.label', default: 'reset')}"></span> --%>
                    <g:if test="${surveyInstance?.sex=='female' }">  
                    	<span class="button"><g:actionSubmit class="next" action="update_unified" value="${message(code: 'button.save-then-go-to-next.label', default: 'next')}"  onclick="DisableEnableForm(document.surveyform9,false);" /></span>
                    </g:if>
                    <g:else>
                    	<g:link action="step10" id="${surveyInstance?.id}"><label style="color:green"><g:message code='button.save-then-go-to-next.label'/></label></g:link>
                    </g:else>
                    <span class="menuButton"><g:render template="/common/step_meter"/></span>
                 </div>
            </g:form>
        </div>
    </body>
</html>
