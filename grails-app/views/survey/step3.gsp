<%@ page import="u56survey.Survey" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'survey.label', default: 'Survey')}" />
        <title><g:message code="step3.label" default="Step3" /></title>

        <%-- <jv:generateValidation domain="survey" form="surveyform3"  display="list" container="errors"/> --%>
        
		<g:render template="errMsgsToJson-js"/>

		<g:javascript src="check_step3.js" />        
                
    </head>
    <body>
<g:javascript>
$(document).ready(function(){ 
	$("input[name='familyHaveCancer']").change(function(){
	    if ($("input[name='familyHaveCancer']:checked").val() == 'yes'){
			$("[name*='_cancerType']").attr("disabled", '');
	    	$("[name*='_ageDiagnosed']").attr("disabled", '');
	    	
	    	$(':regex(id,q13_([0-9]|[0-9][0-9])_cancerType)').attr("disabled", '');
	    	$(':regex(id,q13_([0-9]|[0-9][0-9])_ageDiagnosed)').attr("disabled", '');
	    	
	    	$("[name='q13_other_family_member']").attr("disabled", '');
	    }
	    else if ($("input[name='familyHaveCancer']:checked").val() == 'no'){
			$("[name*='_cancerType']").val('');
	    	$("[name*='_ageDiagnosed']").val('');

	    	$(':regex(id,q12_([0-9]|[0-9][0-9])_cancerType)').attr("disabled", true);
	    	$(':regex(id,q12_([0-9]|[0-9][0-9])_ageDiagnosed)').attr("disabled", true);

	    	$("[name*='_cancerType']").attr("disabled", true);
	    	$("[name*='_ageDiagnosed']").attr("disabled", true);
	    	
	    	$("[name='q13_other_family_member']").val('');
	    	$("[name='q13_other_family_member']").attr("disabled", true);
	    	
	    	
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

	    if ($("input[name='familyHaveCancer']:checked").val() == 'yes'){
			$("[name*='_cancerType']").attr("disabled", '');
	    	$("[name*='_ageDiagnosed']").attr("disabled", '');
	    	
	    	$(':regex(id,q13_([0-9]|[0-9][0-9])_cancerType)').attr("disabled", '');
	    	$(':regex(id,q13_([0-9]|[0-9][0-9])_ageDiagnosed)').attr("disabled", '');
	    	
	    	$("[name='q13_other_family_member']").attr("disabled", '');
	    }
	    else if ($("input[name='familyHaveCancer']:checked").val() == 'no'){
			$("[name*='_cancerType']").val('');
	    	$("[name*='_ageDiagnosed']").val('');

	    	$(':regex(id,q12_([0-9]|[0-9][0-9])_cancerType)').attr("disabled", true);
	    	$(':regex(id,q12_([0-9]|[0-9][0-9])_ageDiagnosed)').attr("disabled", true);

	    	$("[name*='_cancerType']").attr("disabled", true);
	    	$("[name*='_ageDiagnosed']").attr("disabled", true);
	    	
	    	$("[name='q13_other_family_member']").val('');
	    	$("[name='q13_other_family_member']").attr("disabled", true);
	    	
	    	
	    }

});	
</g:javascript>        
            <h1><g:message code="step3.label" default="Step3" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>

<div id="errors" class="errors" style="display:none;"></div>

            <g:form name="surveyform3"
            	onsubmit="return checkForm3();"
            	method="post" >

                <g:hiddenField name="id" value="${surveyInstance?.id}" />
                <g:hiddenField name="version" value="${surveyInstance?.version}" />
                <g:render template="/common/status_info" model="['dob':surveyInstance?.DOB]"/>
                <div class="dialog">
                	<br/><br/>
                	<ul>
	                	<label for="q13"><g:message code="survey.q13.label" default="q13" /></label> 
	                	<br/><br/>
	                	<ul>
<%--	
							<input type="radio" name="familyHaveCancer" value="yes" onClick="toggleQ13();" <g:if test="${surveyInstance?.familyHaveCancer=='yes'}">checked="true"</g:if> /> <g:message code="survey.yes" default="Yes" />&nbsp;&nbsp;&nbsp;
							<input type="radio" name="familyHaveCancer" value="no" onClick="toggleQ13();" <g:if test="${surveyInstance?.familyHaveCancer=='no'}">checked="true"</g:if> /> <g:message code="survey.no" default="No" />
 --%>							
                                <g:radioGroup name="familyHaveCancer"
                                   value="${surveyInstance?.familyHaveCancer}" 
                                   labels="[g.message(code:'survey.yes'),g.message(code:'survey.no')]"
                                   values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>						

						</ul>
					</ul>
					<br/>					                	
                	<div id="q13div"> 
                	<%--
                    	<g:if test="${surveyInstance?.familyHaveCancer=='yes'}">style="display:block;"</g:if>
                    	<g:else>style="display:none;"</g:else>
                    	 id="q13div">
                    --%>
                     
                    	                	
                    <table class="box-table-b-wide">
                    	<thead>
                    		<tr>
                    		<th class="rounded-company"><g:message code="survey.q13.family" default="Family" /></th>
                    		<th class="rounded-q4"><g:message code="survey.q13.typeofcancer_and_ageofdiagnosis" default="Type of Cancer / Age of Diagnosis" /></th>
                    		</tr>
                    	</thead>

                        <tbody>
                        <%						
						def FamilyList=[message(code:"survey.q13_mother"),
										message(code:"survey.q13_father"),
										message(code:"survey.q13_sister"),
										message(code:"survey.q13_brother"),
										message(code:"survey.q13_daughter"),
										message(code:"survey.q13_son"),
										message(code:"survey.q13_maternal_grandmother"),
										message(code:"survey.q13_maternal_grandfather"),
										message(code:"survey.q13_maternal_aunt"),
										message(code:"survey.q13_maternal_uncle"),
										message(code:"survey.q13_paternal_grandmother"),
										message(code:"survey.q13_paternal_grandfather"),
										message(code:"survey.q13_paternal_aunt"),
										message(code:"survey.q13_paternal_uncle"),
										message(code:"survey.q13_others")]

						def CancerList=["anal":message(code:"survey.q12_anal"),
										"bladder":message(code:"survey.q12_bladder"),
										"brain":message(code:"survey.q12_brain"),
										"breast":message(code:"survey.q12_breast"),
										"carcinoma":message(code:"survey.q12_carcinoma"),
										"cervical":message(code:"survey.q12_cervical"),
										"colon":message(code:"survey.q12_colon"),
										"uterine":message(code:"survey.q12_uterine"),
										"esophageal":message(code:"survey.q12_esophageal"),
										"gallbladder":message(code:"survey.q12_gallbladder"),
										"GIST":message(code:"survey.q12_GIST"),
										"hodgkin":message(code:"survey.q12_hodgkin"),
										"kidney":message(code:"survey.q12_kidney"),
										"leukemia":message(code:"survey.q12_leukemia"),
										"liver":message(code:"survey.q12_liver"),
										"lung":message(code:"survey.q12_lung"),
										"melanoma":message(code:"survey.q12_melanoma"),
										"myeloma":message(code:"survey.q12_myeloma"),
										"non_hodgkin":message(code:"survey.q12_non_hodgkin"),
										"throat":message(code:"survey.q12_throat"),
										"ovarian":message(code:"survey.q12_ovarian"),
										"pancreatic":message(code:"survey.q12_pancreatic"),
										"prostate":message(code:"survey.q12_prostate"),
										"other":message(code:"survey.q12_other")]

						def CancerList_male=["anal":message(code:"survey.q12_anal"),
							"bladder":message(code:"survey.q12_bladder"),
							"brain":message(code:"survey.q12_brain"),
							"breast":message(code:"survey.q12_breast"),
							"carcinoma":message(code:"survey.q12_carcinoma"),
							"colon":message(code:"survey.q12_colon"),
							"esophageal":message(code:"survey.q12_esophageal"),
							"gallbladder":message(code:"survey.q12_gallbladder"),
							"GIST":message(code:"survey.q12_GIST"),
							"hodgkin":message(code:"survey.q12_hodgkin"),
							"kidney":message(code:"survey.q12_kidney"),
							"leukemia":message(code:"survey.q12_leukemia"),
							"liver":message(code:"survey.q12_liver"),
							"lung":message(code:"survey.q12_lung"),
							"melanoma":message(code:"survey.q12_melanoma"),
							"myeloma":message(code:"survey.q12_myeloma"),
							"non_hodgkin":message(code:"survey.q12_non_hodgkin"),
							"throat":message(code:"survey.q12_throat"),
							"pancreatic":message(code:"survey.q12_pancreatic"),
							"prostate":message(code:"survey.q12_prostate"),
							"other":message(code:"survey.q12_other")]

						def CancerList_female=["anal":message(code:"survey.q12_anal"),
							"bladder":message(code:"survey.q12_bladder"),
							"brain":message(code:"survey.q12_brain"),
							"breast":message(code:"survey.q12_breast"),
							"carcinoma":message(code:"survey.q12_carcinoma"),
							"cervical":message(code:"survey.q12_cervical"),
							"colon":message(code:"survey.q12_colon"),
							"uterine":message(code:"survey.q12_uterine"),
							"esophageal":message(code:"survey.q12_esophageal"),
							"gallbladder":message(code:"survey.q12_gallbladder"),
							"GIST":message(code:"survey.q12_GIST"),
							"hodgkin":message(code:"survey.q12_hodgkin"),
							"kidney":message(code:"survey.q12_kidney"),
							"leukemia":message(code:"survey.q12_leukemia"),
							"liver":message(code:"survey.q12_liver"),
							"lung":message(code:"survey.q12_lung"),
							"melanoma":message(code:"survey.q12_melanoma"),
							"myeloma":message(code:"survey.q12_myeloma"),
							"non_hodgkin":message(code:"survey.q12_non_hodgkin"),
							"throat":message(code:"survey.q12_throat"),
							"ovarian":message(code:"survey.q12_ovarian"),
							"pancreatic":message(code:"survey.q12_pancreatic"),
							"other":message(code:"survey.q12_other")]

						 %>
						<g:each in="${FamilyList}" status="i" var="member">
						 <tr class="prop">
						 	<% def idx=i+1 %>
						 	<td valign="top" class="name rounded-foot-left">${idx}. ${member}
							 	<g:if test="${member==message(code:'survey.q13_others') }">
							 		<g:textField name="q13_other_family_member" value="${surveyInstance?.q13_other_family_member}" />
							 	</g:if>
						 	</td>
						 	<td valign="top" class="value rounded-foot-right ${hasErrors(bean: surveyInstance, field: 'q13_'+idx+'_cancerType', 'errors')} ${hasErrors(bean: surveyInstance, field: 'q13_'+idx+'_ageDiagnosed', 'errors')}">
						 		<%-- <g:textField name="${('q13_'+idx+'_cancerType')}" value="${surveyInstance?.('q13_'+idx+'_cancerType')}" /> --%>
						 		<g:if test="${member==message(code:'survey.q13_father') || member==message(code:'survey.q13_brother') || member==message(code:'survey.q13_son') || member==message(code:'survey.q13_maternal_uncle') || member==message(code:'survey.q13_paternal_uncle') || member==message(code:'survey.q13_maternal_grandfather') || member==message(code:'survey.q13_paternal_grandfather')}">
							 		<g:select name="${('q13_'+idx+'_cancerType')}"
							 				  value="${surveyInstance?.('q13_'+idx+'_cancerType')}"
							 				  from="${CancerList_male}"
							 				  optionKey="key"
							 				  optionValue="value"
							 				  noSelection="['':'-'+message(code:'survey.q13.typeofcancer')+'-']"/>

						 		</g:if>
						 		<g:elseif test="${member==message(code:'survey.q13_mother') || member==message(code:'survey.q13_sister') || member==message(code:'survey.q13_daughter') || member==message(code:'survey.q13_maternal_aunt') || member==message(code:'survey.q13_paternal_aunt') || member==message(code:'survey.q13_maternal_grandmother') || member==message(code:'survey.q13_paternal_grandmother')}">
							 		<g:select name="${('q13_'+idx+'_cancerType')}"
							 				  value="${surveyInstance?.('q13_'+idx+'_cancerType')}"
							 				  from="${CancerList_female}"
							 				  optionKey="key"
							 				  optionValue="value"
							 				  noSelection="['':'-'+message(code:'survey.q13.typeofcancer')+'-']"/>

						 		</g:elseif>
						 		<g:else>
							 		<g:select name="${('q13_'+idx+'_cancerType')}"
							 				  value="${surveyInstance?.('q13_'+idx+'_cancerType')}"
							 				  from="${CancerList}"
							 				  optionKey="key"
							 				  optionValue="value"
							 				  noSelection="['':'-'+message(code:'survey.q13.typeofcancer')+'-']"/>
								</g:else> 
								/ <g:textField name="${('q13_'+idx+'_ageDiagnosed')}" 
											   value="${surveyInstance?.('q13_'+idx+'_ageDiagnosed')}"
											   onkeyup="checkIfValidNumber(this.value, -1, 125, document.getElementById(\'${('cancerAge_status'+idx)}\')); " /> <span id="${('cancerAge_status'+idx)}"></span>
						 	</td>
						 </tr>
						 </g:each>
                        </tbody>
                    </table>
                    </div>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'button.save-finish-later.label', default: 'update')}"   onclick="DisableEnableForm(document.surveyform3,false);" /></span>
                    <span class="button"><g:actionSubmit class="back" action="step2" value="${message(code: 'button.go-back.label', default: 'back')}"   onclick="DisableEnableForm(document.surveyform3,false);" /></span>
                    <%--<span class="button"><g:render template="/common/back_button"/></span>
                    <span class="button"><input type="reset" value="${message(code: 'button.reset-all.label', default: 'reset')}"></span> --%>  
<span class="button"><g:actionSubmit class="next" action="update_unified" value="${message(code: 'button.save-then-go-to-next.label', default: 'next')}"   onclick="DisableEnableForm(document.surveyform3,false);" /></span>
                    <span class="menuButton"><g:render template="/common/step_meter"/></span>
                 </div>
            </g:form>
        </div>
    </body>
</html>
