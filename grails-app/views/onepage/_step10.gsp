                <div class="dialog">
					<%
					def yesno=[message(code:'survey.yes'), message(code:'survey.no')]     
					%>
					<br/>&nbsp;&nbsp;&nbsp;(<label style="color:blue">*</label>: Optional)           
                    <table class="box-table-b-wide">
                        <tbody>
	                    <tr>
	                    	<td style="width:40%;font-weight:bold;"><label><g:message code="survey.q54" default="q54" /></label></td>
	                    	<td style="width:60%">
		                    	<label style="color:blue">*</label> <g:textField name="q54"
											 value="${surveyInstance?.q54}" 
											 onkeyup="checkIfValidNumber(this.value, 1, 99, document.getElementById(\'q54_status\')); "/> <span id="q54_status"></span>
	                    	</td>
	                    </tr>
	                    <tr>
	                    	<td style="width:40%;font-weight:bold;"><label><g:message code="survey.q55" default="q55" /></label></td>
	                    	<td style="width:60%">
		                    	<label style="color:blue">*</label> <g:message code="survey.q55.every" default="every" /> 
		                    	<g:textField name="q55" 
		                    				 value="${surveyInstance?.q55}"
		                    				 onkeyup="checkIfValidNumber(this.value, 10, 365, document.getElementById(\'q55_status\')); "/>
		                    				  <g:message code="survey.q55.days" default="days" /> <span id="q55_status"></span>
	                    	</td>
	                    </tr>
	                    <tr>
	                    	<td style="width:40%;font-weight:bold;"><label><g:message code="survey.q56" default="q56" /></label></td>
	                    	<td style="width:60%">
		                    	<label style="color:blue">*</label> <g:textField name="q56"
		                    	value="${surveyInstance?.q56}" 
								onkeyup="checkIfValidNumber(this.value, 1, 365, document.getElementById(\'q56_status\')); "/> <g:message code="survey.q55.days" default="days" /> <span id="q56_status"></span>
	                    	</td>
	                    </tr>
	                    <tr>
	                    	<td style="width:40%;font-weight:bold;"><label><g:message code="survey.q57" default="q57" /></label></td>
	                    	<td style="width:60%">
	                        	<label style="color:blue">*</label> <g:radioGroup name="q57"
	                            	value="${surveyInstance?.q57}" 
	                                labels="${yesno }" 
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>
							</td>
						</tr>
	                    <tr>
	                    	<td style="width:40%;font-weight:bold;"><label><g:message code="survey.q58" default="q58" /></label></td>
	                    	<td style="width:60%">
	                        	<label style="color:blue">*</label> <g:radioGroup name="q58"
	                            	value="${surveyInstance?.q58}" 
	                                labels="${yesno }"
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>
							</td>
						</tr>
						</tbody>
						</table>
						
	                    <table class="box-table-b-wide">
                        <tbody>
	                    <tr>
	                    	<td style="width:40%;font-weight:bold;"><label><g:message code="survey.q59" default="q59" /></label></td>
	                    	<td style="width:60%">
	                        	<g:radioGroup name="q59"
	                            	value="${surveyInstance?.q59}" 
	                                labels="${yesno }"
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>
								<div style="clear:left">
								<br/><g:message code="survey.ifyeswhy" default="If yes, why?" /> <g:textField name="q59_why" 
																											  value="${surveyInstance?.q59_why}" 
																										      onkeyup="checkIfNumberOnly(this.value, document.getElementById(\'${('q59_why_status')}\')); "/> <span id="${('q59_why_status')}"></span>&nbsp;&nbsp;&nbsp;
								<br/><g:message code="survey.atwhatage" default="At what age" /> <g:textField name="q59_whatAge" 
																										      value="${surveyInstance?.q59_whatAge}" 
																										      onkeyup="checkIfValidNumber(this.value, 1, ageCalculated, document.getElementById(\'q59_whatAge_status\')); "/> <span id="q59_whatAge_status"></span>
								</div>
							</td>
						</tr>
	                    <tr>
	                    	<td style="width:40%;font-weight:bold;"><label><g:message code="survey.q60" default="q60" /></label></td>
	                    	<td style="width:60%">
	                        	<g:radioGroup name="q60"
	                            	value="${surveyInstance?.q60}" 
	                                labels="${yesno }"
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>
							</td>
						</tr>
	                    <tr>
	                    	<td style="width:40%;font-weight:bold;"><label><g:message code="survey.q61" default="q61" /></label></td>
	                    	<td style="width:60%">
	                        	<g:radioGroup name="q61"
	                            	value="${surveyInstance?.q61}" 
	                                labels="${yesno }"
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>&nbsp;&nbsp;&nbsp;
								<g:message code="survey.atwhatage" default="At what age" /> <g:textField name="q61_whatAge" 
																										 value="${surveyInstance?.q61_whatAge}"
																										 onkeyup="checkIfValidNumber(this.value, 1, ageCalculated, document.getElementById(\'q61_whatAge_status\')); "/> <span id="q61_whatAge_status"></span>
							</td>
						</tr>
	                    <tr>
	                    	<td style="width:40%;font-weight:bold;"><label><g:message code="survey.q62" default="q62" /></label></td>
	                    	<td style="width:60%">
	                        	<g:radioGroup name="q62"
	                            	value="${surveyInstance?.q62}" 
	                                labels="${yesno }"
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>
							</td>
						</tr>
	                    <tr>
	                    	<td style="width:40%;font-weight:bold;"><label><g:message code="survey.q63" default="q63" /></label></td>
	                    	<td style="width:60%">
	                        	<g:radioGroup name="q63"
	                            	value="${surveyInstance?.q63}" 
	                                labels="${yesno }"
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>
							</td>
						</tr>
	                    <tr>
	                    	<td style="width:40%;font-weight:bold;"><label><g:message code="survey.q64" default="q64" /></label></td>
	                    	<td style="width:60%">
		                    	<g:textField name="q64"
		                    				 value="${surveyInstance?.q64}"
		                    				 onkeyup="checkIfNumberOnly(this.value, document.getElementById(\'${('q64_status')}\')); "/> <span id="${('q64_status')}"></span>
	                    	</td>
	                    </tr>
	                    <tr>
	                    	<td style="width:40%;font-weight:bold;"><label><g:message code="survey.q65" default="q65" /></label></td>
	                    	<td style="width:60%">
		                    	<g:textField name="q65" value="${surveyInstance?.q65}" onkeyup="checkIfValidNumber(this.value, 1, ageCalculated, document.getElementById(\'q65_status\')); "/> <span id="q65_status"></span>
	                    	</td>
	                    </tr>
	                    <tr>
	                    	<td style="width:40%;font-weight:bold;"><label><g:message code="survey.q66" default="q66" /></label></td>
	                    	<td style="width:60%">
	                        	<g:radioGroup name="q66InMenopause"
	                            	value="${surveyInstance?.q66InMenopause}" 
	                                labels="${yesno }"
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>
							</td>
						</tr>
	                    <tr>
	                    	<td style="width:40%;font-weight:bold;"><label><g:message code="survey.q67" default="q67" /></label></td>
	                    	<td style="width:60%">
	                        	<g:radioGroup name="q67"
	                            	value="${surveyInstance?.q67}" 
	                                labels="${yesno }"
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>
							</td>
						</tr>
	                    <tr>
	                    	<td style="width:40%;font-weight:bold;"><label><g:message code="survey.q68" default="q68" /></label></td>
	                    	<td style="width:60%">
		                    	<g:textField name="q68" value="${surveyInstance?.q68}" onkeyup="checkIfValidNumber(this.value, 1, ageCalculated, document.getElementById(\'q68_status\')); "/> <g:message code="survey.years" default="years" /> <span id="q68_status"></span>
	                    	</td>
	                    </tr>
	                    <tr>
	                    	<td style="width:40%;font-weight:bold;"><label><g:message code="survey.q69" default="q69" /></label></td>
	                    	<td style="width:60%">
	                        	<g:radioGroup name="q69"
	                            	value="${surveyInstance?.q69}" 
	                                labels="${yesno }"
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>
								<div style="clear:left">
								<br/><g:message code="survey.whichone" default="Which one" /> <g:textField name="q69_which" 
																										   value="${surveyInstance?.q69_which}"
																										   onkeyup="checkIfNumberOnly(this.value, document.getElementById(\'${('q69_which_status')}\')); "/> <span id="${('q69_which_status')}"></span>&nbsp;&nbsp;&nbsp;
								<br/><g:message code="survey.forwhat" default="For what" /> <g:textField name="q69_forWhat" 
																									     value="${surveyInstance?.q69_forWhat}"
																									     onkeyup="checkIfNumberOnly(this.value, document.getElementById(\'${('q69_forWhat_status')}\')); "/> <span id="${('q69_forWhat_status')}"></span>&nbsp;&nbsp;&nbsp;
								<br/><g:message code="survey.atwhatageyoustarted" default="At what age you started?" /> <g:textField name="q69_whatAgeStarted" 
																																	 value="${surveyInstance?.q69_whatAgeStarted}" 
																																	 onkeyup="checkIfValidNumber(this.value, 1, ageCalculated, document.getElementById(\'q69_age_status\')); "/> <span id="q69_age_status"></span>
								</div>
							</td>
						</tr>
	                    <tr>
	                    	<td style="width:40%;font-weight:bold;"><label><g:message code="survey.q70" default="q70" /></label></td>
	                    	<td style="width:60%">
	                        	<g:radioGroup name="q70"
	                            	value="${surveyInstance?.q70}" 
	                                labels="${yesno }"
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>
							</td>
						</tr>
                    <tr>
                    	<td style="width:40%;font-weight:bold;"><label><g:message code="survey.q71" default="q71" /></label></td>
                    	<td style="width:60%">
	                    	
							<g:datePicker name="q71" precision="month" value="${surveyInstance?.q71}"  
                                      years="${thisyear..1900}" default="none" noSelection="${['':'--']}" />
                    	</td>
                    </tr>
                        </tbody>
                    </table>
                </div>