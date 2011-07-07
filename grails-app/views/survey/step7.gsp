<%@ page import="u56survey.Survey" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'survey.label', default: 'Survey')}" />
        <title><g:message code="step7.label" default="Step7" /></title>

		<g:render template="errMsgsToJson-js"/>

		<g:javascript src="check_step7.js" />       
	     
    </head>
    <body>
<%
	def birth=surveyInstance?.DOB ? surveyInstance?.DOB : new Date()
	//out << "dob="+birth[java.util.Calendar.YEAR]+"<br/>"
	def today=new Date() 		
	//out << "today="+today[java.util.Calendar.YEAR]+"<br/>"
%>						
    
<g:javascript>

<g:if test="${surveyInstance?.sex!='male' }">
window.onload= function(){
  DisableEnableForm(document.surveyform7,true);
  $("[name=_action_update]").attr("disabled", false);
  $("[name=_action_step6]").attr("disabled", false);
  $("[name=_action_update_unified]").attr("disabled", false);
}   
</g:if>

function IsDateRectalExamValid()
{
	if ( ($("#date_rectal_exam_year").val() == "<%=today[java.util.Calendar.YEAR]%>")  &&
		(parseInt($("#date_rectal_exam_month").val()) > <%=today[java.util.Calendar.MONTH]+1%>)
	){
		return false;
	}
	else {
		return true;
	}
}
function IsDatePSATestValid(){
	if ( ($("#date_most_recent_PSA_test_year").val() == "<%=today[java.util.Calendar.YEAR]%>")  &&
		(parseInt($("#date_most_recent_PSA_test_month").val()) > <%=today[java.util.Calendar.MONTH]+1%>) // java.util.Calendar.MONTH is 0~11
	){
		return false;
	}
	else {
		return true;
	}

}
$(document).ready(function(){ 

$.jqDialog.alert('<p align="center"><img src="${resource(dir:'images',file:'male.gif')}" align="absmiddle" alt="male" /><br/><g:message code="male.only.page" /><br/></p>');

	$("input[name='q32']").change(function(){
	    if ($("input[name='q32']:checked").val() == 'yes'){
	    	$("[name*='date_rectal_exam']").attr("disabled", '');	    	
	    	$("[name*='findings_rectal_exam']").attr("disabled", '');		    
	    }
	    else if ($("input[name='q32']:checked").val() == 'no'){
	    	$("[name*='date_rectal_exam']").val('');
	    	$("[name*='date_rectal_exam']").attr("disabled", true);	    	
	    	$("[name*='findings_rectal_exam']").val('');
	    	$("[name*='findings_rectal_exam']").attr("disabled", true);	    
	    }
	});
	$("input[name='q33']").change(function(){
	    if ($("input[name='q33']:checked").val() == 'yes'){
	    	$("[name*='date_most_recent_PSA_test']").attr("disabled", '');	    	
	    	$("[name*='results_PSA_test']").attr("disabled", '');		    
	    }
	    else if ($("input[name='q33']:checked").val() == 'no'){
	    	$("[name*='date_most_recent_PSA_test']").val('');
	    	$("[name*='date_most_recent_PSA_test']").attr("disabled", true);	    	
	    	$("[name*='results_PSA_test']").val('');
	    	$("[name*='results_PSA_test']").attr("disabled", true);	    
	    }
	});	
	$("#date_rectal_exam_month").change(function() {
			if (!IsDateRectalExamValid())
			{
				$('#alertIfInvalid1').attr('innerHTML', " <label style='color:#ff0000'>(!)</label>");
				$("#date_rectal_exam_month").focus();
			}
			else {
				$('#alertIfInvalid1').attr('innerHTML', "");
			}	
		}
	);
	$("#date_rectal_exam_year").change(function() {
			if (!IsDateRectalExamValid())
			{
				$('#alertIfInvalid1').attr('innerHTML', " <label style='color:#ff0000'>(!)</label>");
				$("#date_rectal_exam_year").focus();
			}
			else {
				$('#alertIfInvalid1').attr('innerHTML', "");
			}	
		}
	);
	$("#date_most_recent_PSA_test_month").change(function() {
			if (!IsDatePSATestValid())
			{
				$('#alertIfInvalid2').attr('innerHTML', " <label style='color:#ff0000'>(!)</label>");
				$("#date_most_recent_PSA_test_month").focus();
			}
			else {
				$('#alertIfInvalid2').attr('innerHTML', "");
			}	
		}
	);
	$("#date_most_recent_PSA_test_year").change(function() {
			if (!IsDatePSATestValid())
			{
				$('#alertIfInvalid2').attr('innerHTML', " <label style='color:#ff0000'>(!)</label>");
				$("#date_most_recent_PSA_test_year").focus();
			}
			else {
				$('#alertIfInvalid2').attr('innerHTML', "");
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
            <h1><g:message code="step7.label" default="Step7" /> </h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${surveyInstance}">
            <div class="errors">
                <g:renderErrors bean="${surveyInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form name="surveyform7"
            		method="post"
            		onsubmit="return checkForm7();" >
                <g:hiddenField name="id" value="${surveyInstance?.id}" />
                <g:hiddenField name="version" value="${surveyInstance?.version}" />
                <g:render template="/common/status_info" model="['dob':surveyInstance?.DOB]"/>
                <div class="dialog">
                <br/><ul><label><g:message code="survey.q30" default="q30" /></label></ul>

                	<%
					def ProstateProblemList=[message(code:"survey.q30.p1"),
											message(code:"survey.q30.p2"),
											message(code:"survey.q30.p3"),
											message(code:"survey.q30.p4"),
											message(code:"survey.q30.p5"),
											message(code:"survey.q30.p6")]

					def yesno=[message(code:'survey.yes'), message(code:'survey.no')]
					%>  					 
                    <table class="box-table-b-wide">
                    <thead>
                    <tr>
                    	<th style="width:50%"><g:message code="survey.problems" default="Problems" /></th>
                    	<th><g:message code="survey.yesno" default="Yes / No" /></th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${ProstateProblemList }" status="i" var="problem">
                    <% def idx=i+1 %>
                    <tr>
                    	<td style="font-weight:bold;">
                    	${problem }

                    	</td>
                    	<td>
                        	<g:radioGroup name="${('q30_'+idx)}"
                            	value="${surveyInstance?.('q30_'+idx)}" 
                                labels="${yesno }" 
                                values="['yes','no']" >
								<g:render template="/common/checkmark_radio" model="[it:it]"/>
							</g:radioGroup>
                    	</td>
                    </tr>
                    </g:each>
                    </tbody>
                    </table>
                    <br/><ul><label><g:message code="survey.q31" default="q31" /></label></ul>

                	<%
					def ProstateProblemList2=[message(code:"survey.q31.p1"),
											message(code:"survey.q31.p2"),
											message(code:"survey.q31.p3")]
					 %>
                    <table class="box-table-b-wide">
                    <thead>
                    <tr>
                    	<th style="width:50%"><g:message code="survey.prostateProblems" default="Prostate Problems" /></th>
                    	<th><g:message code="survey.yesno" default="Yes / No" /></th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${ProstateProblemList2 }" status="i" var="problem">
                    <% def idx=i+1 %>
                    <tr>
                    	<td style="font-weight:bold;">
                    	${problem }

                    	</td>
                    	<td>
                        	<g:radioGroup name="${('q31_'+idx)}"
                            	value="${surveyInstance?.('q31_'+idx)}" 
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
                    	<td style="width:30%;font-weight:bold;""><label><g:message code="survey.q32" default="q32" /></label></td>
                    	<td style="width:15%">
                        	<g:radioGroup name="q32"
                            	value="${surveyInstance?.q32}" 
                                labels="${yesno }" 
                                values="['yes','no']" >
								<g:render template="/common/checkmark_radio_v" model="[it:it]"/>
							</g:radioGroup>
						</td>
						<td align="right"><g:message code="survey.when" default="When" />:<br/>
							<g:datePicker name="date_rectal_exam" precision="month" value="${surveyInstance?.date_rectal_exam}"
                                      years="${thisyear..birth[java.util.Calendar.YEAR]}" default="none" noSelection="${['':'--']}" /> <span id="alertIfInvalid1"></span>
						</td>
						<td><g:message code="survey.findings" default="Findings" />:
						 <g:textField  style="width:150px;" name="findings_rectal_exam" value="${surveyInstance?.findings_rectal_exam}" />
                    	</td>
                    </tr>
                    <tr>
                    	<td style="font-weight:bold;"><label><g:message code="survey.q33" default="q33" /></label></td>
                    	<td>
                        	<g:radioGroup name="q33"
                            	value="${surveyInstance?.q33}" 
                                labels="${yesno }" 
                                values="['yes','no']" >
								<g:render template="/common/checkmark_radio_v" model="[it:it]"/>
							</g:radioGroup>
						</td>
						<td align="right"><g:message code="survey.mostRecentTest" default="Most recent Test" />:<br/>
						<g:datePicker name="date_most_recent_PSA_test" precision="month" value="${surveyInstance?.date_most_recent_PSA_test}"
                                      years="${thisyear..birth[java.util.Calendar.YEAR]}" default="none" noSelection="${['':'--']}" /> <span id="alertIfInvalid2"></span>
						</td>
						<td><g:message code="survey.results" default="Results" />: <g:textField style="width:150px;" 
																								name="results_PSA_test"
																								value="${surveyInstance?.results_PSA_test}" 
																								onkeyup="checkIfValidNumber(this.value, 0, 100, document.getElementById(\'q33_status\')); "/> <span id="q33_status"></span>
                    	</td>
                    </tr>
                    <tr>
                    	<td style="font-weight:bold;"><label><g:message code="survey.q34" default="q34" /></label></td>
                    	<td colspan="3">
                        	<g:radioGroup name="q34"
                            	value="${surveyInstance?.q34}" 
                                labels="${yesno }" 
                                values="['yes','no']" >
								<g:render template="/common/checkmark_radio_v" model="[it:it]"/>
							</g:radioGroup>                    	
                    	</td>
                    </tr>                                        
                    </tbody>
                    </table>                     
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'button.save-finish-later.label', default: 'update')}" /></span>
                    <span class="button"><g:actionSubmit class="back" action="step6" value="${message(code: 'button.go-back.label', default: 'back')}" /></span>
                    <%--<span class="button"><g:render template="/common/back_button"/></span>
                    <span class="button"><input type="reset" value="${message(code: 'button.reset-all.label', default: 'reset')}"></span> --%>  
                    <g:if test="${surveyInstance?.sex=='male' }">
                    	<span class="button"><g:actionSubmit class="next" action="update_unified" value="${message(code: 'button.save-then-go-to-next.label', default: 'next')}" /></span>
                    </g:if>
                    <g:else>
                    	<g:link action="step8" id="${surveyInstance?.id}"><label style="color:green"><g:message code='button.save-then-go-to-next.label'/></label></g:link>
                    </g:else>
                    
                    <span class="menuButton"><g:render template="/common/step_meter"/></span>
                 </div>
            </g:form>
        </div>
    </body>
</html>
