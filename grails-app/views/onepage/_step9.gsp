                <div class="dialog">
					<br/><ul><label><g:message code="survey.q45" default="q45" /></label></ul>
					<%

					def yesno=[message(code:'survey.yes'), message(code:'survey.no')]
					
					def GynecologicalProblemList=[message(code:'survey.q45.t1'),
												message(code:'survey.q45.t2'),
												message(code:'survey.q45.t3'),
												message(code:'survey.q45.t4'),
												message(code:'survey.q45.t5'),
												message(code:'survey.q45.t6'),
												message(code:'survey.q45.t7')]
					
					 %>
					<table class="box-table-b-wide">
					<thead>
					<tr>
						<th><g:message code="survey.gynecologicalProblem" default="Gynecological Problem" /></th>
						<th><g:message code="survey.yesno" default="Yes / No" /></th>
					</tr>
					</thead>
					<tbody>
					<g:each in="${GynecologicalProblemList}" status="i" var="problem">
					<% def idx=i+1 %>
					<tr>
						<td style="width:50%;font-weight:bold;">${idx}. ${problem }
						</td>
						<td>
                        	<g:radioGroup name="${('q45_'+idx)}"
                            	value="${surveyInstance?.('q45_'+idx)}" 
                                labels="${yesno }"
                                values="['yes','no']" >
								<g:render template="/common/checkmark_radio" model="[it:it]"/>
							</g:radioGroup>						
						</td>
					</tr>
					</g:each>
					</tbody>
					</table>
					   
					<br/><ul><label><g:message code="survey.q46" default="q46" /></label></ul>
					<%
					def GastrointestinalSymptomList=[message(code:'survey.q46.t1'),
												message(code:'survey.q46.t2'),
												message(code:'survey.q46.t3'),
												message(code:'survey.q46.t4'),
												message(code:'survey.q46.t5'),
												message(code:'survey.q46.t6')]

					 %>
					<table class="box-table-b-wide">
					<thead>
					<tr>
						<th><g:message code="survey.gastrointestinalSymptom" default="Gastrointestinal Symptom" /></th>
						<th><g:message code="survey.yesno" default="Yes / No" /></th>
					</tr>
					</thead>
					<tbody>
					<g:each in="${GastrointestinalSymptomList}" status="i" var="symptom">
					<% def idx=i+1 %>
					<tr>
						<td style="width:50%;font-weight:bold;">${idx}. ${symptom }
						</td>
						<td>
                        	<g:radioGroup name="${('q46_'+idx)}"
                            	value="${surveyInstance?.('q46_'+idx)}" 
                                labels="${yesno }"
                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
									
							</g:radioGroup>						
						</td>
					</tr>
					</g:each>
					<tr>
						<td><label style="font-weight:bold;"><g:message code="survey.q46.t7" default="other" /></label></td>
						<td><g:textField name="q46_7"
										 value="${surveyInstance?.q46_7}"
										 onkeyup="checkIfNumberOnly(this.value, document.getElementById(\'${('q46_7status')}\')); "/> <span id="${('q46_7status')}"></span>
						</td>
					</tr>					
					</tbody>
					</table>   

					
                    <table class="box-table-b-wide">
                        <tbody>
	                    <tr>
	                    	<td style="width:50%;font-weight:bold;"><label><g:message code="survey.q47" default="q47" /></label></td>
	                    	<td>
	                    	<%
							def q47lbls=[message(code:'survey.q47.f1'),
								message(code:'survey.q47.f2'),
								message(code:'survey.q47.f3'),
								message(code:'survey.q47.f4')]
							 %>
	                        	<g:radioGroup name="q47"
	                            	value="${surveyInstance?.q47}" 
	                                labels="${q47lbls }" 
	                                values="['every6mon', 'everyyear', 'lessthan6mon', 'never']" >
									<g:render template="/common/checkmark_radio_v" model="[it:it]"/>
								</g:radioGroup>                  	
	                    	</td>
	                    </tr> 
	                    <tr>
	                    	<td style="font-weight:bold;"><label><g:message code="survey.q48" default="q48" /></label></td>
	                    	<td>
								<g:datePicker name="q48dateLastVisitGynecologist" precision="month" value="${surveyInstance?.q48dateLastVisitGynecologist}"
                                      years="${thisyear..1900}" default="none" noSelection="${['':'--']}" />                	
	                    	</td>
	                    </tr>
	                    <tr>
	                    	<td style="font-weight:bold;"><label><g:message code="survey.q49" default="q49" /></label></td>
	                    	<td>
	                        	<g:radioGroup name="q49"
	                            	value="${surveyInstance?.q49}" 
	                                labels="${yesno }"
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>
								<br/>
								<div style="clear:left">
									<g:message code="survey.findings" default="findings" />: <g:textField name="q49_findings_pelvic_exam" 
																										  value="${surveyInstance?.q49_findings_pelvic_exam}"
																										  onkeyup="checkIfNumberOnly(this.value, document.getElementById(\'${('q49_findings_status')}\')); "/> <span id="${('q49_findings_status')}"></span>
								</div>
	                    	</td>
	                    </tr>
	                    <tr>
	                    	<td style="font-weight:bold;"><label><g:message code="survey.q50" default="q50" /></label></td>
	                    	<td>
	                        	<g:radioGroup name="q50"
	                            	value="${surveyInstance?.q50}" 
	                                labels="${yesno }"
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>
								<br/>
								<div style="clear:left">
									<g:message code="survey.findings" default="findings" />: <g:textField name="q50_findings_digital_rectal_exam"
																										  value="${surveyInstance?.q50_findings_digital_rectal_exam}"
																										  onkeyup="checkIfNumberOnly(this.value, document.getElementById(\'${('q50_findings_status')}\')); "/> <span id="${('q50_findings_status')}"></span>
								</div>
	                    	</td>
	                    </tr>	                    	                                                                                                         
                        </tbody>
                    </table>
                    <br/><ul>
                    <div>
                    	<label><g:message code="survey.q51" default="q51" /></label>
                    </div>
                    <br/>
                    <ul>
	                    <div>
			                <g:radioGroup name="q51"
			                            	value="${surveyInstance?.q51}" 
			                                labels="${yesno }"
			                                values="['yes','no']" >
											<g:render template="/common/checkmark_radio" model="[it:it]"/>
							</g:radioGroup>                   
	                    </div>
	                    <br/> <br/>
	                    <div style="clear:left;">
		                    <label>&nbsp;&nbsp;<g:message code="survey.q51.table" default="q51.table" /></label>
		                </div>
                    </ul>
                    
                    </ul>
                    <%
					def DiagnosticTestList=[message(code:'survey.q51.t1'),
											message(code:'survey.q51.t2'),
											message(code:'survey.q51.t3'),
											message(code:'survey.q51.t4'),
											message(code:'survey.q51.t5'),
											message(code:'survey.q51.t6')]
					 %>
					<table class="box-table-b-wide">
					<thead>
					<tr>
						<th><g:message code="survey.diagnosticTest" default="Diagnostic Test" /></th>
						<th><g:message code="survey.yesno" default="Yes / No" /></th>
						<th><g:message code="survey.monthYear" default="Month / Year" /></th>
						<th><g:message code="survey.results" default="Result" /> (<label style="color:red">#</label>: <g:message code="survey.numberonly" />)</th>
					</tr>
					</thead>
					<tbody>
					<g:each in="${DiagnosticTestList }" status="i" var="diagnostic">
					<% def idx=i+1 %>
                    <tr>
                    	<td style="width:20%;font-weight:bold;"><label>${idx}. ${diagnostic }</label></td>
                    	<td>
                        	<g:radioGroup name="${('q51_'+idx)}"
                            	value="${surveyInstance?.('q51_'+idx)}"  
                                labels="${yesno }"
                                values="['yes','no']" >
								<g:render template="/common/checkmark_radio_v" model="[it:it]"/>
							</g:radioGroup>
						</td>
                        <td>    
                             <g:datePicker name="${('q51date'+idx)}" precision="month" value="${surveyInstance?.('q51date'+idx)}"  
                                      years="${thisyear..1900}" default="none" noSelection="${['':'--']}" />
						</td>
						<td>
						<g:if test="${idx==1}">
						 <label style="color:red">#</label><g:textField name="${('q51_'+idx+'_result')}"
						 			  value="${surveyInstance?.('q51_'+idx+'_result')}"
						 			  onkeyup="checkIfValidNumber(this.value, 0, 1000, document.getElementById(\'${('q51_result'+idx)}\')); "/>
						 
						 </g:if>
						 <g:elseif  test="${idx==4 || idx==5 || idx==6}">
						 <g:textField name="${('q51_'+idx+'_result')}"
						 			  value="${surveyInstance?.('q51_'+idx+'_result')}" />

						 </g:elseif>						 
						 <g:else>
						 <label style="color:red">#</label><g:textField name="${('q51_'+idx+'_result')}"
						 			  value="${surveyInstance?.('q51_'+idx+'_result')}"
						 			  onkeyup="checkIfNumber(this.value, document.getElementById(\'${('q51_result'+idx)}\')); "/>
						 
						 </g:else>
						 
						 <g:if test="${idx==1}">
						 U/mL
						 </g:if>
						 <g:elseif test="${idx==2}">
						 ng/mL
						 </g:elseif>
						 <g:elseif test="${idx==3}">
						 mIU/mL
						 </g:elseif>
						  <span id="${('q51_result'+idx)}"></span>
						 

                    	</td>
                    </tr>
                    </g:each>					
					</tbody>
					</table>


                    <table class="box-table-b-wide">
                    <tbody>
                    <tr>
                    	<td style="width:30%;font-weight:bold;"><label><g:message code="survey.q52" default="q52" /></label></td>
                    	<td>
                        	<g:radioGroup name="q52"
                            	value="${surveyInstance?.q52}" 
                                labels="${yesno }" 
                                values="['yes','no']" >
								<g:render template="/common/checkmark_radio" model="[it:it]"/>
							</g:radioGroup>
							<br/>
							<div style="clear:left">
								<g:message code="survey.mostRecently" default="Most recently" />: <g:datePicker name="q52dateMostRecentPapSmear" precision="month" value="${surveyInstance?.q52dateMostRecentPapSmear}"  
                                      years="${thisyear..1900}" default="none" noSelection="${['':'--']}" />
								<br/>
                            	<g:message code="survey.results" default="results" />: <g:textField name="q52_results_pap_smear"
                            																		value="${surveyInstance?.q52_results_pap_smear}"
                            																		onkeyup="checkIfNumberOnly(this.value, document.getElementById(\'${('q52_status')}\')); "/> <span id="${('q52_status')}"></span>
                            </div>
                    	</td>
                    </tr>
                    <tr>
                    	<td style="width:30%;font-weight:bold;"><label><g:message code="survey.q53" default="q53" /></label></td>
                    	<td>
                        	<g:radioGroup name="q53"
                            	value="${surveyInstance?.q53}" 
                                labels="${yesno }"
                                values="['yes','no']" >
								<g:render template="/common/checkmark_radio" model="[it:it]"/>
							</g:radioGroup>
							<br/>
							<div style="clear:left">
							<label><g:message code="survey.q53.which" default="q53_which" /></label>: 
							<g:textField name="q53_medication_fertility"
										 value="${surveyInstance?.q53_medication_fertility}"
										 onkeyup="checkIfNumberOnly(this.value, document.getElementById(\'${('q53_which_status')}\')); "/> <span id="${('q53_which_status')}"></span>
										 &nbsp;&nbsp;&nbsp;
							<br/>
                            <label><g:message code="survey.q53.howlong" default="q53_howlong" /></label>: 
                            <g:textField name="q53_how_long_use_fertility_medication"
                            			 value="${surveyInstance?.q53_how_long_use_fertility_medication}"
                            			 onkeyup="checkIfValidNumber(this.value, 1, 360, document.getElementById(\'q53_length_status\')); "/>
                            <span id="q53_length_status"></span>
                            </div>
                    	</td>
                    </tr>                    
                    </tbody>
                    </table>
					                    
                </div>