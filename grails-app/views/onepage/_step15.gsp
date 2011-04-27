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
                                    <g:message code="survey.addr_zipcode.label" default="Addrzipcode" />: <g:textField name="q95_addr_zipcode" value="${surveyInstance?.q95_addr_zipcode}"  onkeyup="postcode_validate(this.value, document.getElementById('status2'));"/> <span id="status2"></span><br/>
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
