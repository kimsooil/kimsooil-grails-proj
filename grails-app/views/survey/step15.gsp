<%@ page import="u56survey.Survey" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'survey.label', default: 'Survey')}" />
        <title><g:message code="step15.label" default="Step15" /></title>

		<jv:generateValidation domain="survey" form="surveyform15"  display="list" container="errors"/>      

<g:javascript>
var i18nmessages={};

function updateConfigurationMap(newConfigurationMap) {
	for(key in newConfigurationMap){
		i18nmessages[key] = newConfigurationMap[key];
	}

	//or in jQuery way
//	jQuery.each(newConfiguration, function(key, val) {
//		i18nmessages[key] = val
//	});

}
updateConfigurationMap({

   step15Err1 : "${message(code:'step15.err.msgs1').encodeAsHTML()}"

 }); 
function checkForm15()
{
	// instantiate object
	fv = new formValidator();
	
//	String q95_doctor_name, q95_doctor_telephone, q95_doctor_other_info
//	String q95_addr_street1,q95_addr_street2, q95_addr_city, q95_addr_state, q95_addr_zipcode, q95_country	
/*
	if (fv.isEmpty($('#q95_doctor_name').val())){
		fv.raiseError("Q100: Enter name (Doctor).");
	}
	if (fv.isEmpty($('#q95_doctor_telephone').val())){
		fv.raiseError("Q100: Enter telephone number (Doctor).");
	}
	if (fv.isEmpty($('#q95_addr_street1').val())){
		fv.raiseError("Q100: Enter street (Doctor).");
	}
	if (fv.isEmpty($('#q95_addr_city').val())){
		fv.raiseError("Q100: Enter city (Doctor).");
	}
	if (fv.isEmpty($('#q95_addr_state').val())){
		fv.raiseError("Q100: Enter state (Doctor).");
	}

	if (!fv.isValidZipcode($('#q95_addr_zipcode').val())){
		fv.raiseError(i18nmessages.step15Err1);
	}
	
	if (fv.isEmpty($('#q95_country').val())){
		fv.raiseError("Q100: Choose country");
	}
*/	
	// all done
	// if errors, display, else proceed
	if (fv.numErrors() > 0)
	{
		fv.displayErrors();
	
		return false;
	}
	else
	{
		return true;
	}	
}
</g:javascript>
		  
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:render template="/common/step_meter"/></span>
        </div>
        <div class="body">
            <h1><g:message code="step15.label" default="Step15" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
<div id="errors" class="errors" style="display:none;">
</div>
            <g:form name="surveyform15"
					onsubmit="return checkForm15();"
            		method="post" >
                <g:hiddenField name="id" value="${surveyInstance?.id}" />
                <g:hiddenField name="version" value="${surveyInstance?.version}" />
                <g:render template="/common/status_info"  model="['dob':surveyInstance?.DOB]"/>
                <div class="dialog">
                <br/><label>&nbsp;&nbsp;<g:message code="survey.q95" default="q95" /></label><br/><br/>
                    <table class="box-table-b-wide">
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q95_doctor_name"><g:message code="survey.doctor.name.label" default="Name of Your doctor" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q95_doctor_name', 'errors')}">
                                    <g:textField name="q95_doctor_name" value="${surveyInstance?.q95_doctor_name}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q95_doctor_telephone"><g:message code="survey.doctor.telephone.label" default="Telephone Number of Your doctor" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q95_doctor_telephone', 'errors')}">
                                    <g:textField name="q95_doctor_telephone" value="${surveyInstance?.q95_doctor_telephone}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q95_doctor_other_info"><g:message code="survey.doctor.other.info.label" default="Other info (email, fax, etc.)" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q95_doctor_other_info', 'errors')}">
                                    <g:textField name="q95_doctor_other_info" value="${surveyInstance?.q95_doctor_other_info}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label><g:message code="survey.q95.address" default="q2" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'addr_street1', 'errors')}">
                                    <g:message code="survey.addr_street1.label" default="Addrstreet1" />: <g:textField name="q95_addr_street1" value="${surveyInstance?.q95_addr_street1}" />
                                    <g:message code="survey.addr_street2.label" default="Addrstreet2" />: <g:textField name="q95_addr_street2" value="${surveyInstance?.q95_addr_street2}" /><br/>
                                    <g:message code="survey.addr_city.label" default="Addrcity" />: <g:textField name="q95_addr_city" value="${surveyInstance?.q95_addr_city}" /><br/>
                                    <g:message code="survey.addr_state.label" default="Addrstate" />: <g:textField name="q95_addr_state" value="${surveyInstance?.q95_addr_state}" /><br/>
                                    <g:message code="survey.addr_zipcode.label" default="Addrzipcode" />: <g:textField name="q95_addr_zipcode" value="${surveyInstance?.q95_addr_zipcode}" onkeyup="postcode_validate(this.value, document.getElementById('status'));"/> <span id="status"></span><br/>
									<g:message code="survey.country" default="Country" />
          							 <g:select name="q95_country" value="${surveyInstance?.q95_country}"
          							 from="${countryNames}"
          							 optionKey="key"
          							 optionValue="value"
          							 noSelection="['':'']"/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'button.save-finish-later.label', default: 'update')}" /></span>
                    <span class="button"><g:render template="/common/back_button"/></span>
                    <%--<span class="button"><g:actionSubmit class="back" action="step14" value="${message(code: 'button.go-back.label', default: 'back')}" /></span>
                    <span class="button"><input type="reset" value="${message(code: 'button.reset-all.label', default: 'reset')}"></span> --%>  
                    <%--<span class="button"><g:actionSubmit class="done" action="verify_after_update" value="${message(code: 'verify', default: 'Verify')}" /></span> --%>  
                    <span class="button"><g:link action="preview" id="${surveyInstance?.id }" ><label style="color:red"><g:message code="verify" default="verify" /></label></g:link></span>
                    <span class="menuButton"><g:render template="/common/step_meter"/></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
