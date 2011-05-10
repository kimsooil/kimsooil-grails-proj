<%@ page import="u56survey.Survey" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'survey.label', default: 'Survey')}" />
        <title><g:message code="step13.label" default="Step13" /></title>

		<g:render template="errMsgsToJson-js"/>

		<g:javascript src="check_step13.js" />  
      
    </head>
    <body>
<g:javascript>
$(document).ready(function(){ 
	$("input[name='q85']").change(function(){
	    if ($("input[name='q85']:checked").val() == 'yes'){
	    	$("#whichDiet").show();
	    	$("#q85_which").attr("disabled", '');
	    }
	    else if ($("input[name='q85']:checked").val() == 'no'){
	    	$("#whichDiet").hide();
	    	$("#q85_which").val('');
	    	$("#q85_which").attr("disabled", true);
	    }
	});

	$("input[name='q87']").change(function(){
	    if ($("input[name='q87']:checked").val() == 'yes'){
	    	$("[name='q88']").attr("disabled", '');
	    	$("[name*='q89']").attr("disabled", '');
	    }
	    else if ($("input[name='q87']:checked").val() == 'no'){
	    	$("[name='q88']").attr("checked", false);
	    	$("[name='q88']").attr("disabled", true);
	    	$("[name*='q89']").attr("checked", false);
	    	$("[name*='q89']").attr("disabled", true);
	    }
	});	
}); 
</g:javascript>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
			<span class="menuButton"><g:render template="/common/step_meter"/></span>
        </div>
        <div class="body">
            <h1><g:message code="step13.label" default="Step13" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${surveyInstance}">
            <div class="errors">
                <g:renderErrors bean="${surveyInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form name="surveyform12"
            		onsubmit="return checkForm13();"
            		method="post" >
                <g:hiddenField name="id" value="${surveyInstance?.id}" />
                <g:hiddenField name="version" value="${surveyInstance?.version}" />
                <g:render template="/common/status_info"/>
                <div class="dialog">
					<%
					def yesno=[message(code:'survey.yes'), message(code:'survey.no')]
					def freqList=[message(code:'survey.daily'), message(code:'survey.weekly'),message(code:'survey.monthly'),message(code:'survey.none2')]
					%>                   
                    <br/>
                    <ul>
					<div>
						<label><g:message code="survey.q85" default="q85" /></label>
						<br/><br/>
						<ul>	
						<div>
						                    	
	                	<g:radioGroup name="q85"
	                            	value="${surveyInstance?.q85}" 
	                                labels="${yesno }" 
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>
						</div>
						<br/>
						<div id="whichDiet" style="clear:left;" >
								<g:message code="survey.whichone" default="which one" /> <g:textField name="q85_which"
																									  value="${surveyInstance?.q85_which}"
																									  onkeyup="checkIfNumberOnly(this.value, document.getElementById(\'${('q85_status')}\')); "/> <span id="${('q85_status')}"></span>
						</div>
						</ul>
   	
                    <br/>
                    </div>
                    <ul>
                    <label><g:message code="survey.q85.table" default="q85.table" /></label>
                    </ul>
                    <%
					def SaturatedFatList=[message(code:'survey.q85.f1'), 
										message(code:'survey.q85.f2'),
										message(code:'survey.q85.f3'),
										message(code:'survey.q85.f4'),
										message(code:'survey.q85.f5'),
										message(code:'survey.q85.f6'),
										message(code:'survey.q85.f7'),
										message(code:'survey.q85.f8'),
										message(code:'survey.q85.f9'),
										message(code:'survey.q85.f10'),
										message(code:'survey.q85.f11'),
										message(code:'survey.q85.f12'),
										message(code:'survey.q85.f13'),
										message(code:'survey.q85.f14')]
					def VegetableList=[message(code:'survey.q85.v1'), 
										message(code:'survey.q85.v2'),
										message(code:'survey.q85.v3'),
										message(code:'survey.q85.v4'),
										message(code:'survey.q85.v5'),
										message(code:'survey.q85.v6'),
										message(code:'survey.q85.v7'),
										message(code:'survey.q85.v8'),
										message(code:'survey.q85.v9'),
										message(code:'survey.q85.v10'),
										message(code:'survey.q85.v11'),
										message(code:'survey.q85.v12'),
										message(code:'survey.q85.v13'),
										message(code:'survey.q85.v14')]
					 %>
					 <table class="box-table-b-wide">
					 <thead>
					 <tr>
					 	<th style="width:5%"><g:message code="survey.saturatedfats" /></th>
					 	<th style="width:45%"><g:message code="survey.daily" /> / <g:message code="survey.weekly" /> / <g:message code="survey.monthly" /></th>
					 	<th style="width:5%"><g:message code="survey.vegetables" /></th>
					 	<th style="width:45%"><g:message code="survey.daily" /> / <g:message code="survey.weekly" /> / <g:message code="survey.monthly" /></th>
					 </tr>
					 </thead>
					 <tbody>
					 <%i=0 %>
					 <g:while test="${i<14}">
					 <%def idx=i+1 %>
					 <tr>
					 	<td>
					 	<%--${i+1}. --%>
					 	 ${SaturatedFatList[i]}
					 	<g:if test="${i==13 }">
					 		<g:textField name="q85_sat_fat_other" value="${surveyInstance?.q85_sat_fat_other}" style="width:75px"/>
					 	</g:if>
					 	</td>
					 	<td style="font-size: 11px;">
							<g:radioGroup name="${('q85_sat_fat_'+idx)}"
	                            	value="${surveyInstance?.('q85_sat_fat_'+idx)}" 
	                                labels="${freqList }" 
	                                values="['daily','weekly', 'monthly', 'none']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
							</g:radioGroup>					 	
					 	</td>
					 	<td>
					 	<%--${i+1}.  --%>
					 	${VegetableList[i]}
						 	<g:if test="${i==13 }">
						 		<g:textField name="q85_vege_other" value="${surveyInstance?.q85_vege_other}" style="width:75px"/>
						 	</g:if>
						
						 <g:else>&nbsp;</g:else>
					 	</td>
					 	<td style="font-size: 11px;">
					 	
							<g:radioGroup name="${('q85_vege_'+idx)}"
	                            	value="${surveyInstance?.('q85_vege_'+idx)}" 
	                                labels="${freqList }" 
	                                values="['daily','weekly', 'monthly', 'none']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
							</g:radioGroup>
						
											 	
					 	</td>
					 </tr>
					 <%i++%>
					 </g:while>
					 </tbody>
					 </table>
					 
					
					 <table class="box-table-b-wide">
					 <tbody>
					 	<tr>
	                    	<td style="width:25%;font-weight:bold;"><label><g:message code="survey.q86" default="q86" /></label></td>
	                    	<td style="width:75%">					 
	                        	<g:radioGroup name="q86"
	                            	value="${surveyInstance?.q86}" 
	                                labels="${yesno }" 
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>
							</td>
						</tr>
					 	<tr>
	                    	<td style="width:25%;font-weight:bold;"><label><g:message code="survey.q87" default="q87" /></label></td>
	                    	<td style="width:75%">					 
	                        	<g:radioGroup name="q87"
	                            	value="${surveyInstance?.q87}" 
	                                labels="${yesno }"
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>
							</td>
						</tr>
					 	<tr>
	                    	<td style="width:25%;font-weight:bold;"><label><g:message code="survey.q88" default="q88" /></label></td>
	                    	<td style="width:75%">	
	                    	<%
							def freqList2=[message(code:'survey.daily'), message(code:'survey.weekly'),message(code:'survey.sometimes')] 
							 %>				 
	                        	<g:radioGroup name="q88"
	                            	value="${surveyInstance?.q88}" 
	                                labels="${freqList2 }" 
	                                values="['daily','weekly', 'sometimes']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>
							</td>
						</tr>	
					 </tbody>
					 </table>
					<br/><ul><label><g:message code="survey.q89" default="q89" /></label></ul>
					<%
					def VitaminList=[message(code:'survey.q89.t1'),
									message(code:'survey.q89.t2'),
									message(code:'survey.q89.t3'),
									message(code:'survey.q89.t4'),
									message(code:'survey.q89.t5'),
									message(code:'survey.q89.t6'),
									message(code:'survey.q89.t7')]
					 %>
					 <table class="box-table-b-wide">
					 <thead>
					 <tr>
					 	<th><g:message code="survey.vitamins" /></th>
					 	<th><g:message code="survey.yesno" /></th>
					 </tr>
					 </thead>
					 <tbody>
					 <g:each in="${VitaminList }" status="i" var="vitamin">
					 <%def idx=i+1 %>
					 <tr>
					 	<td style="width:25%;font-weight:bold;">

					 		${idx}. ${vitamin }

					 	</td>
					 	<td style="width:75%">
	                        	<g:radioGroup name="${('q89_'+idx)}"
	                            	value="${surveyInstance?.('q89_'+idx)}" 
	                                labels="${yesno }"
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
									
								</g:radioGroup>					 	
					 	</td>
					 </tr>
					 </g:each>
					 <tr>
					 <td><g:message code="survey.q89.t8" /></td>
					 <td><g:textField name="q89_other" value="${surveyInstance?.q89_other}" /></td>
					 </tr>
					 </tbody>
					 </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'button.save-finish-later.label', default: 'update')}" /></span>
                    <span class="button"><g:actionSubmit class="back" action="step12" value="${message(code: 'button.go-back.label', default: 'back')}" /></span>
                    <%--<span class="button"><input type="reset" value="${message(code: 'button.reset-all.label', default: 'reset')}"></span> --%>  
                    <span class="button"><g:actionSubmit class="next" action="update_unified" value="${message(code: 'button.save-then-go-to-next.label', default: 'next')}" /></span>
                    <span class="menuButton"><g:render template="/common/step_meter"/></span>
                 </div>
            </g:form>
        </div>
    </body>
</html>
