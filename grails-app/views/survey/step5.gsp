<%@ page import="u56survey.Survey" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'survey.label', default: 'Survey')}" />
        <title><g:message code="step5.label" default="Step5" /></title>
        
		<g:render template="errMsgsToJson-js"/>

		<g:javascript src="check_step5.js" />       

    </head>
    <body>
<g:javascript>
$(document).ready(function(){ 
   $("input[name=q22_8]").change(function() {
       var test = $(this).val();
       $("#q22_others").attr("disabled", '');
       $("#q22_others_status").html("<br/><font color='red'>(<b>"+i18nmessages.step5msg1+"</b>)</font>");
   }); 
});
		    	    
</g:javascript>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:render template="/common/step_meter"/></span>
        </div>
        <div class="body">
            <h1><g:message code="step5.label" default="Step5" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${surveyInstance}">
            <div class="errors">
                <g:renderErrors bean="${surveyInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form name="surveyform5"
            		method="post" 
            		onsubmit="return checkForm5();">
                <g:hiddenField name="id" value="${surveyInstance?.id}" />
                <g:hiddenField name="version" value="${surveyInstance?.version}" />
                <g:render template="/common/status_info" model="['dob':surveyInstance?.DOB]"/>
                <div class="dialog">
                <br/>
                <ul><label><g:message code="survey.q22" default="q22" /></label></ul>
				
                	<%
					//def ActivityList=["Running", "Walking", "Swimming", "Aerobics", "Weight lifting", "Bicycling", "Gymnastics", "Others"]
					def ActivityList=[message(code:"survey.q22.running"),
									message(code:"survey.q22.walking"),
									message(code:"survey.q22.swimming"),
									message(code:"survey.q22.aerobics"),
									message(code:"survey.q22.weightlifting"),
									message(code:"survey.q22.bicycling"),
									message(code:"survey.q22.gymnastics"),
									message(code:"survey.q22.others")]
									
					 %>
                    <table class="box-table-b">
                    	<thead>
                    	<tr>
	                    	<th><g:message code="survey.q22_activities" default="Activities" /></th>
	                    	<th><g:message code="survey.q22_frequency" default="Frequency" /></th>
                    	</tr>
                    	</thead>
                        <tbody>
                        <g:each in="${ActivityList }" status="i" var="activity">
                        <% def idx=i+1 %>
						<tr class="prop">
							<td style="width:25%;font-weight: bold;">
								${activity }
								<g:if test="${activity==message(code:'survey.q22.others') }">
									<g:textField style="width:100px" name="q22_others" value="${surveyInstance?.q22_others }" />
									<span id="q22_others_status"></span>
								</g:if>
							</td>
							<td style="width:80%;">
								<%
								def freqlist=[message(code:"survey.daily"),message(code:"survey.weekly"),message(code:"survey.monthly"),message(code:"survey.never")]
								 %>
								<g:radioGroup name="${('q22_'+idx)}"
		                            	value="${surveyInstance?.('q22_'+idx)}" 
		                                labels="${freqlist }" 
		                                values="['daily','weekly', 'monthly', 'never']" >
										<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>
							</td>
						</tr>
						</g:each>                                                                                    
                        </tbody>
                    </table>
					<br/><ul><label><g:message code="survey.q23" default="q23" /></label></ul>
					<br/>
					<table class="box-table-b">
					<thead>
						<tr>
						<th><g:message code="survey.q23.levelOfActivity" default="Level of Activity" /></th>
						<th><g:message code="survey.q23.checkMark" default="Check mark" /></th>
						</tr>
					</thead>
					<tbody>
					<%
					def activityList=[message(code:"survey.q23.act1"),
						message(code:"survey.q23.act2"),
						message(code:"survey.q23.act3"),
						message(code:"survey.q23.act4"),
						message(code:"survey.q23.act5")]
					 %>
							<g:radioGroup name="LevelOfActivity"
							value="${surveyInstance?.LevelOfActivity}"
							labels="${activityList }"
							values="['1','2','3','4','5']">
							<tr class="prop">
								<td style="width:75%;font-weight: bold;">${it.label }</td>
								<td>
									${it.radio}

								</td>
							</tr> 
							</g:radioGroup>
					</tbody>
					</table>                 
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'button.save-finish-later.label', default: 'update')}"  onclick="DisableEnableForm(document.surveyform5,false);" /></span>
                    <span class="button"><g:actionSubmit class="back" action="step4" value="${message(code: 'button.go-back.label', default: 'back')}"  onclick="DisableEnableForm(document.surveyform5,false);" /></span>
                    <%--<span class="button"><g:render template="/common/back_button"/></span>
                    <span class="button"><input type="reset" value="${message(code: 'button.reset-all.label', default: 'reset')}"></span> --%>  
                    <span class="button"><g:actionSubmit class="next" action="update_unified" value="${message(code: 'button.save-then-go-to-next.label', default: 'next')}"  onclick="DisableEnableForm(document.surveyform5,false);" /></span>
                    <span class="menuButton"><g:render template="/common/step_meter"/></span>
                 </div>
            </g:form>
        </div>
    </body>
</html>
