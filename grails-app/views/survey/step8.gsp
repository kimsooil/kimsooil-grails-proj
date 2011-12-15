<%@ page import="u56survey.Survey" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'survey.label', default: 'Survey')}" />
        <title><g:message code="step8.label" default="Step8" /></title>
        
        <%--<jv:generateValidation domain="survey" form="surveyform8"  display="list" container="errors"/> --%>

		<g:render template="errMsgsToJson-js"/>

		<g:javascript src="check_step8.js" />       
		
    </head>
    <body>
<%
	def birth=surveyInstance?.DOB ? surveyInstance?.DOB : new Date()
	//out << "dob="+birth[java.util.Calendar.YEAR]+"<br/>"
	def today=new Date() 		
	//out << "today="+today[java.util.Calendar.YEAR]+"<br/>"
%>	    
<g:javascript>
function IsDateDigitalRectalExamValid()
{
	if ( ($("#dateDigitalRectalExam_year").val() == "<%=today[java.util.Calendar.YEAR]%>")  &&
		(parseInt($("#dateDigitalRectalExam_month").val()) > <%=today[java.util.Calendar.MONTH]+1%>)
	){
		return false;
	}
	else if ( ($("#dateDigitalRectalExam_year").val() == "<%=birth[java.util.Calendar.YEAR]%>")  &&
		(parseInt($("#dateDigitalRectalExam_month").val()) < <%=birth[java.util.Calendar.MONTH]+1%>)
	){
		return false;
	}	
	else {
		return true;
	}
}
function IsDateSigmoidoscopyColonoscopy()
{
	if ( ($("#dateSigmoidoscopyColonoscopy_year").val() == "<%=today[java.util.Calendar.YEAR]%>")  &&
		(parseInt($("#dateSigmoidoscopyColonoscopy_month").val()) > <%=today[java.util.Calendar.MONTH]+1%>)
	){
		return false;
	}
	else if ( ($("#dateSigmoidoscopyColonoscopy_year").val() == "<%=birth[java.util.Calendar.YEAR]%>")  &&
		(parseInt($("#dateSigmoidoscopyColonoscopy_month").val()) < <%=birth[java.util.Calendar.MONTH]+1%>)
	){
		return false;
	}

	else {
		return true;
	}
}
$(document).ready(function(){
	$("input[name='q37']").change(function(){
	    if ($("input[name='q37']:checked").val() != 'no'){
	    	$("[name*='q37_what']").attr("disabled", '');		    
	    	$("[name*='q38']").attr("disabled", '');	    			    
	    }
	    else if ($("input[name='q37']:checked").val() == 'no'){
	    	$("[name*='q37_what']").attr("checked", false);
	    	$("[name*='q37_what']").attr("disabled", true);		    
	    	$("[name*='q38']").attr('checked', false);
	    	$("[name*='q38']").attr("disabled", true);	    
	    }
	});


	$("input[name='q40']").change(function(){
	    if ($("input[name='q40']:checked").val() == 'yes'){
	    	$("[name*='resultsFecalOccultBloodTest']").attr("disabled", '');	    			    
	    }
	    else if ($("input[name='q40']:checked").val() == 'no'){

	    	$("[name*='resultsFecalOccultBloodTest']").attr("checked", false);
	    	$("[name*='resultsFecalOccultBloodTest']").attr("disabled", true);	    
	    }
	});	
	$("input[name='q41']").change(function(){
	    if ($("input[name='q41']:checked").val() == 'yes' || $("input[name='q41']:checked").val() == 'five'){
	    	$("[name*='dateDigitalRectalExam']").attr("disabled", '');	    			    
	    }
	    else if ($("input[name='q41']:checked").val() == 'no'){
	    	$("[name*='dateDigitalRectalExam']").val('');
	    	$("[name*='dateDigitalRectalExam']").attr("disabled", true);	    
	    }
	});
	$("#dateDigitalRectalExam_month").change(function() {
			if (!IsDateDigitalRectalExamValid())
			{
				$('#alertIfInvalid3').attr('innerHTML', " <label style='color:#ff0000'>(!)</label>");
				$("dateDigitalRectalExam_month").focus();
			}
			else {
				$('#alertIfInvalid3').attr('innerHTML', "");
			}	
		}
	);
	$("#date_digital_rectal_exam_year").change(function() {
			if (!IsDateDigitalRectalExamValid())
			{
				$('#alertIfInvalid3').attr('innerHTML', " <label style='color:#ff0000'>(!)</label>");
				$("#dateDigitalRectalExam_year").focus();
			}
			else {
				$('#alertIfInvalid3').attr('innerHTML', "");
			}	
		}
	);
	
	$("input[name='q42']").change(function(){
	    if ($("input[name='q42']:checked").val() == 'yes'){
	    	$("[name*='dateSigmoidoscopyColonoscopy']").attr("disabled", '');
	    	$("[name*='q42_']").attr("disabled", '');
	    	$("[name*='q43']").attr("disabled", '');	    			    
	    }
	    else if ($("input[name='q42']:checked").val() == 'no'){
	    	$("[name*='dateSigmoidoscopyColonoscopy']").val('');
	    	$("[name*='dateSigmoidoscopyColonoscopy']").attr("disabled", true);	  
	    	
	    	$("[name*='q42_']").attr("checked", false);
	    	$("[name*='q42_']").attr("disabled", true);
			
	    	$("[name*='q43']").attr("checked", false);
	    	$("[name*='q43']").attr("disabled", true);
	    }
	});
	$("#date_sigmoidoscopy_colonoscopy_month").change(function() {
			if (!IsDateSigmoidoscopyColonoscopy())
			{
				$('#alertIfInvalid4').attr('innerHTML', " <label style='color:#ff0000'>(!)</label>");
				$("dateSigmoidoscopyColonoscopy_month").focus();
			}
			else {
				$('#alertIfInvalid4').attr('innerHTML', "");
			}	
		}
	);
	$("#date_sigmoidoscopy_colonoscopy_year").change(function() {
			if (!IsDateSigmoidoscopyColonoscopy())
			{
				$('#alertIfInvalid4').attr('innerHTML', " <label style='color:#ff0000'>(!)</label>");
				$("#dateSigmoidoscopyColonoscopy_year").focus();
			}
			else {
				$('#alertIfInvalid4').attr('innerHTML', "");
			}	
		}
	);	
	$("input[name='q43']").change(function(){
	    if ($("input[name='q43']:checked").val() == 'yes'){
	    	$("#q43_biopsy_results").attr("disabled", '');
	    	$("#q43_biopsy_results").attr("disabled", '');	    			    
	    }
	    else if ($("input[name='q43']:checked").val() == 'no'){
	    	$("#q43_biopsy_results").val('');
	    	$("#q43_biopsy_results").attr("disabled", true);	  
	    }
	});
	$("input[name='q44']").change(function(){
	    if ($("input[name='q44']:checked").val() == 'yes'){
	    	$("#q44_hemoglobin_levels").attr("disabled", '');
	    	$("#q44_hemoglobin_levels").attr("disabled", '');	    			    
	    }
	    else if ($("input[name='q44']:checked").val() == 'no'){
	    	$("#q44_hemoglobin_levels").val('');
	    	$("#q44_hemoglobin_levels").attr("disabled", true);	  
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
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><img src="${resource(dir:'images/skin',file:'house.png')}" alt="house.png"  border="0" /></a></span>
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
	if ($("#mode").val()=='paper'){
			$('body').css('background-color', '#CCCCCC');
	}
if ($("input[name='q37']:checked").val() == 'no'){
	    	$("[name*='q37_what']").attr('checked', false);
	    	$("[name*='q37_what']").attr("disabled", true);		    
	    	$("[name*='q38']").attr('checked', false);
	    	$("[name*='q38']").attr("disabled", true);	    
	    }

if ($("input[name='q40']:checked").val() == 'yes'){

	    	$("[name*='resultsFecalOccultBloodTest']").attr("disabled", '');	
                }
else if ($("input[name='q40']:checked").val() == 'no'){

	    	$("[name*='resultsFecalOccultBloodTest']").attr("checked", false);
	    	$("[name*='resultsFecalOccultBloodTest']").attr("disabled", true);	    
	    }
if ($("input[name='q41']:checked").val() == 'no'){
	    	$("[name*='dateDigitalRectalExam']").val('');
	    	$("[name*='dateDigitalRectalExam']").attr("disabled", true);	    
	    }

if ($("input[name='q42']:checked").val() == 'no'){
	    	$("[name*='dateSigmoidoscopyColonoscopy']").val('');
	    	$("[name*='dateSigmoidoscopyColonoscopy']").attr("disabled", true);	  
	    	
	    	$("[name*='q42_']").attr("checked", false);
	    	$("[name*='q42_']").attr("disabled", true);
			
	    	$("[name*='q43']").attr("checked", false);
	    	$("[name*='q43']").attr("disabled", true);
	    }

if ($("input[name='q43']:checked").val() == 'no'){
	    	$("#q43_biopsy_results").val('');
	    	$("#q43_biopsy_results").attr("disabled", true);	  
	    }


	    if ($("input[name='q44']:checked").val() == 'yes'){
	    	$("#q44_hemoglobin_levels").attr("disabled", '');
	    	$("#q44_hemoglobin_levels").attr("disabled", '');	    			    
	    }
	    else if ($("input[name='q44']:checked").val() == 'no'){
	    	$("#q44_hemoglobin_levels").val('');
	    	$("#q44_hemoglobin_levels").attr("disabled", true);	  
	    }
		
});	
</g:javascript>        
            <h1><g:message code="step8.label" default="Step8" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
<div id="errors" class="errors" style="display:none;">
</div>
            <g:form name="surveyform8"
            		onsubmit="if (document.getElementById('mode').value!='paper'){ return (checkForm8());} else {return confirmIfSure();}"
            		method="post" >
                <g:hiddenField name="id" value="${surveyInstance?.id}" />
                <g:hiddenField name="version" value="${surveyInstance?.version}" />
                <g:if test="${session.user.location!='MOFF' }">
                	<g:hiddenField name="mode" value="${surveyInstance?.mode}" />
                </g:if>
                <g:render template="/common/status_info" model="['dob':surveyInstance?.DOB]"/>
                <div class="dialog">
                    <%
						def yesno=[message(code:'survey.yes'), message(code:'survey.no')]
					%>                     
                   <br/><ul>
                   <div>
                   <label><g:message code="survey.q35" default="q35" /></label>
                   <br/><br/>
                   			<div>
                        	<g:radioGroup name="q35"
                            	value="${surveyInstance?.q35}" 
                                labels="${yesno }" 
                                values="['yes','no']" >
								<g:render template="/common/checkmark_radio" model="[it:it]"/>
							</g:radioGroup>
							</div>
					</div>
                  	</ul>
                  	<br/><br/>
					<ul><label><g:message code="survey.q36" default="q36" /></label></ul>
					<%
					def ColonCancerSymptomList=[message(code:'survey.q36.s1'),
												message(code:'survey.q36.s2'),
												message(code:'survey.q36.s3'),
												message(code:'survey.q36.s4'),
												message(code:'survey.q36.s5'),
												message(code:'survey.q36.s6')]
					 %>
					
						<table class="box-table-b-wide">
						<thead>
						<tr>
							<th><g:message code="survey.symptoms" default="Symptoms" /></th>
							<th><g:message code="survey.yesno" default="Yes / No" /></th>
						</tr>
						</thead>
						<tbody>
						<g:each in="${ColonCancerSymptomList }" status="i" var="symptom">
						<% def idx=i+1 %>
						<tr>
							<td style="width:60%;font-weight:bold">${symptom }
							</td>
							<td>
	                        	<g:radioGroup name="${('q36_'+idx)}"
	                            	value="${surveyInstance?.('q36_'+idx)}" 
	                                labels="${yesno }" 
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>						
							</td>
						</tr>
						</g:each>
						</tbody>
						</table>
					
					

                    <table class="box-table-b-wide">
                    <tbody>
                    <tr>
                    	<td style="width:60%;font-weight:bold"><label><g:message code="survey.q37" default="q37" /></label></td>
                    	<td>
                        	<g:radioGroup name="q37"
                            	value="${surveyInstance?.q37}" 
                                labels="${yesno }" 
                                values="['yes','no']" >
								<g:render template="/common/checkmark_radio" model="[it:it]"/>
							</g:radioGroup>
							<br/><br/>                     	
                    	<%
						def bleedingList=[message(code:'survey.q37.donotknow'),
										 message(code:'survey.q37.b1'),
										 message(code:'survey.q37.b2')]
						 %>
                        	<g:radioGroup name="q37_what"
                            	value="${surveyInstance?.q37_what}" 
                                labels="${bleedingList }" 
                                values="['donotknow', 'red','black']" >
								<g:render template="/common/checkmark_radio_v" model="[it:it]"/>
							</g:radioGroup>                    	
                    	</td>
                    </tr>
                    <tr>
                    	<td style="font-weight:bold"><label><g:message code="survey.q38" default="q38" /></label></td>
                    	<td>
                        	<g:radioGroup name="q38"
                            	value="${surveyInstance?.q38}" 
                                labels="${yesno }" 
                                values="['yes','no']" >
								<g:render template="/common/checkmark_radio" model="[it:it]"/>
							</g:radioGroup>                    	
                    	</td>
                    </tr>
                    <tr>
                    	<td style="font-weight:bold"><label><g:message code="survey.q39" default="q39" /></label></td>
                    	<td>
                        	<g:radioGroup name="q39"
                            	value="${surveyInstance?.q39}" 
                                labels="${yesno }" 
                                values="['yes','no']" >
								<g:render template="/common/checkmark_radio" model="[it:it]"/>
							</g:radioGroup>                    	
                    	</td>
                    </tr>
                    <tr>
                    	<td style="font-weight:bold"><label><g:message code="survey.q40" default="q40" /></label></td>
                    	<td>
                    	<%
						def negpov=[message(code:'survey.negative'), message(code:'survey.positive')]
						 %>
						    <g:radioGroup name="q40"
                            	value="${surveyInstance?.q40}" 
                                labels="${yesno }" 
                                values="['yes','no']" >
								<g:render template="/common/checkmark_radio" model="[it:it]"/>
							</g:radioGroup><br/><br/>
						 <g:message code="survey.results" default="Results" />: <br/>

                        	<g:radioGroup name="resultsFecalOccultBloodTest"
                            	value="${surveyInstance?.resultsFecalOccultBloodTest}" 
                                labels="${negpov }" 
                                values="['negative', 'positive']" >
								<g:render template="/common/checkmark_radio_v" model="[it:it]"/>
							</g:radioGroup>
                 	
                    	</td>
                    </tr>
                    <tr>
                    	<td style="font-weight:bold"><label><g:message code="survey.q41" default="q41" /></label></td>
                    	<td>
                    	<%
						def yesnofive=[message(code:'survey.yes'), message(code:'survey.no'),message(code:'survey.fiveYearsAgo')]
						 %>
                        	<g:radioGroup name="q41"
                            	value="${surveyInstance?.q41}" 
                                labels="${yesnofive }" 
                                values="['yes','no', 'five']" >
								<g:render template="/common/checkmark_radio_v" model="[it:it]"/>
							</g:radioGroup>
							<br/>
							<div style="clear:left"><g:message code="survey.when" default="When" />: <g:datePicker name="dateDigitalRectalExam" precision="month" value="${surveyInstance?.dateDigitalRectalExam}"
                                      years="${thisyear..birth[java.util.Calendar.YEAR]}" default="none" noSelection="${['':'--']}" />  <span id="alertIfInvalid3"></span>
                                      </div>
                            
                    	</td>
                    </tr>
                    <tr>
                    	<td style="font-weight:bold"><label><g:message code="survey.q42" default="q42" /></label></td>
                    	<td>
                        	<g:radioGroup name="q42"
                            	value="${surveyInstance?.q42}" 
                                labels="${yesno }" 
                                values="['yes','no']" >
								<g:render template="/common/checkmark_radio_v" model="[it:it]"/>
							</g:radioGroup>
							<br/>
							<div style="clear:left">
							
							<g:message code="survey.when" default="When" />: <g:datePicker name="dateSigmoidoscopyColonoscopy" precision="month" value="${surveyInstance?.dateSigmoidoscopyColonoscopy}"
                                      years="${thisyear..birth[java.util.Calendar.YEAR]}" default="none" noSelection="${['':'--']}" /> <span id="alertIfInvalid4"></span>
                                      </div>
                            
                    	</td>
                    </tr>
                    </tbody>
                    </table>
                    
					<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label><g:message code="survey.q42.table" default="q42.table" /></label><br/><br/>
					<%
					def SigmoidocopyOrColonoscopyFindingsList=[message(code:'survey.q42.t1'),
												message(code:'survey.q42.t2'),
												message(code:'survey.q42.t3'),
												message(code:'survey.q42.t4'),
												message(code:'survey.q42.t5'),
												message(code:'survey.q42.t6'),
												message(code:'survey.q42.t7'),
												message(code:'survey.q42.t8')]
					
					 %>
					
						<table class="box-table-b-wide">
						<thead>
						<tr>
							<th style="width:60%"><g:message code="survey.findings" default="Findings" /></th>
							<th><g:message code="survey.yesno" default="Yes / No" /></th>
						</tr>
						</thead>
						<tbody>
						<g:each in="${SigmoidocopyOrColonoscopyFindingsList}" status="i" var="findings">
						<% def idx=i+1 %>
						<tr>
							<td style="font-weight:bold">${findings }
							</td>
							<td>
	                        	<g:radioGroup name="${('q42_'+idx)}"
	                            	value="${surveyInstance?.('q42_'+idx)}" 
	                                labels="${yesno }" 
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>						
							</td>
						</tr>
						</g:each>
						</tbody>
						</table>                    
                    

                    
                    <table class="box-table-b-wide">
                    <tbody>
                    <tr>
                    	<td style="width:60%;font-weight:bold"><label><g:message code="survey.q43" default="q43" /></label></td>
                    	<td>
                        	<g:radioGroup name="q43"
                            	value="${surveyInstance?.q43}" 
                                labels="${yesno }" 
                                values="['yes', 'no']" >
								<g:render template="/common/checkmark_radio" model="[it:it]"/>
							</g:radioGroup>
							<br/>
							<div style="clear:left">
								<g:message code="survey.results" default="Results" />: <g:textField name="q43_biopsy_results" value="${surveyInstance?.q43_biopsy_results}" />
							</div>
							                    	
                    	</td>
                    </tr>
                    <tr>
                    	<td style="width:60%;font-weight:bold"><label><g:message code="survey.q44" default="q44" /></label></td>
                    	<td>
                        	<g:radioGroup name="q44"
                            	value="${surveyInstance?.q44}" 
                                labels="${yesno }" 
                                values="['yes', 'no']" >
								<g:render template="/common/checkmark_radio" model="[it:it]"/>
							</g:radioGroup>
							<br/>
							<div style="clear:left">
								<g:message code="survey.hemoglobinLevels" default="hemoglobin_levels" />: <g:textField name="q44_hemoglobin_levels" 
																													   value="${surveyInstance?.q44_hemoglobin_levels}"
																													   onkeyup="checkIfValidNumber(this.value, 7, 15, document.getElementById(\'q44_status\')); "/> <span id="q44_status"></span>
							</div>                    	
                    	</td>
                    </tr>                    
                    </tbody>
                    </table> 					
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'button.save-finish-later.label', default: 'update')}"  onclick="DisableEnableForm(document.surveyform8,false);" /></span>
                    <span class="button"><g:actionSubmit class="back" action="step7" value="${message(code: 'button.go-back.label', default: 'back')}"  onclick="DisableEnableForm(document.surveyform8,false);" /></span>
                    <%--<span class="button"><g:render template="/common/back_button"/></span>
                    <span class="button"><input type="reset" value="${message(code: 'button.reset-all.label', default: 'reset')}"></span> --%>  
                    <span class="button"><g:actionSubmit class="next" action="update_unified" value="${message(code: 'button.save-then-go-to-next.label', default: 'next')}"  onclick="DisableEnableForm(document.surveyform8,false);" /></span>
                    <span class="menuButton"><g:render template="/common/step_meter"/></span>
                 </div>
            </g:form>
        </div>
    </body>
</html>
