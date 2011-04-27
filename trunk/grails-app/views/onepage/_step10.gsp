                <div class="dialog">
					<%
					def yesno=[message(code:'survey.yes'), message(code:'survey.no')]     
					%>           
                    <table class="box-table-b-wide">
                        <tbody>
	                    <tr>
	                    	<td style="width:40%;font-weight:bold;"><label><g:message code="survey.q54" default="q54" /></label></td>
	                    	<td style="width:60%">
		                    	<g:textField name="q54" value="${surveyInstance?.q54}" />
	                    	</td>
	                    </tr>
	                    <tr>
	                    	<td style="width:40%;font-weight:bold;"><label><g:message code="survey.q55" default="q55" /></label></td>
	                    	<td style="width:60%">
		                    	<g:message code="survey.q55.every" default="every" /> <g:textField name="q55" value="${surveyInstance?.q55}" /> <g:message code="survey.q55.days" default="days" />
	                    	</td>
	                    </tr>
	                    <tr>
	                    	<td style="width:40%;font-weight:bold;"><label><g:message code="survey.q56" default="q56" /></label></td>
	                    	<td style="width:60%">
		                    	<g:textField name="q56" value="${surveyInstance?.q56}" />
	                    	</td>
	                    </tr>
	                    <tr>
	                    	<td style="width:40%;font-weight:bold;"><label><g:message code="survey.q57" default="q57" /></label></td>
	                    	<td style="width:60%">
	                        	<g:radioGroup name="q57"
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
	                        	<g:radioGroup name="q58"
	                            	value="${surveyInstance?.q58}" 
	                                labels="${yesno }"
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>
							</td>
						</tr>
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
								<br/><g:message code="survey.ifyeswhy" default="If yes, why?" /> <g:textField name="q59_why" value="${surveyInstance?.q59_why}" />&nbsp;&nbsp;&nbsp;
								<br/><g:message code="survey.atwhatage" default="At what age" /> <g:textField name="q59_whatAge" value="${surveyInstance?.q59_whatAge}" />
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
								<g:message code="survey.atwhatage" default="At what age" /> <g:textField name="q61_whatAge" value="${surveyInstance?.q61_whatAge}" />
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
		                    	<g:textField name="q64" value="${surveyInstance?.q64}" />
	                    	</td>
	                    </tr>
	                    <tr>
	                    	<td style="width:40%;font-weight:bold;"><label><g:message code="survey.q65" default="q65" /></label></td>
	                    	<td style="width:60%">
		                    	<g:textField name="q65" value="${surveyInstance?.q65}" />
	                    	</td>
	                    </tr>
	                    <tr>
	                    	<td style="width:40%;font-weight:bold;"><label><g:message code="survey.q66" default="q66" /></label></td>
	                    	<td style="width:60%">
	                        	<g:radioGroup name="q66"
	                            	value="${surveyInstance?.q66}" 
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
		                    	<g:textField name="q68" value="${surveyInstance?.q68}" /> <g:message code="survey.years" default="years" />
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
								<br/><g:message code="survey.whichone" default="Which one" /> <g:textField name="q69_which" value="${surveyInstance?.q69_which}" />&nbsp;&nbsp;&nbsp;
								<br/><g:message code="survey.forwhat" default="For what" /> <g:textField name="q69_forWhat" value="${surveyInstance?.q69_forWhat}" />&nbsp;&nbsp;&nbsp;
								<br/><g:message code="survey.atwhatageyoustarted" default="At what age you started?" /> <g:textField name="q69_whatAgeStarted" value="${surveyInstance?.q69_whatAgeStarted}" />
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
