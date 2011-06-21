<%@ page import="u56survey.Survey" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'survey.label', default: 'Survey')}" />
        <title><g:message code="step12.label" default="Step12" /></title>

		<%--<jv:generateValidation domain="survey" form="surveyform12"  display="list" container="errors"/> --%>  

		<g:render template="errMsgsToJson-js"/>

		<g:javascript src="check_step12.js" />  

    </head>
    <body>
<g:javascript>
$(document).ready(function(){
	$("input[name='q83']").change(function(){
	    if ($("input[name='q83']:checked").val() == 'yes'){
			$("[name*='q84_'][type=radio]").attr("disabled", '');
			$("[name*='q84_'][type=text]").attr("disabled", '');
			$("[name*='_rad_date']").attr("disabled", '');	    
	    }
	    else if ($("input[name='q83']:checked").val() == 'no'){
	    	$("[name*='q84_'][type=radio]").attr('checked', false);
	    	$("[name*='q84_'][type=radio]").attr("disabled", true);	  
	    	$("[name*='q84_'][type=text]").val('');
	    	$("[name*='q84_'][type=text]").attr("disabled", true);
	    	$("[name*='_rad_date']").val('');
			$("[name*='_rad_date']").attr("disabled", true);

	    }
	});
	$("input[name='q84_1']").change(function(){
	    if ($("input[name='q84_1']:checked").val() == 'yes'){
			$("#q84_1_whatAge").attr("disabled", '');
			$("[name*='_1_rad_date']").attr("disabled", '');	    
	    }
	    else if ($("input[name='q84_1']:checked").val() == 'no'){
	    	$("#q84_1_whatAge").val('');
	    	$("#q84_1_whatAge").attr("disabled", true);
	    	$("[name*='_1_rad_date']").val('');
			$("[name*='_1_rad_date']").attr("disabled", true);
	    }
	});
	$("input[name='q84_2']").change(function(){
	    if ($("input[name='q84_2']:checked").val() == 'yes'){
			$("#q84_2_whatAge").attr("disabled", '');
			$("[name*='_2_rad_date']").attr("disabled", '');	    
	    }
	    else if ($("input[name='q84_2']:checked").val() == 'no'){
	    	$("#q84_2_whatAge").val('');
	    	$("#q84_2_whatAge").attr("disabled", true);
	    	$("[name*='_2_rad_date']").val('');
			$("[name*='_2_rad_date']").attr("disabled", true);
	    }
	});
	$("input[name='q84_3']").change(function(){
	    if ($("input[name='q84_3']:checked").val() == 'yes'){
			$("#q84_3_whatAge").attr("disabled", '');
			$("[name*='_3_rad_date']").attr("disabled", '');	    
	    }
	    else if ($("input[name='q84_3']:checked").val() == 'no'){
	    	$("#q84_3_whatAge").val('');
	    	$("#q84_3_whatAge").attr("disabled", true);
	    	$("[name*='_3_rad_date']").val('');
			$("[name*='_3_rad_date']").attr("disabled", true);
	    }
	});
	$("input[name='q84_4']").change(function(){
	    if ($("input[name='q84_4']:checked").val() == 'yes'){
			$("#q84_4_whatAge").attr("disabled", '');
			$("[name*='_4_rad_date']").attr("disabled", '');	    
	    }
	    else if ($("input[name='q84_4']:checked").val() == 'no'){
	    	$("#q84_4_whatAge").val('');
	    	$("#q84_4_whatAge").attr("disabled", true);
	    	$("[name*='_4_rad_date']").val('');
			$("[name*='_4_rad_date']").attr("disabled", true);
	    }
	});
	$("input[name='q84_5']").change(function(){
	    if ($("input[name='q84_5']:checked").val() == 'yes'){
			$("#q84_5_whatAge").attr("disabled", '');
			$("[name*='_5_rad_date']").attr("disabled", '');	    
	    }
	    else if ($("input[name='q84_5']:checked").val() == 'no'){
	    	$("#q84_5_whatAge").val('');
	    	$("#q84_5_whatAge").attr("disabled", true);
	    	$("[name*='_5_rad_date']").val('');
			$("[name*='_5_rad_date']").attr("disabled", true);
	    }
	});
	$("input[name='q84_6']").change(function(){
	    if ($("input[name='q84_6']:checked").val() == 'yes'){
			$("#q84_6_whatAge").attr("disabled", '');
			$("[name*='_6_rad_date']").attr("disabled", '');	    
	    }
	    else if ($("input[name='q84_6']:checked").val() == 'no'){
	    	$("#q84_6_whatAge").val('');
	    	$("#q84_6_whatAge").attr("disabled", true);
	    	$("[name*='_6_rad_date']").val('');
			$("[name*='_6_rad_date']").attr("disabled", true);
	    }
	});
	$("input[name='q84_7']").change(function(){
	    if ($("input[name='q84_7']:checked").val() == 'yes'){
			$("#q84_7_whatAge").attr("disabled", '');
			$("[name*='_7_rad_date']").attr("disabled", '');	    
	    }
	    else if ($("input[name='q84_7']:checked").val() == 'no'){
	    	$("#q84_7_whatAge").val('');
	    	$("#q84_7_whatAge").attr("disabled", true);
	    	$("[name*='_7_rad_date']").val('');
			$("[name*='_7_rad_date']").attr("disabled", true);
	    }
	});
	$("input[name='q84_8']").change(function(){
	    if ($("input[name='q84_8']:checked").val() == 'yes'){
			$("#q84_8_whatAge").attr("disabled", '');
			$("[name*='_8_rad_date']").attr("disabled", '');	    
	    }
	    else if ($("input[name='q84_8']:checked").val() == 'no'){
	    	$("#q84_8_whatAge").val('');
	    	$("#q84_8_whatAge").attr("disabled", true);
	    	$("[name*='_8_rad_date']").val('');
			$("[name*='_8_rad_date']").attr("disabled", true);
	    }
	});
	$("input[name='q84_9']").change(function(){
	    if ($("input[name='q84_9']:checked").val() == 'yes'){
			$("#q84_9_whatAge").attr("disabled", '');
			$("[name*='_9_rad_date']").attr("disabled", '');	    
	    }
	    else if ($("input[name='q84_9']:checked").val() == 'no'){
	    	$("#q84_9_whatAge").val('');
	    	$("#q84_9_whatAge").attr("disabled", true);
	    	$("[name*='_9_rad_date']").val('');
			$("[name*='_9_rad_date']").attr("disabled", true);
	    }
	});
	$("input[name='q84_10']").change(function(){
	    if ($("input[name='q84_10']:checked").val() == 'yes'){
			$("#q84_10_whatAge").attr("disabled", '');
			$("[name*='_10_rad_date']").attr("disabled", '');	    
	    }
	    else if ($("input[name='q84_10']:checked").val() == 'no'){
	    	$("#q84_10_whatAge").val('');
	    	$("#q84_10_whatAge").attr("disabled", true);
	    	$("[name*='_10_rad_date']").val('');
			$("[name*='_10_rad_date']").attr("disabled", true);
	    }
	});
});	
</g:javascript>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
			<span class="menuButton"><g:render template="/common/step_meter"/></span>
        </div>
        <div class="body">
            <h1><g:message code="step12.label" default="Step12" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
<div id="errors" class="errors" style="display:none;">
</div>
            <g:form name="surveyform12"
            		onsubmit="return checkForm12();"
            		method="post" >
                <g:hiddenField name="id" value="${surveyInstance?.id}" />
                <g:hiddenField name="version" value="${surveyInstance?.version}" />
                <g:render template="/common/status_info"  model="['dob':surveyInstance?.DOB]"/>
                <div class="dialog">
					<%
					def yesno=[message(code:'survey.yes'), message(code:'survey.no')]     
					%>                
                    <br/>
                    <ul>
                    <div>
	                    <label><g:message code="survey.q83" default="q83" /></label>
	                    <br/><br/>
	                    <div>
	                    <g:radioGroup name="q83"
		                            	value="${surveyInstance?.q83}" 
		                                labels="${yesno }" 
		                                values="['yes','no']" >
										<g:render template="/common/checkmark_radio" model="[it:it]"/>
									</g:radioGroup>
						
						</div>
					</div>
					</ul>
                    <ul>
                    <br/><br/>
                    <div style="clear:left">
                    	<label><g:message code="survey.q84" default="q84" /></label>
                    </div>
                    </ul>
                    <br/>
                    <%
							def birth=surveyInstance?.DOB ? surveyInstance?.DOB : new Date() 		
					%>	                    

                    <%
					def RadiationTypeList=[message(code:'survey.q84.t1'),
											message(code:'survey.q84.t2'),
											message(code:'survey.q84.t3'),
											message(code:'survey.q84.t4'),
											message(code:'survey.q84.t5'),
											message(code:'survey.q84.t6'),
											message(code:'survey.q84.t7'),
											message(code:'survey.q84.t8'),
											message(code:'survey.q84.t9'),
											message(code:'survey.q84.t10')]
					 %>
					 <table class="box-table-b-wide">
					 <thead>
					 <tr>
					 	<th><g:message code="survey.typeofradiation" default="Disease/ Type of radiation" /></th>
					 	<th><g:message code="survey.yesno" default="Yes / No" /></th>
					 	<th><g:message code="survey.whenradiation" default="when did you receive the radiation?" /></th>
					 	<th><g:message code="survey.atwhatage" default="At what age" /></th>
					 </tr>
					 </thead>
					 <tbody>
					 <g:each in="${RadiationTypeList }" status="i" var="radiation">
					 <%def idx = i+1 %>
					 <tr>
					 	<td style="width:25%;font-weight:bold">					 		
					 		${idx }. <g:if test="${radiation==message(code:'survey.q84.t10') }">
					 			<g:message code="survey.q84.another.place" default="Indicate another place" />
					 			<g:textField name="q84_another" value="${surveyInstance?.q84_another}" />
					 		</g:if>
					 		<g:else>
					 			${radiation }
					 		</g:else>
					 	</td>
					 	<td style="width:25%">
	                        	<g:radioGroup name="${('q84_'+idx)}"
	                            	value="${surveyInstance?.('q84_'+idx)}" 
	                                labels="${yesno }" 
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>					 	
					 	</td>
					 	<td style="width:40%">
					 		<g:kimsiDatePicker name="${('q84_'+idx+'_rad_date')}" precision="day" value="${surveyInstance?.('q84_'+idx+'_rad_date')}"  
                                      years="${thisyear..birth[java.util.Calendar.YEAR]}" default="none" noSelection="${['':'--']}" />
					 	</td>
					 	<td style="width:10%">
					 		<g:textField name="${('q84_'+idx+'_whatAge')}"
					 					 value="${surveyInstance?.('q84_'+idx+'_whatAge')}" 
					 					 onkeyup="checkIfValidNumber(this.value, 1, ageCalculated, document.getElementById(\'${('q84_age_status'+idx)}\')); "/>
					 		<br/>
					 		 <span id="${('q84_age_status'+idx)}"></span> 
					 	</td>
					 </tr>
					 </g:each>
					 </tbody>
					 </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'button.save-finish-later.label', default: 'update')}" /></span>
                    <span class="button"><g:actionSubmit class="back" action="step11" value="${message(code: 'button.go-back.label', default: 'back')}" /></span>
                    <%--<span class="button"><g:render template="/common/back_button"/></span>
                    <span class="button"><input type="reset" value="${message(code: 'button.reset-all.label', default: 'reset')}"></span> --%>  
                    <span class="button"><g:actionSubmit class="next" action="update_unified" value="${message(code: 'button.save-then-go-to-next.label', default: 'next')}" /></span>
                    <span class="menuButton"><g:render template="/common/step_meter"/></span>
                 </div>
            </g:form>
        </div>
    </body>
</html>
