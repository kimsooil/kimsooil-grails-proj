                <div class="dialog">
<g:if test="${flash.print}">
                <br/><h3>&nbsp;&nbsp;<g:message code="survey.ic_number" default="ICN" />: <label style="text-decoration : underline;">${surveyInstance?.consentNumSurv}</label> - 
                <g:select name="consentNumLoc"
                		  from="${surveyInstance.constraints.consentNumLoc.inList}"
                		  noSelection="['':'']" 
                		  value="" 
                		  valueMessagePrefix="survey.consentNumLoc"  /> - <g:textField  style="width: 50px;" name="consentNum" value="" /> (<g:textField style="width: 50px;" name="otherNumberOrComments" value="${surveyInstance?.otherNumberOrComments}" />)</h3><br/>
                                
</g:if>
<g:elseif test="${flash.paper}">
                <br/><h3>&nbsp;&nbsp;<g:message code="survey.ic_number" default="ICN" />: <label style="text-decoration : underline;">${surveyInstance?.consentNumSurv}</label> -

                <g:select name="consentNumLoc" 
                		  style="width: 150px;"
                		  from="${u56survey.Site.list()}"
                		  optionKey="fourletters"
                		  value="${surveyInstance?.consentNumLoc}"  /> -
                <g:textField name="consentNum" value="${surveyInstance?.consentNum ? surveyInstance?.consentNum : '---ICN---'}" 
                			style="width: 70px;color:red;"
                		    onkeyup="${remoteFunction(
                		  				action:'ajaxValidICNorNot',
                		  				update:'lblvalidICNorNot',
                		  				params:'\'icnEntered=\' + this.value' )}"/> <label id="lblvalidICNorNot"></label>
                <span id="otherNumber">(<g:textField style="width: 50px;" name="otherNumberOrComments" value="${surveyInstance?.otherNumberOrComments}" />)</span>
                </h3>
                <br/>
</g:elseif>
<g:else>                
                <br/><h3>&nbsp;&nbsp;<g:message code="survey.ic_number" default="ICN" />: <label style="color:red;">${surveyInstance?.consentNumSurv} - ${surveyInstance?.consentNumLoc} - ${surveyInstance?.consentNum} <g:if test="${surveyInstance?.otherNumberOrComments}">(${surveyInstance?.otherNumberOrComments})</g:if></label></h3><br/>
                
</g:else>        
				<br/><h3>&nbsp;&nbsp;<g:message code="survey.first_question" default="being_treated_for_cancer" /></h3>        
                <br/>
                <ul><g:radioGroup name="being_treated_for_cancer"
                                  value="${surveyInstance?.being_treated_for_cancer}" 
                                  labels="[g.message(code:'survey.yes'),g.message(code:'survey.no')]"
                                  values="['yes','no']" >
                               
				<g:render template="/common/checkmark_radio" model="[it:it]"/>
				</g:radioGroup>
				</ul>	                
                    <table class="box-table-b-wide">
                        <tbody>
                             <tr class="prop">
                                <td valign="top" class="name" style="width:20%;font-weight:bold;">
                                    <label for="sex"><g:message code="survey.q1" default="Sex" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'sex', 'errors')}">
                                <%
								def sexlbls= [message(code:"survey.q1.male"),message(code:"survey.q1.female")]
								 %>
                                    <g:radioGroup name="sex"
                                     labels="${sexlbls }" 
                                     values="['male','female']"
 									 value="${surveyInstance?.sex}" >
										<g:render template="/common/checkmark_radio" model="[it:it]" />
									</g:radioGroup>                                                                    
                                </td>
                            </tr>                       
                            <tr class="prop">
                                <td valign="top" class="name" style="font-weight:bold;">
                                	<ul>
                                    <label for="DOB"><g:message code="survey.DOB.label" default="DOB" /></label>
                                    </ul>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'DOB', 'errors')}">
                                    <g:kimsiDatePicker name="DOB" precision="day" value="${surveyInstance?.DOB}"
                                      years="${thisyear..1900}" default="none" noSelection="${['':'--']}" /> <span id="age_calculated"></span>
                                </td>
                            </tr>
                            <% def RaceList=[message(code:"survey.race.white"),
											message(code:"survey.race.black"),
											message(code:"survey.race.asian"),
											message(code:"survey.race.pacific"),
											message(code:"survey.race.native"),
											message(code:"survey.race.donotknow"),
											message(code:"survey.race.noanswer"),
											message(code:"survey.race.other")]
							 %>
                            <tr class="prop">
                                <td valign="top" class="name" style="font-weight:bold;">
									<label for="race"><g:message code="survey.q_race" default="race" /></label>                              
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'race', 'errors')}">
                                    <g:radioGroup name="race"
                                    labels="${RaceList }"
                                    values="['white', 'black', 'asian', 'pacific', 'native', 'donotknow', 'noanswer', 'other']"
                                    value="${surveyInstance?.race}">
										<g:render template="/common/checkmark_radio_v" model="[it:it]" />
										<g:if test="${it.label==message(code:'survey.race.other')}"><div class="label"><g:textField name="other_race" value="${surveyInstance?.other_race}" /></div></g:if>
										
									</g:radioGroup>                                  
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name" style="font-weight:bold;">
                                <label for="hispanic_or_latino"><g:message code="survey.q_hispanic_or_latino" default="hispanic_or_latino" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'hispanic_or_latino', 'errors')}">
                                <g:radioGroup name="hispanic_or_latino"
                                   value="${surveyInstance?.hispanic_or_latino}" 
                                   labels="[g.message(code:'survey.yes'),g.message(code:'survey.no')]"
                                   values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]" />
								</g:radioGroup>                                
                                </td>
                            </tr>                                                        

                            <tr class="prop">
                                <td valign="top" class="name" style="font-weight:bold;">
                                    <label for="addr_street1"><g:message code="survey.q2" default="q2" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'addr_street1', 'errors')}">
                                    <label style="color:red">*</label><g:message code="survey.addr_street1.label" default="Addrstreet1" />: <g:textField name="addr_street1" value="${surveyInstance?.addr_street1}" /><br/>
                                    <g:message code="survey.addr_street2.label" default="Addrstreet2" />: <g:textField name="addr_street2" value="${surveyInstance?.addr_street2}" /><br/>
                                    <label style="color:red">*</label><g:message code="survey.addr_city.label" default="Addrcity" />: <g:textField name="addr_city" value="${surveyInstance?.addr_city}" /><br/>
                                    <g:message code="survey.addr_state.label" default="Addrstate" />: <g:textField name="addr_state" value="${surveyInstance?.addr_state}" /><br/>
                                    <g:message code="survey.addr_zipcode.label" default="Addrzipcode" />: <g:textField name="addr_zipcode" value="${surveyInstance?.addr_zipcode}" onkeyup="postcode_validate(this.value, document.getElementById('status'));"/> <span id="status"></span>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name" style="font-weight:bold;">
                                    <label for="country"><g:message code="survey.q3" default="Country" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'country', 'errors')}">
									<%--<g:countrySelect name="country" value="${surveyInstance?.country}"
          								noSelection="['':'-Choose your country-']"/>
          							 --%>
          							 <g:select name="country" value="${surveyInstance?.country}"
          							 from="${countryNames}"
          							 optionKey="key"
          							 optionValue="value"
          							 onchange="isCountryValid(this.value);"
          							 noSelection="['':'-Choose your country-']"/> <span id="country_status"></span>
          							                                     
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name" style="font-weight:bold;">
                                    <label for="marital_status"><g:message code="survey.q4" default="Marital Status" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'marital_status', 'errors')}">
                                <%
								def mstatuslbls= [message(code:"survey.q4.married"),message(code:"survey.q4.single"),message(code:"survey.q4.divorce"),message(code:"survey.q4.consensual"),message(code:"survey.q4.widow")]
								 %>                                
                                    <g:radioGroup
                                     name="marital_status"
                                     labels="${mstatuslbls}"
                                     values="['married', 'single', 'divorce', 'consensual', 'Widow']"
                                     value="${surveyInstance?.marital_status}" >
										<g:render template="/common/checkmark_radio_v" model="[it:it]" />
									</g:radioGroup>                                     
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name" style="font-weight:bold;">
                                    <label for="education"><g:message code="survey.q5" default="Education" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'education', 'errors')}">
                                <%
								def edulbls=[message(code:"survey.q5.upto8"),
											message(code:"survey.q5.8to12"),
											message(code:"survey.q5.vocational"),
											message(code:"survey.q5.associate"),
											message(code:"survey.q5.bachelor"),
											message(code:"survey.q5.master"),
											message(code:"survey.q5.doctor"),
											message(code:"survey.q5.other")]
								 %>
                                    <g:radioGroup name="education"
                                    labels="${edulbls }"
                                    values="['<8', '8-12', 'vocational', 'associate', 'bachelor', 'master', 'doctor', 'other']"
                                    value="${surveyInstance?.education}">
										<g:render template="/common/checkmark_radio_v" model="[it:it]"/>
										
									</g:radioGroup>
									<%--
									<br/>
									<g:checkBox name="education_completed" value="${surveyInstance?.education_completed}"/> Completed?
									 --%>                                      
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name" style="font-weight:bold;">
                                    <label for="current_occupation"><g:message code="survey.q6" default="Currentoccupation" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'current_occupation_time', 'errors')}">
                                    <g:textField name="current_occupation" value="${surveyInstance?.current_occupation}" />&nbsp;&nbsp;&nbsp;
                                    <br/><g:message code="survey.length" default="Length" />: <g:textField name="current_occupation_time"
                                     value="${surveyInstance?.current_occupation_time}"
                                     onkeyup="checkIfValidNumber(this.value, 1, 100, document.getElementById('cjob_status'));" />
                                     <g:message code="survey.length.less.than.1yr" default="(If < 1 yrs, put 1)" /> <span id="cjob_status"></span>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name" style="font-weight:bold;">
                                    <label for="prior_job"><g:message code="survey.q7" default="Priorjob" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'prior_job_time', 'errors')}">
                                    <g:textField name="prior_job" value="${surveyInstance?.prior_job}" />&nbsp;&nbsp;&nbsp;
                                    <br/><g:message code="survey.length" default="Length" />: <g:textField name="prior_job_time"
                                     value="${surveyInstance?.prior_job_time}"
                                     onkeyup="checkIfValidNumber(this.value, 1, 100, document.getElementById('pjob_status'));" />
                                    <g:message code="survey.length.less.than.1yr" default="(If < 1 yrs, put 1)" /> <span id="pjob_status"></span>
                                </td>
                            </tr>

                                                                                    
                        </tbody>
                    </table>
                    <br/>&nbsp;&nbsp;&nbsp;<label><g:message code="survey.q8" default="q8" /></label><br/><br/>
                    <%
					def ExposureList=[message(code:"survey.q8.chemicals"),
									message(code:"survey.q8.silica"),
									message(code:"survey.q8.asbestos"),
									message(code:"survey.q8.industrialwastes"),
									message(code:"survey.q8.construction")]
					 %>
					<table class="box-table-b-wide">
						<tbody>
						<g:each in="${ExposureList }" status="i" var="exp">
						<% def idx=i+1 %>
						<tr class="prop">
							<td valign="top" class="name">
								<label for="${('q8_'+idx)}">
								<%--<g:message code="survey.${('q8_'+idx)}.label" default="${('q8_'+idx)}" /> --%>
								${exp }
								</label>
							</td>
							<td valign="top" class="value">
                                <g:radioGroup name="${('q8_'+idx)}"
                                   value="${surveyInstance?.('q8_'+idx)}" 
                                   labels="[g.message(code:'survey.q8_opt1'),g.message(code:'survey.q8_opt2')]"
                                   values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]" />
								</g:radioGroup>
								<g:if test="${exp==message(code:'survey.q8.chemicals') || exp==message(code:'survey.q8.industrialwastes') }">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<g:message code="survey.q8_which.label" default="Which ones?" /> <g:textField name="${('q8_'+idx+'_which')}" value="${surveyInstance?.('q8_'+idx+'_which')}" />
								</g:if>
							</td>
						</tr>
						</g:each>
						<tr class="prop">
							<td valign="top" class="name"><g:message code="survey.q8.others" default="q8.others" /></td>
							<td valign="top" class="value"><g:textField name="${('q8_'+'others')}" value="${surveyInstance?.('q8_'+'others')}" /></td>
						</tr>
						</tbody>
					</table>
                </div>