<%@ page import="u56survey.Survey" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'survey.label', default: 'Survey')}" />
        <title><g:message code="step2.label" default="Step2" /></title>

		<%-- <jv:generateValidation domain="survey" form="surveyform2"  display="alert" container="errors"/> --%>        
		
		<g:render template="errMsgsToJson-js"/>

		<g:javascript src="check_step2.js" />	
    </head>
    <body>
<%
	def birth=surveyInstance?.DOB ? surveyInstance?.DOB : new Date()
	//out << "dob="+birth[java.util.Calendar.YEAR]+"<br/>"
	def today=new Date() 		
	//out << "today="+today[java.util.Calendar.YEAR]+"<br/>"
%>	    
<g:javascript><g:if test="${surveyInstance?.mode!='paper'}">

$(document).ready(function(){ 

        $("#tblCancerDiagnosed td input.rdelete").live("click", function () {
            var srow = $(this).parent().parent();
            existing_C--;
            srow.remove();
        });
      

	$("input[name='q11a_1']").change(function(){
	    if ($("input[name='q11a_1']:checked").val() == 'yes'){
	    	$("#q11a_1_status").html(" <font color='red'>Choose Year</font>");
	    	$("#q11a_1Year_year").attr("disabled", '');


	    }
	    else if ($("input[name='q11a_1']:checked").val() == 'no'){
	    	$("#q11a_1_status").html("");
	    	$("#q11a_1Year_year").val('');
	    	$("#q11a_1Year_year").attr("disabled", true);

	    }
	}); 
	$("input[name='q11a_2']").change(function(){
	    if ($("input[name='q11a_2']:checked").val() == 'yes'){
	    	$("#q11a_2_status").html(" <font color='red'>Choose Year</font>");
	    	$("#q11a_2Year_year").attr("disabled", '');
	    }
	    else if ($("input[name='q11a_2']:checked").val() == 'no'){
	    	$("#q11a_2_status").html('');
	    	$("#q11a_2Year_year").val('');
	    	$("#q11a_2Year_year").attr("disabled", true);
	    }
	}); 
	$("input[name='q11a_3']").change(function(){
	    if ($("input[name='q11a_3']:checked").val() == 'yes'){
	    	$("#q11a_3_status").html(" <font color='red'>Choose Year</font>");
	    	$("#q11a_3Year_year").attr("disabled", '');
	    }
	    else if ($("input[name='q11a_3']:checked").val() == 'no'){
	    	$("#q11a_3_status").html('');
	    	$("#q11a_3Year_year").val('');
	    	$("#q11a_3Year_year").attr("disabled", true);
	    }
	}); 
	$("#q11a_hep_donotknow_type").change(function(){
		if (this.checked){

	    	$("#q11a_hep_donotknow_type_Year_year").val('');
	    	$("#q11a_hep_donotknow_type_Year_year").attr("disabled", '');		
		
	    	$("[name*='q11a_1']").attr('checked', false);
	    	$("[name*='q11a_1']").attr('disabled', true);
	    	$("[name*='q11a_2']").attr('checked', false);
	    	$("[name*='q11a_2']").attr('disabled', true);
	    	$("[name*='q11a_3']").attr('checked', false);
	    	$("[name*='q11a_3']").attr('disabled', true);

	    	$("#q11a_1_status").html('');
	    	$("#q11a_1Year_year").val('');
	    	$("#q11a_1Year_year").attr("disabled", true);
	    	
	    	$("#q11a_2_status").html('');
	    	$("#q11a_2Year_year").val('');
	    	$("#q11a_2Year_year").attr("disabled", true);

	    	$("#q11a_3_status").html('');
	    	$("#q11a_3Year_year").val('');
	    	$("#q11a_3Year_year").attr("disabled", true);		
    	
		}
		else{
			$("#q11a_hep_donotknow_type_Year_year").attr("disabled", true);	
		
	    	$("[name*='q11a_1']").attr('disabled', false);
	    	$("[name*='q11a_2']").attr('disabled', false);
	    	$("[name*='q11a_3']").attr('disabled', false);			
		}
	});
	$("input[name='q11a_4']").change(function(){ // don't know type so disable all above hepatitis
	    if ($("input[name='q11a_4']:checked").val() == 'yes'){
	    	$("#q11a_4_status").html(" <font color='red'>Choose Year</font>");
	    	$("#q11a_4Year_year").attr("disabled", '');


	    }
	    else if ($("input[name='q11a_4']:checked").val() == 'no'){
	    	$("#q11a_4_status").html("");
	    	$("#q11a_4Year_year").val('');
	    	$("#q11a_4Year_year").attr("disabled", true);
	    	

	    }
	});
	$("input[name='q11a_5']").change(function(){
	    if ($("input[name='q11a_5']:checked").val() == 'yes'){
	    	$("#q11a_5_status").html(" <font color='red'>Choose Year</font>");
	    	$("#q11a_5Year_year").attr("disabled", '');
	    }
	    else if ($("input[name='q11a_5']:checked").val() == 'no'){
	    	$("#q11a_5_status").html("");
	    	$("#q11a_5Year_year").val('');
	    	$("#q11a_5Year_year").attr("disabled", true);
	    }
	});	
	$("input[name='q11a_6']").change(function(){
	    if ($("input[name='q11a_6']:checked").val() == 'yes'){
	    	$("#q11a_6_status").html(" <font color='red'>Choose Year</font>");
	    	$("#q11a_6Year_year").attr("disabled", '');
	    }
	    else if ($("input[name='q11a_6']:checked").val() == 'no'){
	    	$("#q11a_6_status").html("");
	    	$("#q11a_6Year_year").val('');
	    	$("#q11a_6Year_year").attr("disabled", true);
	    }
	});	
	$("input[name='q11a_7']").change(function(){
	    if ($("input[name='q11a_7']:checked").val() == 'yes'){
	    	$("#q11a_7_status").html(" <font color='red'>Choose Year</font>");
	    	$("#q11a_7Year_year").attr("disabled", '');
	    }
	    else if ($("input[name='q11a_7']:checked").val() == 'no'){
	    	$("#q11a_7_status").html("");
	    	$("#q11a_7Year_year").val('');
	    	$("#q11a_7Year_year").attr("disabled", true);
	    }
	});	
	$("input[name='haveCancer']").change(function(){
	    if ($("input[name='haveCancer']:checked").val() == 'yes'){
	    	$("#q12_status").html(" <font color='red'>(<b>***</b>)</font>");
	    	$(':regex(id,q12_([0-9]|[0-9][0-9]))').attr("disabled", '');
	    	$("[name*='_ageDiagnosed']").attr("disabled", '');
	    	//$("[name*='q12_1_'], [name*='q12_2_'], [name*='q12_3_'], [name*='q12_4_']").attr("disabled", '');
	    	$(':regex(id,q12_([0-9]|[0-9][0-9])_[1-4])').attr("disabled", '');
	    	$("[name='q12_which_cancer']").attr("disabled", '');
	    	
	    	$("[name*='spread_'][type=checkbox]").attr("disabled", '');
	    	$("[name='spread_cancer']").attr("disabled", '');
	    	$("#spread_where").attr("disabled", "");
	    }
	    else if ($("input[name='haveCancer']:checked").val() == 'no'){
	    	$("#q12_status").html("");
	    	$("[name*='q12_25']").val('');
	    	$("[name*='q12_25']").attr("disabled", true);
	    	$("[name*='q12_26']").val('');
	    	$("[name*='q12_26']").attr("disabled", true);	    	
	    	$("[name*='q12_27']").val('');
	    	$("[name*='q12_27']").attr("disabled", true);	    	
	    	$("[name*='q12_28']").val('');
	    	$("[name*='q12_28']").attr("disabled", true);	    	
	    	$("[name*='q12_29']").val('');
	    	$("[name*='q12_29']").attr("disabled", true);	    	
	    		    	
	    	$("[name*='_ageDiagnosed']").val('');
	    	$("[name*='_ageDiagnosed']").attr("disabled", true);
	    	$("[name='q12_which_cancer']").val('');
	    	$("[name='q12_which_cancer']").attr("disabled", true);
	    	$(':regex(id,q12_([0-9]|[0-9][0-9])_[1-4])').attr("checked", '');
	    	$(':regex(id,q12_([0-9]|[0-9][0-9])_[1-4])').attr("disabled", true);
	    	$("[name*='q12_1_'], [name*='q12_2_'], [name*='q12_3_'], [name*='q12_4_']").attr("disabled", true);
	    	
	    	$("[name='spread_cancer']").removeAttr("checked");
	    	$("[name='spread_cancer']").attr("disabled", true);
	    	$("[name*='spread_'][type=checkbox]").attr("checked", false);
	    	$("#spread_where").val('');
	    	$("#spread_where").attr("disabled", true);
	    	$("[name*='spread_'][type=checkbox]").attr("disabled", true);
	    	
	    }
	});

	$("input[name='spread_cancer']").change(function(){
	    if ($("input[name='spread_cancer']:checked").val() == 'yes'){

	    	$("[name*='spread_'][type=checkbox]").attr("disabled", '');
	    	$("#spread_where").attr("disabled", "");
	    }
	    else if ($("input[name='spread_cancer']:checked").val() == 'no'){
	    	$("[name*='spread_'][type=checkbox]").attr("checked", false);
	    	$("#spread_other").val('');
	    	$("#spread_where").val('');
	    	$("[name*='spread_'][type=checkbox]").attr("disabled", true);
	    	$("#spread_where").attr("disabled", true);
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
if ($("input[name='q11a_1']:checked").val() == 'no'){
	    	$("#q11a_1_status").html("");
	    	$("#q11a_1Year_year").val('');
	    	$("#q11a_1Year_year").attr("disabled", true);

	    }


if ($("input[name='q11a_2']:checked").val() == 'no'){
	    	$("#q11a_2_status").html('');
	    	$("#q11a_2Year_year").val('');
	    	$("#q11a_2Year_year").attr("disabled", true);
	    }


if ($("input[name='q11a_3']:checked").val() == 'no'){
	    	$("#q11a_3_status").html('');
	    	$("#q11a_3Year_year").val('');
	    	$("#q11a_3Year_year").attr("disabled", true);
	    }


		if ($("#q11a_hep_donotknow_type").attr('checked')){

	    	$("#q11a_hep_donotknow_type_Year_year").val('');
	    	$("#q11a_hep_donotknow_type_Year_year").attr("disabled", '');		
		
	    	$("[name*='q11a_1']").attr('checked', false);
	    	$("[name*='q11a_1']").attr('disabled', true);
	    	$("[name*='q11a_2']").attr('checked', false);
	    	$("[name*='q11a_2']").attr('disabled', true);
	    	$("[name*='q11a_3']").attr('checked', false);
	    	$("[name*='q11a_3']").attr('disabled', true);

	    	$("#q11a_1_status").html('');
	    	$("#q11a_1Year_year").val('');
	    	$("#q11a_1Year_year").attr("disabled", true);
	    	
	    	$("#q11a_2_status").html('');
	    	$("#q11a_2Year_year").val('');
	    	$("#q11a_2Year_year").attr("disabled", true);

	    	$("#q11a_3_status").html('');
	    	$("#q11a_3Year_year").val('');
	    	$("#q11a_3Year_year").attr("disabled", true);		
    	
		}

if ($("input[name='q11a_4']:checked").val() == 'no'){
	    	$("#q11a_4_status").html("");
	    	$("#q11a_4Year_year").val('');
	    	$("#q11a_4Year_year").attr("disabled", true);
	    }


if ($("input[name='q11a_5']:checked").val() == 'no'){
	    	$("#q11a_5_status").html("");
	    	$("#q11a_5Year_year").val('');
	    	$("#q11a_5Year_year").attr("disabled", true);
	    }


if ($("input[name='q11a_6']:checked").val() == 'no'){
	    	$("#q11a_6_status").html("");
	    	$("#q11a_6Year_year").val('');
	    	$("#q11a_6Year_year").attr("disabled", true);
	    }


if ($("input[name='q11a_7']:checked").val() == 'no'){
	    	$("#q11a_7_status").html("");
	    	$("#q11a_7Year_year").val('');
	    	$("#q11a_7Year_year").attr("disabled", true);
	    }


	    if ($("input[name='haveCancer']:checked").val() == 'yes'){
	    	$("#q12_status").html(" <font color='red'>(<b>***</b>)</font>");
	    	$("[name*='_ageDiagnosed']").attr("disabled", '');
	    	//$("[name*='q12_1_'], [name*='q12_2_'], [name*='q12_3_'], [name*='q12_4_']").attr("disabled", '');
	    	$(':regex(id,q12_([0-9]|[0-9][0-9])_[1-4])').attr("disabled", '');
	    	$("[name='q12_which_cancer']").attr("disabled", '');
	    	
	    	$("[name*='spread_'][type=checkbox]").attr("disabled", '');
	    	$("[name='spread_cancer']").attr("disabled", '');
	    	$("#spread_where").attr("disabled", "");
	    }
	    else if ($("input[name='haveCancer']:checked").val() == 'no'){
	    	$("#q12_status").html("");
	    	$("[name*='_ageDiagnosed']").val('');
	    	$("[name*='_ageDiagnosed']").attr("disabled", true);
	    	$("[name='q12_which_cancer']").val('');
	    	$("[name='q12_which_cancer']").attr("disabled", true);
	    	$(':regex(id,q12_([0-9]|[0-9][0-9])_[1-4])').attr("checked", '');
	    	$(':regex(id,q12_([0-9]|[0-9][0-9])_[1-4])').attr("disabled", true);
	    	$("[name*='q12_1_'], [name*='q12_2_'], [name*='q12_3_'], [name*='q12_4_']").attr("disabled", true);
	    	
	    	$("[name='spread_cancer']").removeAttr("checked");
	    	$("[name='spread_cancer']").attr("disabled", true);
	    	$("[name*='spread_'][type=checkbox]").attr("checked", false);
	    	$("#spread_where").val('');
	    	$("#spread_where").attr("disabled", true);
	    	$("[name*='spread_'][type=checkbox]").attr("disabled", true);
	    	
	    }



if ($("input[name='spread_cancer']:checked").val() == 'no'){
	    	$("[name*='spread_'][type=checkbox]").attr("checked", false);
	    	$("#spread_other").val('');
	    	$("#spread_where").val('');
	    	$("[name*='spread_'][type=checkbox]").attr("disabled", true);
	    	$("#spread_where").attr("disabled", true);
	    }

	
</g:if>
	 	 
});
</g:javascript>
            <h1><g:message code="step2.label" default="Step2" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
<%-- 					onsubmit="return validateForm(this);" --%>
<div id="errors" class="errors" style="display:none;">
</div>
            <g:form name="surveyform2"
		onsubmit="if (document.getElementById('mode').value!='paper'){ return (checkForm2());} else {return confirmIfSure();}"
		method="post" >
                <g:hiddenField name="id" value="${surveyInstance?.id}" />
                <g:hiddenField name="version" value="${surveyInstance?.version}" />
                <g:hiddenField name="step" value="${step}" />
                <g:hiddenField name="surveyer" value="${session.user.login}" />
                <g:hiddenField name="mode" value="${surveyInstance?.mode}" />
                                
                <g:render template="/common/status_info" model="['dob':surveyInstance?.DOB]"/>
                <div class="dialog">
                    <table class="box-table-b-wide">
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name2" style="font-weight:bold;">
                                    <label for="weight"><g:message code="survey.q9" default="Weight" /></label>
                                </td>
                                <td valign="top" class="${hasErrors(bean: surveyInstance, field: 'weight', 'errors')}">
                                    <g:textField name="weight"
                                    			 value="${surveyInstance?.weight}"
                                    			 onkeyup="checkIfValidNumber(this.value, 10, 500, document.getElementById('weight_status'));" /> <g:message code="survey.pounds" default="Pounds" /> <span id="weight_status"></span>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name2" style="font-weight:bold;">
                                    <label for="height_feet">
                                    	<g:message code="survey.q10" default="Height feet" />
                                    </label>
                                </td>
                                <td valign="top" class="${hasErrors(bean: surveyInstance, field: 'height_feet', 'errors')} ${hasErrors(bean: surveyInstance, field: 'height_inches', 'errors')}">
                                    <g:textField name="height_feet" 
                                    			 value="${surveyInstance?.height_feet}"
                                    			 onkeyup="checkIfValidNumber(this.value, 0, 10, document.getElementById('height_status1'));" /> <g:message code="survey.feet" default="feet" /> <span id="height_status1"></span><br/>
                                    <g:textField name="height_inches"
                                    			 value="${surveyInstance?.height_inches}" 
                                    			 onkeyup="checkIfValidNumber(this.value, 0, 11.99, document.getElementById('height_status2'));"/> <g:message code="survey.inches" default="inches" /> <span id="height_status2"></span>
                                </td>
                            </tr>

                                                                                    
                        </tbody>
                    </table>
					<ul><label for="q11a"><g:message code="survey.q11a.label" default="q11a" /></label></ul>
					<% def InfectionsList=[message(code:"survey.hepatitis")+" ("+message(code:"survey.q11a_donotknow")+")",
										message(code:"survey.hepatitis")+" A",
										message(code:"survey.hepatitis")+" B",
										message(code:"survey.hepatitis")+" C",
										message(code:"survey.anytype_hpv"),
										message(code:"survey.AIDS_HIV"),,
										message(code:"survey.helicobacter_pylori")]
					 %>
					<table class="box-table-b-wide">
					<thead>
						<tr>
						<th style="width: 40%;border: 1px solid #9baff1;""><g:message code="survey.infection" default="Infection" /></th>
						<th style="width: 30%;border: 1px solid #9baff1;""><g:message code="survey.yesno" default="Yes / No" /></th>
						<th style="width: 30%;border: 1px solid #9baff1;""><g:message code="survey.first_infection" default="Year of first infection" />
						<br/><label style="color:orange">(<g:message code="survey.donotremember" />)</label>
						</th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${InfectionsList}" status="i" var="infectiontype">
					<% def idx=i %>
					<g:if test="${idx==0}">
					<tr>
						<td style="border: 1px solid #9baff1;font-weight:bold;">${infectiontype }</td>
						<td style="border: 1px solid #9baff1;font-weight:bold;">
						<g:checkBox name="q11a_hep_donotknow_type" value="${surveyInstance?.q11a_hep_donotknow_type}" /> (<g:message code="survey.q11a_donotknow" />)				
						</td>
						
						<td>
							<g:datePicker name="q11a_hep_donotknow_type_Year" precision="year" value="${surveyInstance?.('q11a_hep_donotknow_type_Year')}"
	                                      years="${thisyear..birth[java.util.Calendar.YEAR]}" default="none" noSelection="${['':'--']}" /> <span id="${('q11a_hep_donotknow_type_Year_status')}"></span><br/>
						</td>
					</tr>
					</g:if>
					<g:else>
					<tr>
						<td style="border: 1px solid #9baff1;font-weight:bold;">${infectiontype }

						</td>
						<td style="border: 1px solid #9baff1;font-weight:bold;">
                                <g:radioGroup name="${('q11a_'+idx)}"
                                   value="${surveyInstance?.('q11a_'+idx)}" 
                                   labels="[g.message(code:'survey.yes'),g.message(code:'survey.no')]"
                                   values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>						
						</td>
						<td style="border: 1px solid #9baff1;">
	
							<g:datePicker name="${('q11a_'+idx+'Year')}" precision="year" value="${surveyInstance?.('q11a_'+idx+'Year')}"
	                                      years="${thisyear..birth[java.util.Calendar.YEAR]}" default="none" noSelection="${['':'--']}" /> <span id="${('q11a_'+idx+'_status')}"></span><br/>

						</td>
					</tr>
					</g:else>
					</g:each>
					</tbody>
					</table>
					
                    <ul><label for="q11d"><g:message code="survey.q11d.label" default="q11d" /></label>

					 <br/> <br/>
						 <ul>
						 <div>
						 <%--
					 		<g:radioGroup name="haveCancer"
                                  value="${surveyInstance?.haveCancer}" 
                                  labels="[g.message(code:'survey.yes'),g.message(code:'survey.no')]"
                                  values="['yes','no']" >
								<g:render template="/common/checkmark_radio" model="[it:it]"/>
							</g:radioGroup>
						  --%>	
						 	<input type="radio" id="haveCancer" name="haveCancer" value="yes" 
						 		<g:if test="${surveyInstance?.being_treated_for_cancer=='yes'}">checked="true"</g:if>
						 		<g:elseif test="${surveyInstance?.haveCancer=='yes'}">checked="true"</g:elseif> /> <g:message code="survey.yes" default="Yes" />&nbsp;&nbsp;&nbsp;
						 	<%--<input type="radio" name="haveCancer" value="no"  <g:if test="${surveyInstance?.being_treated_for_cancer=='no'}">checked="true"</g:if> /> <g:message code="survey.no" default="No" /> --%>
						 	<input type="radio" id="haveCancer" name="haveCancer" value="no" 
						 		<g:if test="${surveyInstance?.haveCancer=='no'}">checked="true"</g:if> /> <g:message code="survey.no" default="No" />
							
						</div>
						</ul>
					</ul>
								  
									  
                    
                    <div id="q12div">

                    	
                    <br/>
                    <ul><label><g:message code="survey.q12" default="q12" /></label> <span id="q12_status"></span></ul>
                    
                    <table id="tblCancerDiagnosed" class="box-table-b-wide">
	                    <thead>
	                    	<tr>
	                    	<th><g:message code="survey.q12.typeofcancer" default="Cancer type" /></th>
	                    	<th><g:message code="survey.q12.ageofdiagnosis" default="age" /></th>
	                    	<th><g:message code="survey.q12.treatment" default="treatment" /></th>
	                    	</tr>
	                    </thead>
						<%
						//def CancerList=["Bladder Cancer", "Breast Cancer", "Cervical Cancer", "Colon or rectal Cancer", "Endometrial/Uterine Cancer",
						//				"Kidney (renal cell) Cancer", "Lung Cancer", "Ovarian Cancer", "Prostate Cancer", "Other"]

						def CancerList=[message(code:"survey.q12_anal"),
										message(code:"survey.q12_bladder"),
										message(code:"survey.q12_brain"),
										message(code:"survey.q12_breast"),
										message(code:"survey.q12_carcinoma"),
										message(code:"survey.q12_cervical"),
										message(code:"survey.q12_colon"),
										message(code:"survey.q12_uterine"),
										message(code:"survey.q12_esophageal"),,
										message(code:"survey.q12_gallbladder"),
										message(code:"survey.q12_GIST"),
										message(code:"survey.q12_hodgkin"),
										message(code:"survey.q12_kidney"),
										message(code:"survey.q12_leukemia"),
										message(code:"survey.q12_liver"),
										message(code:"survey.q12_lung"),
										message(code:"survey.q12_melanoma"),
										message(code:"survey.q12_myeloma"),
										message(code:"survey.q12_non_hodgkin"),
										message(code:"survey.q12_throat"),
										message(code:"survey.q12_ovarian"),
										message(code:"survey.q12_pancreatic"),
										message(code:"survey.q12_prostate"),
										message(code:"survey.q12_other")]
						//def TreatmentList=["Radiation", "Chemotherapy", "Surgery", "None"]
						def TreatmentList=[message(code:"survey.q12_opt1"),message(code:"survey.q12_opt2"),message(code:"survey.q12_opt3"),message(code:"survey.q12_opt4")]
						 %>	                    
	                    <tbody>
	                    	<g:each in="${CancerList}" status="i" var="cancertype">
	                    	<% def idx=i+1 %>
	                    	<tr class="prop">
	                    	<td style="width: 30%;font-weight:bold;">
	                    		<g:if test="${cancertype==message(code:'survey.q12_prostate') }"><label style="color:#0000FF"></g:if><g:else><label></g:else>
	                    		<g:if test="${cancertype==message(code:'survey.q12_cervical') || cancertype==message(code:'survey.q12_uterine') || cancertype==message(code:'survey.q12_ovarian') }"><label style="color:#FF1493"></g:if><g:else><label></g:else>
	                    		${idx}. ${cancertype}
	                    		</label>
		                    	<g:if test="${cancertype==message(code:'survey.q12_other') }">
		                    		<g:textField name="q12_which_cancer" 
		                    					 value="${surveyInstance?.q12_which_cancer}" /> 
		                    	</g:if>
	                    	</td>
					<g:if test="${(surveyInstance?.sex=='female' && cancertype==message(code:'survey.q12_prostate')) || (surveyInstance?.sex=='male' && (cancertype==message(code:'survey.q12_cervical') || cancertype==message(code:'survey.q12_uterine') || cancertype==message(code:'survey.q12_ovarian'))    ) }">
							<td style="width: 5%;">
								n/a
								<div style="display:none">
								<g:textField style="width: 50px" name="${('q12_'+idx+'_ageDiagnosed')}"
	                    					 value="${surveyInstance?.('q12_'+idx+'_ageDiagnosed')}"
	                    					 onkeyup="checkIfValidNumber(this.value, -1, ageCalculated, document.getElementById(\'${('cancerAge_status'+idx)}\')); "/> <span id="${('cancerAge_status'+idx)}"></span>
								</div>
							</td>
							<td>
								n/a
								<div style="display:none">
									 <g:each in="${TreatmentList }" status="j" var="treatment">
									 <% def tidx=j+1 %>
									 		<g:checkBox name="${('q12_'+idx+'_'+tidx)}"
									 		 value="${surveyInstance?.('q12_'+idx+'_'+tidx)}" 
									 		 onclick="resetIfnone()"/> <label>${treatment }</label>&nbsp;&nbsp;&nbsp;
									 </g:each>	 								
								</div>
							</td>
               		</g:if>
               		<g:else>

	                    	<td style="width: 5%;">
	                    		<g:textField style="width: 50px" name="${('q12_'+idx+'_ageDiagnosed')}"
	                    					 value="${surveyInstance?.('q12_'+idx+'_ageDiagnosed')}"
	                    					 onkeyup="checkIfValidNumber(this.value, -1, ageCalculated, document.getElementById(\'${('cancerAge_status'+idx)}\')); "/> <span id="${('cancerAge_status'+idx)}"></span>
	                    	</td>
	                    	<td>
							 <g:each in="${TreatmentList }" status="j" var="treatment">
							 <% def tidx=j+1 %>
							 		<g:checkBox name="${('q12_'+idx+'_'+tidx)}"
							 		 value="${surveyInstance?.('q12_'+idx+'_'+tidx)}" 
							 		 onclick="resetIfnone()"/> <label>${treatment }</label>&nbsp;&nbsp;&nbsp;
							 </g:each>	                    	
	                    	</td>
	                   </g:else>
	                    	</tr>
	                    	</g:each>
                    <%
                    	def CancerList2 = ['']+CancerList
                    %>	                    	
						<tr>
							<td>25. <g:select name="q12_25" from="${CancerList2}" value="${surveyInstance?.q12_25 }" /></td>
							<td><g:textField style="width: 50px" name="q12_25_ageDiagnosed" value="${surveyInstance?.q12_25_ageDiagnosed }"
											 onkeyup="checkIfValidNumber(this.value, -1, ageCalculated, document.getElementById(\'${('cancerAge_status25')}\')); "/> <span id="${('cancerAge_status25')}"></span>
							</td>
							<td>
								 <g:each in="${TreatmentList }" status="j" var="treatment">
								 <% def tidx=j+1 %>
								 		<g:checkBox name="${('q12_25'+'_'+tidx)}"
								 		 value="${surveyInstance?.('q12_25'+'_'+tidx)}" 
								 		 onclick="resetIfnone()"/> <label>${treatment }</label>&nbsp;&nbsp;&nbsp;
								 </g:each>	 
							</td>
						</tr>

						<tr>
							<td>26. <g:select name="q12_26" from="${CancerList2}" value="${surveyInstance?.q12_26 }" /></td>
							<td><g:textField style="width: 50px" name="q12_26_ageDiagnosed" value="${surveyInstance?.q12_26_ageDiagnosed }"
											 onkeyup="checkIfValidNumber(this.value, -1, ageCalculated, document.getElementById(\'${('cancerAge_status26')}\')); "/> <span id="${('cancerAge_status26')}"></span>							</td>
							<td>
								 <g:each in="${TreatmentList }" status="j" var="treatment">
								 <% def tidx=j+1 %>
								 		<g:checkBox name="${('q12_26'+'_'+tidx)}"
								 		 value="${surveyInstance?.('q12_26'+'_'+tidx)}" 
								 		 onclick="resetIfnone()"/> <label>${treatment }</label>&nbsp;&nbsp;&nbsp;
								 </g:each>	 

							</td>
						</tr>

						<tr>
							<td>27. <g:select name="q12_27" from="${CancerList2}" value="${surveyInstance?.q12_27 }" /></td>
							<td><g:textField style="width: 50px" name="q12_27_ageDiagnosed" value="${surveyInstance?.q12_27_ageDiagnosed }"
											 onkeyup="checkIfValidNumber(this.value, -1, ageCalculated, document.getElementById(\'${('cancerAge_status27')}\')); "/> <span id="${('cancerAge_status27')}"></span>
							</td>
							<td>
								 <g:each in="${TreatmentList }" status="j" var="treatment">
								 <% def tidx=j+1 %>
								 		<g:checkBox name="${('q12_27'+'_'+tidx)}"
								 		 value="${surveyInstance?.('q12_27'+'_'+tidx)}" 
								 		 onclick="resetIfnone()"/> <label>${treatment }</label>&nbsp;&nbsp;&nbsp;
								 </g:each>	 

							</td>
						</tr>

						<tr>
							<td>28. <g:select name="q12_28" from="${CancerList2}" value="${surveyInstance?.q12_28 }" /></td>
							<td><g:textField style="width: 50px" name="q12_28_ageDiagnosed" value="${surveyInstance?.q12_28_ageDiagnosed }"
											 onkeyup="checkIfValidNumber(this.value, -1, ageCalculated, document.getElementById(\'${('cancerAge_status28')}\')); "/> <span id="${('cancerAge_status28')}"></span>
							</td>
							<td>
								 <g:each in="${TreatmentList }" status="j" var="treatment">
								 <% def tidx=j+1 %>
								 		<g:checkBox name="${('q12_28'+'_'+tidx)}"
								 		 value="${surveyInstance?.('q12_28'+'_'+tidx)}" 
								 		 onclick="resetIfnone()"/> <label>${treatment }</label>&nbsp;&nbsp;&nbsp;
								 </g:each>	 

							</td>
						</tr>

						<tr>
							<td>29. <g:select name="q12_29" from="${CancerList2}" value="${surveyInstance?.q12_29 }" /></td>
							<td><g:textField style="width: 50px" name="q12_29_ageDiagnosed" value="${surveyInstance?.q12_29_ageDiagnosed }"
											 onkeyup="checkIfValidNumber(this.value, -1, ageCalculated, document.getElementById(\'${('cancerAge_status29')}\')); "/> <span id="${('cancerAge_status29')}"></span>
							</td>
							<td>
								 <g:each in="${TreatmentList }" status="j" var="treatment">
								 <% def tidx=j+1 %>
								 		<g:checkBox name="${('q12_29'+'_'+tidx)}"
								 		 value="${surveyInstance?.('q12_29'+'_'+tidx)}" 
								 		 onclick="resetIfnone()"/> <label>${treatment }</label>&nbsp;&nbsp;&nbsp;
								 </g:each>	 

							</td>
						</tr>

	                    	
<%--	                    	
						<g:if test="${surveyInstance?.q12_25 }">
						<tr>
							<td>25. ${surveyInstance?.q12_25 }&nbsp;&nbsp;&nbsp;<input type="button" value = "Delete" class="rdelete"/></td>
							<td>${surveyInstance?.q12_25_ageDiagnosed }</td>
							<td>
								<g:if test="${surveyInstance?.q12_25_1 }">Radiology</g:if>
								<g:if test="${surveyInstance?.q12_25_2 }">Chemotherapy</g:if>
								<g:if test="${surveyInstance?.q12_25_3 }">Surgery</g:if>
								<g:if test="${surveyInstance?.q12_25_4 }">None</g:if>
							</td>
						</tr>
						</g:if>
						<g:if test="${surveyInstance?.q12_26 }">
						<tr>
							<td>26. ${surveyInstance?.q12_26 }&nbsp;&nbsp;&nbsp;<input type="button" value = "Delete" class="rdelete"/></td>
							<td>${surveyInstance?.q12_26_ageDiagnosed }</td>
							<td>
								<g:if test="${surveyInstance?.q12_26_1 }">Radiology</g:if>
								<g:if test="${surveyInstance?.q12_26_2 }">Chemotherapy</g:if>
								<g:if test="${surveyInstance?.q12_26_3 }">Surgery</g:if>
								<g:if test="${surveyInstance?.q12_26_4 }">None</g:if>
							</td>
						</tr>
						</g:if>	                    	
						<g:if test="${surveyInstance?.q12_27 }">
						<tr>
							<td>27. ${surveyInstance?.q12_27 }&nbsp;&nbsp;&nbsp;<input type="button" value = "Delete" class="rdelete"/></td>
							<td>${surveyInstance?.q12_27_ageDiagnosed }</td>
							<td>
								<g:if test="${surveyInstance?.q12_27_1 }">Radiology</g:if>
								<g:if test="${surveyInstance?.q12_27_2 }">Chemotherapy</g:if>
								<g:if test="${surveyInstance?.q12_27_3 }">Surgery</g:if>
								<g:if test="${surveyInstance?.q12_27_4 }">None</g:if>
							</td>
						</tr>
						</g:if>
						<g:if test="${surveyInstance?.q12_28 }">
						<tr>
							<td>28. ${surveyInstance?.q12_28 }&nbsp;&nbsp;&nbsp;<input type="button" value = "Delete" class="rdelete"/></td>
							<td>${surveyInstance?.q12_28_ageDiagnosed }</td>
							<td>
								<g:if test="${surveyInstance?.q12_28_1 }">Radiology</g:if>
								<g:if test="${surveyInstance?.q12_28_2 }">Chemotherapy</g:if>
								<g:if test="${surveyInstance?.q12_28_3 }">Surgery</g:if>
								<g:if test="${surveyInstance?.q12_28_4 }">None</g:if>
							</td>
						</tr>
						</g:if>
						<g:if test="${surveyInstance?.q12_29 }">
						<tr>
							<td>29. ${surveyInstance?.q12_29 }&nbsp;&nbsp;&nbsp;<input type="button" value = "Delete" class="rdelete"/></td>
							<td>${surveyInstance?.q12_29_ageDiagnosed }</td>
							<td>
								<g:if test="${surveyInstance?.q12_29_1 }">Radiology</g:if>
								<g:if test="${surveyInstance?.q12_29_2 }">Chemotherapy</g:if>
								<g:if test="${surveyInstance?.q12_29_3 }">Surgery</g:if>
								<g:if test="${surveyInstance?.q12_29_4 }">None</g:if>
							</td>
						</tr>
						</g:if>
--%>					
	                    </tbody>
                    </table>
<%--

                    <ul>
                    

	                    <input style="font-weight:bold;color:red;" type="button" value="Add New Row (up to 5)" onclick="AddNew()"><br/>
	                    <table>
	                    	<tr>
	                    		<td style="width: 30%;font-weight:bold;">Cancer Type</td>
	                    		<td style="width: 5%;font-weight:bold;">Age</td>
	                    		<td style="font-weight:bold;">Check if apply</td>
	                    		
	                    	</tr>
		                    	<tr>
		                    		<td><g:select name="txtCancerType" from="${CancerList2}" value="" /></td>
		                    		<td><g:textField style="width: 50px" name="txtAgeDiagnosed" value="" /></td>
		                    		<td>
		                    		<g:checkBox name="txtTreatment1" /> <g:message code="survey.q12_opt1" />&nbsp;&nbsp;&nbsp;
		                    		<g:checkBox name="txtTreatment2" /> <g:message code="survey.q12_opt2" />&nbsp;&nbsp;&nbsp;
		                    		<g:checkBox name="txtTreatment3" /> <g:message code="survey.q12_opt3" />&nbsp;&nbsp;&nbsp;
		                    		<g:checkBox name="txtTreatment4" /> <g:message code="survey.q12_opt4" />
		                    		</td>
		                    	</tr>
						</table>
						</ul> 
					</div>
					<ul>
 --%>
                <br/>					
					<label for="q11b"><g:message code="survey.q11b.label" default="q11b" /></label>
					<br/><br/>
					<ul><g:radioGroup name="spread_cancer"
                                  value="${surveyInstance?.spread_cancer}" 
                                  labels="[g.message(code:'survey.yes'),g.message(code:'survey.no')]"
                                  values="['yes','no']" >
								<g:render template="/common/checkmark_radio" model="[it:it]"/>
					</g:radioGroup>
					</ul>
							
					<br/><br/>
					<label for="q11c"><g:message code="survey.q11c.label" default="q11c" /></label>
					<br/><br/>
					
					<ul>

						<g:checkBox name="spread_liver" value="${surveyInstance?.spread_liver}" /> <g:message code="survey.q11c.liver" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<g:checkBox name="spread_brain" value="${surveyInstance?.spread_brain}" /> <g:message code="survey.q11c.brain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<g:checkBox name="spread_lung" value="${surveyInstance?.spread_lung}" /> <g:message code="survey.q11c.lung" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<g:checkBox name="spread_bone" value="${surveyInstance?.spread_bone}" /> <g:message code="survey.q11c.bone" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<g:checkBox name="spread_other" value="${surveyInstance?.spread_other}" onchange="if (this.checked) document.getElementById('spread_status').style.display='inline'; else document.getElementById('spread_status').style.display='none';" /> <g:message code="survey.q11c.other" />
						 <span id="spread_status">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="red"><g:message code="survey.q11c.specify" /></font> <g:textField name="spread_where" value="${surveyInstance?.spread_where}" /></span>
					
					</ul>
					<br/>
					</ul>
					
                </div>
                <div class="buttons" style="clear:left">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'button.save-finish-later.label', default: 'update')}"   onclick="DisableEnableForm(document.surveyform2,false);" /></span>
                    <span class="button"><g:actionSubmit class="back" action="step1_edit" value="${message(code: 'button.go-back.label', default: 'back')}"   onclick="DisableEnableForm(document.surveyform2,false);" /></span>
                    <%--<span class="button3"><g:render template="/common/back_button"/></span>
                    <span class="button"><input type="reset" value="${message(code: 'button.reset-all.label', default: 'reset')}"></span> --%>  
                    <span><g:actionSubmit class="next" action="update_unified" value="${message(code: 'button.save-then-go-to-next.label', default: 'next')}"   onclick="DisableEnableForm(document.surveyform2,false);" /></span>
                    
                    <span class="menuButton"><g:render template="/common/step_meter"/></span>
                 </div>
            </g:form>
        </div>
    </body>
</html>
