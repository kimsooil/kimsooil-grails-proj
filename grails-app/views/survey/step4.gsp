<%@ page import="u56survey.Survey" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'survey.label', default: 'Survey')}" />
        <title><g:message code="step4.label" default="Step4" /></title>

		<%-- <jv:generateValidation domain="survey" form="surveyform4"  display="list" container="errors"/> --%>  

		<g:render template="errMsgsToJson-js"/>

		<g:javascript src="check_step4.js" />       
				
    </head>
    <body>
<%
	def birth=surveyInstance?.DOB ? surveyInstance?.DOB : new Date()
	//out << "dob="+birth[java.util.Calendar.YEAR]+"<br/>"
	def today=new Date() 		
	//out << "today="+today[java.util.Calendar.YEAR]+"<br/>"
%>		    
    
<g:javascript>

<g:if test="${surveyInstance?.mode!='paper'}">
function Is_q21DateStopSmoking_Valid(){
	var validDate = CalAge_precise($("#q21DateStopSmoking_day").val(), $("#q21DateStopSmoking_month").val(), $("#q21DateStopSmoking_year").val());
	if (validDate <0 || validDate > ageCalculated){
		return false;
	}
	else {
		return true;
	}
}
$(document).ready(function(){ 
	$("#q21DateStopSmoking_day").change(function() {
			if (!Is_q21DateStopSmoking_Valid())
			{
				$('#alertIfInvalid').attr('innerHTML', " <label style='color:#ff0000'>(!)</label>");
				$("#q21DateStopSmoking_day").focus();
			}
			else {
				$('#alertIfInvalid').attr('innerHTML', "");
				//$('#alertIfInvalid').attr('innerHTML', CalAge($("#q21DateStopSmoking_day").val(), $("#q21DateStopSmoking_month").val(), $("#q21DateStopSmoking_year").val()));
				
			}	
		}
	);
	$("#q21DateStopSmoking_month").change(function() {
			if (!Is_q21DateStopSmoking_Valid())
			{
				$('#alertIfInvalid').attr('innerHTML', " <label style='color:#ff0000'>(!)</label>");
				$("#q21DateStopSmoking_month").focus();
			}
			else {
				$('#alertIfInvalid').attr('innerHTML', "");
				//$('#alertIfInvalid').attr('innerHTML', CalAge($("#q21DateStopSmoking_day").val(), $("#q21DateStopSmoking_month").val(), $("#q21DateStopSmoking_year").val()));
			}	
		}
	);
	$("#q21DateStopSmoking_year").change(function() {
			if (!Is_q21DateStopSmoking_Valid())
			{
				$('#alertIfInvalid').attr('innerHTML', " <label style='color:#ff0000'>(!)</label>");
				$("#q21DateStopSmoking_year").focus();
			}
			else {
				$('#alertIfInvalid').attr('innerHTML', "");
				//$('#alertIfInvalid').attr('innerHTML', CalAge($("#q21DateStopSmoking_day").val(), $("#q21DateStopSmoking_month").val(), $("#q21DateStopSmoking_year").val()));
			}	
		}
	);	

	$("input[name='q14_1']").change(function(){
	    if ($("input[name='q14_1']:checked").val() != 'never'){
	    	$("#q14_1_howManyPerWeek").attr("disabled", '');	    			    
	    }
	    else if ($("input[name='q14_1']:checked").val() == 'never'){
	    	$("#q14_1_howManyPerWeek").val('');
	    	$("#q14_1_howManyPerWeek").attr("disabled", true);	  
	    }
	});
	$("input[name='q14_2']").change(function(){
	    if ($("input[name='q14_2']:checked").val() != 'never'){
	    	$("#q14_2_howManyPerWeek").attr("disabled", '');	    			    
	    }
	    else if ($("input[name='q14_2']:checked").val() == 'never'){
	    	$("#q14_2_howManyPerWeek").val('');
	    	$("#q14_2_howManyPerWeek").attr("disabled", true);	  
	    }
	});
	$("input[name='q14_3']").change(function(){
	    if ($("input[name='q14_3']:checked").val() != 'never'){
	    	$("#q14_3_howManyPerWeek").attr("disabled", '');	    			    
	    }
	    else if ($("input[name='q14_3']:checked").val() == 'never'){
	    	$("#q14_3_howManyPerWeek").val('');
	    	$("#q14_3_howManyPerWeek").attr("disabled", true);	  
	    }
	});
	$("input[name='q15_1']").change(function(){
	    if ($("input[name='q15_1']:checked").val() != 'no'){
	    	$("[name*='q15_1_']").attr("disabled", '');	    			    
	    }
	    else if ($("input[name='q15_1']:checked").val() == 'no'){
	    	$("[name*='q15_1_']").val('');
	    	$("[name*='q15_1_']").attr("disabled", true);	    		  
	    }
	});
	$("input[name='q15_2']").change(function(){
	    if ($("input[name='q15_2']:checked").val() != 'no'){
	    	$("[name*='q15_2_']").attr("disabled", '');	    			    
	    }
	    else if ($("input[name='q15_2']:checked").val() == 'no'){
	    	$("[name*='q15_2_']").val('');
	    	$("[name*='q15_2_']").attr("disabled", true);	    		  
	    }
	});
	$("input[name='q15_3']").change(function(){
	    if ($("input[name='q15_3']:checked").val() != 'no'){
	    	$("[name*='q15_3_']").attr("disabled", '');	    			    
	    }
	    else if ($("input[name='q15_3']:checked").val() == 'no'){
	    	$("[name*='q15_3_']").val('');
	    	$("[name*='q15_3_']").attr("disabled", true);	    		  
	    }
	});				
	$("input[name='q15_4']").change(function(){
	    if ($("input[name='q15_4']:checked").val() != 'no'){
	    	$("[name*='q15_4_']").attr("disabled", '');	    			    
	    }
	    else if ($("input[name='q15_4']:checked").val() == 'no'){
	    	$("[name*='q15_4_']").val('');
	    	$("[name*='q15_4_']").attr("disabled", true);	    		  
	    }
	});				
					
	$("input[name='q16']").change(function(){
	    if ($("input[name='q16']:checked").val() == 'yes'){
	    $("#smoke100_status").html(" <font color='red'>(<b>***</b>)</font>");
	    	$("[name='q17']").attr("disabled", '');
	    	$("[name='q18']").attr("disabled", '');	    	
	    	$("[name='q19']").attr("disabled", '');	    	
	    	$("[name='stillSmoke']").attr("disabled", '');

	    	$("[name*='q21_whenStopSmoking_']").attr("disabled", '');	    	

	    	$("[name*='q21_dateStopSmoking']").attr("disabled", '');	    		    	
	    }
	    else if ($("input[name='q16']:checked").val() == 'no'){
	    	$("#smoke100_status").html("");
	    
	    	$("[name='q17']").val('');
	    	$("[name='q17']").attr("disabled", true);
	    	$("[name='q18']").val('');
	    	$("[name='q18']").attr("disabled", true);	    	
	    	$("[name='q19']").val('');
	    	$("[name='q19']").attr("disabled", true);	    	
	    	$("[name='stillSmoke']").attr("checked", false);
	    	$("[name='stillSmoke']").attr("disabled", true);
	    	$("[name*='q21_whenStopSmoking_']").val('');
	    	$("[name*='q21_whenStopSmoking_']").attr("disabled", true);	    	
	    	$("[name*='q21DateStopSmoking']").val('');
	    	$("[name*='q21DateStopSmoking']").attr("disabled", true);
	    }
	});

	$("input[name='stillSmoke']").change(function(){
	    if ($("input[name='stillSmoke']:checked").val() == 'yes'){
	    	$("[name*='q21_whenStopSmoking_']").val('');
	    	$("[name*='q21_whenStopSmoking_']").attr("disabled", true);	    	
	    	$("[name*='q21DateStopSmoking']").val('');
	    	$("[name*='q21DateStopSmoking']").attr("disabled", true);	    
	    }
	    else if ($("input[name='stillSmoke']:checked").val() == 'no'){
	    	$("#stillSmoke_status").html(" <font color='red'>(<b>* Answer Q26.</b>)</font>");
	    	$("[name*='q21_whenStopSmoking_']").attr("disabled", '');	    	
	    	$("[name*='q21DateStopSmoking']").attr("disabled", '');	    		    		    
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
</g:if>
</g:javascript>

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
<g:if test="${surveyInstance?.mode!='paper'}">
if ($("input[name='q14_1']:checked").val() == 'never'){
	    	$("#q14_1_howManyPerWeek").val('');
	    	$("#q14_1_howManyPerWeek").attr("disabled", true);	  
	    }

if ($("input[name='q14_2']:checked").val() == 'never'){
	    	$("#q14_2_howManyPerWeek").val('');
	    	$("#q14_2_howManyPerWeek").attr("disabled", true);	  
	    }

if ($("input[name='q14_3']:checked").val() == 'never'){
	    	$("#q14_3_howManyPerWeek").val('');
	    	$("#q14_3_howManyPerWeek").attr("disabled", true);	  
	    }

if ($("input[name='q15_1']:checked").val() == 'no'){
	    	$("[name*='q15_1_']").val('');
	    	$("[name*='q15_1_']").attr("disabled", true);	    		  
	    }

if ($("input[name='q15_2']:checked").val() == 'no'){
	    	$("[name*='q15_2_']").val('');
	    	$("[name*='q15_2_']").attr("disabled", true);	    		  
	    }

if ($("input[name='q15_3']:checked").val() == 'no'){
	    	$("[name*='q15_3_']").val('');
	    	$("[name*='q15_3_']").attr("disabled", true);	    		  
	    }
			
if ($("input[name='q15_4']:checked").val() == 'no'){
	    	$("[name*='q15_4_']").val('');
	    	$("[name*='q15_4_']").attr("disabled", true);	    		  
	    }
			
if ($("input[name='q16']:checked").val() == 'no'){
	    	$("#smoke100_status").html("");
	    
	    	$("[name='q17']").val('');
	    	$("[name='q17']").attr("disabled", true);
	    	$("[name='q18']").val('');
	    	$("[name='q18']").attr("disabled", true);	    	
	    	$("[name='q19']").val('');
	    	$("[name='q19']").attr("disabled", true);	    	
	    	$("[name='stillSmoke']").attr("checked", false);
	    	$("[name='stillSmoke']").attr("disabled", true);
	    	$("[name*='q21_whenStopSmoking_']").val('');
	    	$("[name*='q21_whenStopSmoking_']").attr("disabled", true);	    	
	    	$("[name*='q21DateStopSmoking']").val('');
	    	$("[name*='q21DateStopSmoking']").attr("disabled", true);
	    }


	    if ($("input[name='stillSmoke']:checked").val() == 'yes'){
	    	$("[name*='q21_whenStopSmoking_']").val('');
	    	$("[name*='q21_whenStopSmoking_']").attr("disabled", true);	    	
	    	$("[name*='q21DateStopSmoking']").val('');
	    	$("[name*='q21DateStopSmoking']").attr("disabled", true);	    
	    }
	    else if ($("input[name='stillSmoke']:checked").val() == 'no'){
	    	$("#stillSmoke_status").html(" <font color='red'>(<b>* Answer Q26.</b>)</font>");
	    	$("[name*='q21_whenStopSmoking_']").attr("disabled", '');	    	
	    	$("[name*='q21DateStopSmoking']").attr("disabled", '');	    		    		    
	    }

</g:if>	    
});		    	    
</g:javascript>
        
            <h1><g:message code="step4.label" default="Step4" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
<div id="errors" class="errors" style="display:none;">
</div>
            <g:form name="surveyform4"
            		onsubmit="if (document.getElementById('mode').value!='paper'){ return (checkForm4());} else {return confirmIfSure();}"
            		method="post" >
                <g:hiddenField name="id" value="${surveyInstance?.id}" />
                <g:hiddenField name="version" value="${surveyInstance?.version}" />
                <g:hiddenField name="mode" value="${surveyInstance?.mode}" />

                <g:render template="/common/status_info" model="['dob':surveyInstance?.DOB]"/>
                <div class="dialog">
                	<br/>
                	<ul><label><g:message code="survey.q14" default="q14" /></label></ul>
                	
                	<%
						//def AlcoholList = ["beer or malt liquor", "wine or wine coolers", "liquor"]
					def AlcoholList = [message(code:"survey.q14.beer_maltliquor"),
										message(code:"survey.q14.wine"),
										message(code:"survey.q14.hardliguor")]
					 %>
                	<table class="box-table-b-wide">
                	<tbody>
                	<g:each in="${AlcoholList}" status="i" var="alcohol">
					<%
						def idx = i +1
					%>
                	<tr class="prop">
                		<td style="width:15%;">
                			<g:message code="survey.q14.question.header" default="q14_Do you drink" /> 
                			<label><strong>${alcohol }</strong>?</label>
                		</td>
                		<td style="width:35%;">
							<g:radioGroup name="${('q14_'+idx)}" 
							value="${surveyInstance?.('q14_'+idx)}"
							labels="[g.message(code:'survey.q14_opt1'),g.message(code:'survey.q14_opt2'), g.message(code:'survey.q14_opt3')]" 
							values="['never','quit', 'drink']" >
							<g:render template="/common/checkmark_radio_v" model="[it:it]"/>
							</g:radioGroup>
                		</td>
                		<td style="vertical-align: bottom; ">
							<g:message code="survey.q14_howManyPerWeek.label" default="q14_howManyPerWeek" /><br/>
							<g:textField name="${('q14_'+idx+'_howManyPerWeek')}" 
										 value="${surveyInstance?.('q14_'+idx+'_howManyPerWeek')}"
										 onkeyup="checkIfValidNumber(this.value, 1, 100, document.getElementById(\'${('alcohol_status'+idx)}\')); " /> <span id="${('alcohol_status'+idx)}"></span>
                		</td>
                	</tr>
                	</g:each>
                	</tbody>
                	</table>
                	<br/><br/>
                    <ul><label><g:message code="survey.q15" default="q15" /></label></ul>
                    <br/>
                    <%
					//def TobaccoList = ["Chewing Tobacco", "Snuff or Dip", "Pipe", "Cigars"]
					def TobaccoList = [message(code:"survey.q15a.label"),
									   message(code:"survey.q15b.label"),
									   message(code:"survey.q15c.label"),
									   message(code:"survey.q15d.label")]
					 %>
					<table class="box-table-b-wide">
					<tbody>
					<g:each in="${TobaccoList }" status="i" var="tobacco">
					<% def idx=i+1 %>
					<tr class="prop">
						<td style="width:15%;">
						<label><strong>${tobacco }</strong></label>
						</td>
						<td style="width:30%;">
                                    <g:radioGroup name="${('q15_'+idx)}"
                                    value="${surveyInstance?.('q15_'+idx)}" 
                                    labels="[g.message(code:'survey.q15_opt1'),g.message(code:'survey.q15_opt2'), g.message(code:'survey.q15_opt3')]"
                                    values="['currently','quit', 'no']" >
										<g:render template="/common/checkmark_radio_v" model="[it:it]"/>
									</g:radioGroup>
						</td>
						<td>
									<g:message code="survey.q15_howManyTimesPerWeek.label" default="q15_howManyTimesPerWeek" /> 
									<g:textField name="${('q15_'+idx+'_howManyTimesPerWeek')}" 
												 value="${surveyInstance?.('q15_'+idx+'_howManyTimesPerWeek')}"
												 onkeyup="checkIfValidNumber(this.value, 1, 200, document.getElementById(\'${('tobaccoWeek_status'+idx)}\')); " /> <span id="${('tobaccoWeek_status'+idx)}"></span>
									<br/>
									<g:message code="survey.q15_howManyYears.label" default="q15_howManyYears" />
									<g:textField name="${('q15_'+idx+'_howManyYears')}"
												 value="${surveyInstance?.('q15_'+idx+'_howManyYears')}"
												 onkeyup="checkIfValidNumber(this.value, 1, ageCalculated, document.getElementById(\'${('tobaccoYear_status'+idx)}\')); " /> <span id="${('tobaccoYear_status'+idx)}"></span>
						
						</td>
					</tr>
					</g:each>
					</tbody>
					</table>
                    
                    <%
						def yesno=[message(code:'survey.yes'), message(code:'survey.no')]
					%>
                    <table class="box-table-b-wide">
                    	<tbody>
                            <tr class="prop">
                                <td style="width: 65%;font-weight:bold;">
                                    <label for="q16"><g:message code="survey.q16" default="q16.smoked100cigarettes" /></label> <span id="smoke100_status"></span>
                                </td>
                                <td>
                                    <g:radioGroup name="q16"
                                     value="${surveyInstance?.q16 }"
                                     labels="${yesno }" 
                                     values="['yes','no']" >
										<g:render template="/common/checkmark_radio" model="[it:it]"/>
									</g:radioGroup>
                                    
                                </td>
                            </tr>
                            <tr class="prop">
                                <td style="width: 65%;font-weight:bold;">
                                    <label for="q17"><g:message code="survey.q17.label" default="q17" /></label>
                                </td>
                                <td>
                                    <g:textField name="q17" 
                                    style="width: 50px"
                                    value="${surveyInstance?.q17}" 
                                    onkeyup="checkIfValidNumber(this.value, 0, ageCalculated, document.getElementById(\'${('q17_status')}\')); " /> <g:message code="survey.years" default="Years" /> <span id="q17_status"></span>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td style="width: 65%;font-weight:bold;">
                                    <label for="q18"><g:message code="survey.q18.label" default="q18" /></label>
                                </td>
                                <td>
                                    <g:message code="survey.smokedFor" default="Smoked for" /> 
                                    <g:textField name="q18" 
                                    style="width: 50px"
                                    value="${surveyInstance?.q18}" 
									onkeyup="checkIfValidNumber(this.value, 0, ageCalculated, document.getElementById(\'${('q18_status')}\')); " /> <g:message code="survey.years.label" default="Years" /> <span id="q18_status"></span>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td style="width: 65%;font-weight:bold;">
                                    <label for="q19"><g:message code="survey.q19.label" default="q19" /></label>
                                </td>
                                <td>
                                    <g:textField name="q19"
                                    			 style="width: 50px"
                                    			 value="${surveyInstance?.q19}"
                                    			 onkeyup="checkIfValidNumber(this.value, 0, 200, document.getElementById(\'${('q19_status')}\')); " /> <g:message code="survey.q19.cigarettesPerDay" default="cigarettes Per Day" /> <span id="q19_status"></span>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td style="width: 65%;font-weight:bold;">
                                    <label for="q20"><g:message code="survey.q20.label" default="q20" /></label>
                                </td>
                                <td>
                                    <%--<g:checkBox name="q20" value="${surveyInstance?.q20}" />--%>
                                    <g:radioGroup name="stillSmoke"
                                     value="${surveyInstance?.stillSmoke }"
                                     labels="${yesno }"  
                                     values="['yes','no']" >
										<g:render template="/common/checkmark_radio" model="[it:it]"/>
									</g:radioGroup> <span id="stillSmoke_status"></span>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td style="width: 65%;font-weight:bold;">
                                    <label for="q21_dateStopSmoking"><g:message code="survey.q21_dateStopSmoking.label" default="q21_dateStopSmoking" /></label>
                                </td>
                                <td>
                                    <g:textField name="q21_whenStopSmoking_years" 
                                    			 style="width: 50px"
                                    			 value="${surveyInstance?.q21_whenStopSmoking_years}"
                                    			 onkeyup="checkIfValidNumber(this.value, 0, ageCalculated, document.getElementById(\'${('q21_status1')}\')); " /> <g:message code="survey.years.label" default="years" /> <span id="q21_status1"></span>
                                    <br/>
                                    <g:textField name="q21_whenStopSmoking_months"
                                    			 style="width: 50px"
                                    			 value="${surveyInstance?.q21_whenStopSmoking_months}"
												 onkeyup="checkIfValidNumber(this.value, 0, 11, document.getElementById(\'${('q21_status2')}\')); " /> <g:message code="survey.months.label" default="months" /> <span id="q21_status2"></span>
									<br/><g:message code="survey.and_or.label" default="and/or" />
                                    <br/>

                                    <g:kimsiDatePicker name="q21DateStopSmoking" precision="day" value="${surveyInstance?.q21DateStopSmoking}"
                                      years="${thisyear..birth[java.util.Calendar.YEAR]}" default="none" noSelection="${['':'--']}" />  <span id="alertIfInvalid"></span><br/>

                                    
                                </td>
                            </tr>                                                        
                    	</tbody>
                    </table>                                            
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'button.save-finish-later.label', default: 'update')}"   onclick="DisableEnableForm(document.surveyform4,false);" /></span>
                    <span class="button"><g:actionSubmit class="back" action="step3" value="${message(code: 'button.go-back.label', default: 'back')}"   onclick="DisableEnableForm(document.surveyform4,false);" /></span>
                    <%--<span class="button"><g:render template="/common/back_button"/></span>
                    <span class="button"><input type="reset" value="${message(code: 'button.reset-all.label', default: 'reset')}"></span> --%>  
					<span class="button"><g:actionSubmit class="next" action="update_unified" value="${message(code: 'button.save-then-go-to-next.label', default: 'next')}"   onclick="DisableEnableForm(document.surveyform4,false);" /></span>
                    <span class="menuButton"><g:render template="/common/step_meter"/></span>
                 </div>
            </g:form>
        </div>
    </body>
</html>
