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
<g:javascript>
$(document).ready(function(){
	$("input[name='q37']").change(function(){
	    if ($("input[name='q37']:checked").val() != 'none'){
	    	$("[name*='q38']").attr("disabled", '');	    			    
	    }
	    else if ($("input[name='q37']:checked").val() == 'none'){
	    	$("[name*='q38']").attr('checked', false);
	    	$("[name*='q38']").attr("disabled", true);	    
	    }
	}); 
	$("input[name='q39']").change(function(){
	    if ($("input[name='q39']:checked").val() == 'yes'){
	    	$("[name*='q40']").attr("disabled", '');	    			    
	    }
	    else if ($("input[name='q39']:checked").val() == 'no'){
	    	$("[name*='q40']").val('');
	    	$("[name*='q40']").attr("disabled", true);	    
	    }
	});
	$("input[name='q41']").change(function(){
	    if ($("input[name='q41']:checked").val() == 'yes' || $("input[name='q41']:checked").val() == 'five'){
	    	$("[name*='date_digital_rectal_exam']").attr("disabled", '');	    			    
	    }
	    else if ($("input[name='q41']:checked").val() == 'no'){
	    	$("[name*='date_digital_rectal_exam']").val('');
	    	$("[name*='date_digital_rectal_exam']").attr("disabled", true);	    
	    }
	});
	$("input[name='q42']").change(function(){
	    if ($("input[name='q42']:checked").val() == 'yes'){
	    	$("[name*='date_sigmoidoscopy_colonoscopy']").attr("disabled", '');
	    	$("[name*='q42_']").attr("disabled", '');
	    	$("[name*='q43']").attr("disabled", '');	    			    
	    }
	    else if ($("input[name='q42']:checked").val() == 'no'){
	    	$("[name*='date_sigmoidoscopy_colonoscopy']").val('');
	    	$("[name*='date_sigmoidoscopy_colonoscopy']").attr("disabled", true);	  
	    	
	    	$("[name*='q42_']").attr("checked", false);
	    	$("[name*='q42_']").attr("disabled", true);
			
	    	$("[name*='q43']").attr("checked", false);
	    	$("[name*='q43']").attr("disabled", true);
	    }
	});
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
});	
</g:javascript>    
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
			<span class="menuButton"><g:render template="/common/step_meter"/></span>
        </div>
        <div class="body">
            <h1><g:message code="step8.label" default="Step8" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
<div id="errors" class="errors" style="display:none;">
</div>
            <g:form name="surveyform8"
            		onsubmit="return checkForm8();"
            		method="post" >
                <g:hiddenField name="id" value="${surveyInstance?.id}" />
                <g:hiddenField name="version" value="${surveyInstance?.version}" />
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
<%
	def birth=surveyInstance?.DOB ? surveyInstance?.DOB : new Date() 		
%>						
					

                    <table class="box-table-b-wide">
                    <tbody>
                    <tr>
                    	<td style="width:60%;font-weight:bold"><label><g:message code="survey.q37" default="q37" /></label></td>
                    	<td>
                    	<%
						def bleedingList=[message(code:'survey.q37.none'), message(code:'survey.q37.b1'), message(code:'survey.q37.b2'), message(code:'survey.q37.na')]
						 %>
                        	<g:radioGroup name="q37"
                            	value="${surveyInstance?.q37}" 
                                labels="${bleedingList }" 
                                values="['none', 'red','black', 'n/a']" >
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
							<div style="clear:left"><g:message code="survey.when" default="When" />: <g:datePicker name="date_digital_rectal_exam" precision="month" value="${surveyInstance?.date_digital_rectal_exam}"
                                      years="${thisyear..birth[java.util.Calendar.YEAR]}" default="none" noSelection="${['':'--']}" />
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
							
							<g:message code="survey.when" default="When" />: <g:datePicker name="date_sigmoidoscopy_colonoscopy" precision="month" value="${surveyInstance?.date_sigmoidoscopy_colonoscopy}"
                                      years="${thisyear..birth[java.util.Calendar.YEAR]}" default="none" noSelection="${['':'--']}" />
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
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'button.save-finish-later.label', default: 'update')}" /></span>
                    <span class="button"><g:actionSubmit class="back" action="step7" value="${message(code: 'button.go-back.label', default: 'back')}" /></span>
                    <%--<span class="button"><g:render template="/common/back_button"/></span>
                    <span class="button"><input type="reset" value="${message(code: 'button.reset-all.label', default: 'reset')}"></span> --%>  
                    <span class="button"><g:actionSubmit class="next" action="update_unified" value="${message(code: 'button.save-then-go-to-next.label', default: 'next')}" /></span>
                    <span class="menuButton"><g:render template="/common/step_meter"/></span>
                 </div>
            </g:form>
        </div>
    </body>
</html>
