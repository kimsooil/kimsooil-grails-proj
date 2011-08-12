                <div class="dialog">
                    <%
						def yesno=[message(code:'survey.yes'), message(code:'survey.no')]
					%>                     
                   <br/><ul>
                   <div>
                   <label><g:message code="survey.q35" default="q35" /></label>
                   <br/><br/>
                   			<div>
                        	<g:radioGroup name="q35"
                            	value="${surveyInstance?.q35}" 
                                labels="${yesno }" 
                                values="['yes','no']" >
								<g:render template="/common/checkmark_radio" model="[it:it]"/>
							</g:radioGroup>
							</div>
					</div>
                  	</ul>
                  	<br/><br/>
					<ul><label><g:message code="survey.q36" default="q36" /></label></ul>
					<%
					def ColonCancerSymptomList=[message(code:'survey.q36.s1'),
												message(code:'survey.q36.s2'),
												message(code:'survey.q36.s3'),
												message(code:'survey.q36.s4'),
												message(code:'survey.q36.s5'),
												message(code:'survey.q36.s6')]
					 %>
					
						<table class="box-table-b-wide">
						<thead>
						<tr>
							<th><g:message code="survey.symptoms" default="Symptoms" /></th>
							<th><g:message code="survey.yesno" default="Yes / No" /></th>
						</tr>
						</thead>
						<tbody>
						<g:each in="${ColonCancerSymptomList }" status="i" var="symptom">
						<% def idx=i+1 %>
						<tr>
							<td style="width:60%;font-weight:bold">${symptom }
							</td>
							<td>
	                        	<g:radioGroup name="${('q36_'+idx)}"
	                            	value="${surveyInstance?.('q36_'+idx)}" 
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
                    	<td style="width:60%;font-weight:bold"><label><g:message code="survey.q37" default="q37" /></label></td>
                    	<td>
                        	<g:radioGroup name="q37"
                            	value="${surveyInstance?.q37}" 
                                labels="${yesno }" 
                                values="['yes','no']" >
								<g:render template="/common/checkmark_radio" model="[it:it]"/>
							</g:radioGroup>
							<br/><br/>                     	
                    	<%
						def bleedingList=[message(code:'survey.q37.donotknow'),
										 message(code:'survey.q37.b1'),
										 message(code:'survey.q37.b2')]
						 %>
                        	<g:radioGroup name="q37_what"
                            	value="${surveyInstance?.q37_what}" 
                                labels="${bleedingList }" 
                                values="['donotknow', 'red','black']" >
								<g:render template="/common/checkmark_radio_v" model="[it:it]"/>
							</g:radioGroup>                    	
                    	</td>
                    </tr>
                    <tr>
                    	<td style="font-weight:bold"><label><g:message code="survey.q38" default="q38" /></label></td>
                    	<td>
                        	<g:radioGroup name="q38"
                            	value="${surveyInstance?.q38}" 
                                labels="${yesno }" 
                                values="['yes','no']" >
								<g:render template="/common/checkmark_radio" model="[it:it]"/>
							</g:radioGroup>                    	
                    	</td>
                    </tr>
                    <tr>
                    	<td style="font-weight:bold"><label><g:message code="survey.q39" default="q39" /></label></td>
                    	<td>
                        	<g:radioGroup name="q39"
                            	value="${surveyInstance?.q39}" 
                                labels="${yesno }" 
                                values="['yes','no']" >
								<g:render template="/common/checkmark_radio" model="[it:it]"/>
							</g:radioGroup>                    	
                    	</td>
                    </tr>
                    <tr>
                    	<td style="font-weight:bold"><label><g:message code="survey.q40" default="q40" /></label></td>
                    	<td>
                    	<%
						def negpov=[message(code:'survey.negative'), message(code:'survey.positive')]
						 %>
                        	<g:radioGroup name="q40"
                            	value="${surveyInstance?.q40}" 
                                labels="${negpov }" 
                                values="['negative', 'positive']" >
								<g:render template="/common/checkmark_radio_v" model="[it:it]"/>
							</g:radioGroup>                    	
                    	</td>
                    </tr>
                    <tr>
                    	<td style="font-weight:bold"><label><g:message code="survey.q41" default="q41" /></label></td>
                    	<td>
                    	<%
						def yesnofive=[message(code:'survey.yes'), message(code:'survey.no'),message(code:'survey.fiveYearsAgo')]
						 %>
                        	<g:radioGroup name="q41"
                            	value="${surveyInstance?.q41}" 
                                labels="${yesnofive }" 
                                values="['yes','no', 'five']" >
								<g:render template="/common/checkmark_radio_v" model="[it:it]"/>
							</g:radioGroup>
							<br/>
							<div style="clear:left"><g:message code="survey.when" default="When" />: <g:datePicker name="date_digital_rectal_exam" precision="month" value="${surveyInstance?.date_digital_rectal_exam}"
                                      years="${thisyear..1900}" default="none" noSelection="${['':'--']}" />  <span id="alertIfInvalid3"></span>
                                      </div>
                            
                    	</td>
                    </tr>
                    <tr>
                    	<td style="font-weight:bold"><label><g:message code="survey.q42" default="q42" /></label></td>
                    	<td>
                        	<g:radioGroup name="q42"
                            	value="${surveyInstance?.q42}" 
                                labels="${yesno }" 
                                values="['yes','no']" >
								<g:render template="/common/checkmark_radio_v" model="[it:it]"/>
							</g:radioGroup>
							<br/>
							<div style="clear:left">
							
							<g:message code="survey.when" default="When" />: <g:datePicker name="date_sigmoidoscopy_colonoscopy" precision="month" value="${surveyInstance?.date_sigmoidoscopy_colonoscopy}"
                                      years="${thisyear..1900}" default="none" noSelection="${['':'--']}" /> <span id="alertIfInvalid4"></span>
                                      </div>
                            
                    	</td>
                    </tr>
                    </tbody>
                    </table>
                    
					<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label><g:message code="survey.q42.table" default="q42.table" /></label><br/><br/>
					<%
					def SigmoidocopyOrColonoscopyFindingsList=[message(code:'survey.q42.t1'),
												message(code:'survey.q42.t2'),
												message(code:'survey.q42.t3'),
												message(code:'survey.q42.t4'),
												message(code:'survey.q42.t5'),
												message(code:'survey.q42.t6'),
												message(code:'survey.q42.t7'),
												message(code:'survey.q42.t8')]
					
					 %>
					
						<table class="box-table-b-wide">
						<thead>
						<tr>
							<th style="width:60%"><g:message code="survey.findings" default="Findings" /></th>
							<th><g:message code="survey.yesno" default="Yes / No" /></th>
						</tr>
						</thead>
						<tbody>
						<g:each in="${SigmoidocopyOrColonoscopyFindingsList}" status="i" var="findings">
						<% def idx=i+1 %>
						<tr>
							<td style="font-weight:bold">${findings }
							</td>
							<td>
	                        	<g:radioGroup name="${('q42_'+idx)}"
	                            	value="${surveyInstance?.('q42_'+idx)}" 
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
                    	<td style="width:60%;font-weight:bold"><label><g:message code="survey.q43" default="q43" /></label></td>
                    	<td>
                        	<g:radioGroup name="q43"
                            	value="${surveyInstance?.q43}" 
                                labels="${yesno }" 
                                values="['yes', 'no']" >
								<g:render template="/common/checkmark_radio" model="[it:it]"/>
							</g:radioGroup>
							<br/>
							<div style="clear:left">
								<g:message code="survey.results" default="Results" />: <g:textField name="q43_biopsy_results" value="${surveyInstance?.q43_biopsy_results}" />
							</div>
							                    	
                    	</td>
                    </tr>
                    <tr>
                    	<td style="width:60%;font-weight:bold"><label><g:message code="survey.q44" default="q44" /></label></td>
                    	<td>
                        	<g:radioGroup name="q44"
                            	value="${surveyInstance?.q44}" 
                                labels="${yesno }" 
                                values="['yes', 'no']" >
								<g:render template="/common/checkmark_radio" model="[it:it]"/>
							</g:radioGroup>
							<br/>
							<div style="clear:left">
								<g:message code="survey.hemoglobinLevels" default="hemoglobin_levels" />: <g:textField name="q44_hemoglobin_levels" 
																													   value="${surveyInstance?.q44_hemoglobin_levels}"
																													   onkeyup="checkIfValidNumber(this.value, 7, 15, document.getElementById(\'q44_status\')); "/> <span id="q44_status"></span>
							</div>                    	
                    	</td>
                    </tr>                    
                    </tbody>
                    </table> 					
                </div>
