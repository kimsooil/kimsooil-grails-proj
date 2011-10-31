                <div class="dialog">
                    <table class="box-table-b-wide">
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name2" style="font-weight:bold;">
                                    <label for="weight"><g:message code="survey.q9" default="Weight" /></label>
                                </td>
                                <td valign="top" class="${hasErrors(bean: surveyInstance, field: 'weight', 'errors')}">
                                    <g:textField name="weight"
                                    			 value="${surveyInstance?.weight}"
                                    			 onkeyup="checkIfValidNumber(this.value, 10, 500, document.getElementById('weight_status'));" /> <g:message code="survey.pounds" default="Pounds" /> <span id="weight_status"></span>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name2" style="font-weight:bold;">
                                    <label for="height_feet">
                                    	<g:message code="survey.q10" default="Height feet" />
                                    </label>
                                </td>
                                <td valign="top" class="${hasErrors(bean: surveyInstance, field: 'height_feet', 'errors')} ${hasErrors(bean: surveyInstance, field: 'height_inches', 'errors')}">
                                    <g:textField name="height_feet" 
                                    			 value="${surveyInstance?.height_feet}"
                                    			 onkeyup="checkIfValidNumber(this.value, 0, 10, document.getElementById('height_status1'));" /> <g:message code="survey.feet" default="feet" /> <span id="height_status1"></span><br/>
                                    <g:textField name="height_inches"
                                    			 value="${surveyInstance?.height_inches}" 
                                    			 onkeyup="checkIfValidNumber(this.value, 0, 11.99, document.getElementById('height_status2'));"/> <g:message code="survey.inches" default="inches" /> <span id="height_status2"></span>
                                </td>
                            </tr>

                                                                                    
                        </tbody>
                    </table>
					<ul><label for="q11a"><g:message code="survey.q11a.label" default="q11a" /></label></ul>
					<% def InfectionsList=[message(code:"survey.hepatitis")+" ("+message(code:"survey.q11a_donotknow")+")",
										message(code:"survey.hepatitis")+" A",
										message(code:"survey.hepatitis")+" B",
										message(code:"survey.hepatitis")+" C",
										message(code:"survey.anytype_hpv"),
										message(code:"survey.AIDS_HIV"),,
										message(code:"survey.helicobacter_pylori")]
					 %>
					<table class="box-table-b-wide">
					<thead>
						<tr>
						<th style="width: 40%;border: 1px solid #9baff1;""><g:message code="survey.infection" default="Infection" /></th>
						<th style="width: 30%;border: 1px solid #9baff1;""><g:message code="survey.yesno" default="Yes / No" /></th>
						<th style="width: 30%;border: 1px solid #9baff1;""><g:message code="survey.first_infection" default="Year of first infection" />
						<br/><label style="color:orange">(<g:message code="survey.donotremember" />)</label>
						</th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${InfectionsList}" status="i" var="infectiontype">
					<% def idx=i %>
					<g:if test="${idx==0}">
					<tr>
						<td style="border: 1px solid #9baff1;font-weight:bold;">${infectiontype }</td>
						<td style="border: 1px solid #9baff1;font-weight:bold;">
						<g:checkBox name="q11a_hep_donotknow_type" value="${surveyInstance?.q11a_hep_donotknow_type}" /> (<g:message code="survey.q11a_donotknow" />)				
						</td>
						
						<td>
							<g:datePicker name="q11a_hep_donotknow_type_Year" precision="year" value="${surveyInstance?.('q11a_hep_donotknow_type_Year')}"
	                                      years="${thisyear..1900}" default="none" noSelection="${['':'--']}" /> <span id="${('q11a_hep_donotknow_type_Year_status')}"></span><br/>
						</td>
					</tr>
					</g:if>
					<g:else>
					<tr>
						<td style="border: 1px solid #9baff1;font-weight:bold;">${infectiontype }

						</td>
						<td style="border: 1px solid #9baff1;font-weight:bold;">
                                <g:radioGroup name="${('q11a_'+idx)}"
                                   value="${surveyInstance?.('q11a_'+idx)}" 
                                   labels="[g.message(code:'survey.yes'),g.message(code:'survey.no')]"
                                   values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>						
						</td>
						<td style="border: 1px solid #9baff1;">
	
							<g:datePicker name="${('q11a_'+idx+'Year')}" precision="year" value="${surveyInstance?.('q11a_'+idx+'Year')}"
	                                      years="${thisyear..1900}" default="none" noSelection="${['':'--']}" /> <span id="${('q11a_'+idx+'_status')}"></span><br/>

						</td>
					</tr>
					</g:else>
					</g:each>
					</tbody>
					</table>
					
                    <ul><label for="q11d"><g:message code="survey.q11d.label" default="q11d" /></label>

					 <br/> <br/>
						 <ul>
						 <div>
						 <%--
					 		<g:radioGroup name="haveCancer"
                                  value="${surveyInstance?.haveCancer}" 
                                  labels="[g.message(code:'survey.yes'),g.message(code:'survey.no')]"
                                  values="['yes','no']" >
								<g:render template="/common/checkmark_radio" model="[it:it]"/>
							</g:radioGroup>
						  --%>	
						 	<input type="radio" id="haveCancer" name="haveCancer" value="yes" 
						 		<g:if test="${surveyInstance?.being_treated_for_cancer=='yes'}">checked="true"</g:if>
						 		<g:elseif test="${surveyInstance?.haveCancer=='yes'}">checked="true"</g:elseif> /> <g:message code="survey.yes" default="Yes" />&nbsp;&nbsp;&nbsp;
						 	<%--<input type="radio" name="haveCancer" value="no"  <g:if test="${surveyInstance?.being_treated_for_cancer=='no'}">checked="true"</g:if> /> <g:message code="survey.no" default="No" /> --%>
						 	<input type="radio" id="haveCancer" name="haveCancer" value="no" 
						 		<g:if test="${surveyInstance?.haveCancer=='no'}">checked="true"</g:if> /> <g:message code="survey.no" default="No" />
							
						</div>
						</ul>
					</ul>
								  
									  
                    
                    <div id="q12div">

                    	
                    <br/>
                    <ul><label><g:message code="survey.q12" default="q12" /></label> <span id="q12_status"></span></ul>
                    
                    <table class="box-table-b-wide">
	                    <thead>
	                    	<tr>
	                    	<th><g:message code="survey.q12.typeofcancer" default="Cancer type" /></th>
	                    	<th><g:message code="survey.q12.ageofdiagnosis" default="age" /></th>
	                    	<th><g:message code="survey.q12.treatment" default="treatment" /></th>
	                    	</tr>
	                    </thead>
						<%
						//def CancerList=["Bladder Cancer", "Breast Cancer", "Cervical Cancer", "Colon or rectal Cancer", "Endometrial/Uterine Cancer",
						//				"Kidney (renal cell) Cancer", "Lung Cancer", "Ovarian Cancer", "Prostate Cancer", "Other"]

						def CancerList=[message(code:"survey.q12_anal"),
										message(code:"survey.q12_bladder"),
										message(code:"survey.q12_brain"),
										message(code:"survey.q12_breast"),
										message(code:"survey.q12_carcinoma"),
										message(code:"survey.q12_cervical"),
										message(code:"survey.q12_colon"),
										message(code:"survey.q12_uterine"),
										message(code:"survey.q12_esophageal"),,
										message(code:"survey.q12_gallbladder"),
										message(code:"survey.q12_GIST"),
										message(code:"survey.q12_hodgkin"),
										message(code:"survey.q12_kidney"),
										message(code:"survey.q12_leukemia"),
										message(code:"survey.q12_liver"),
										message(code:"survey.q12_lung"),
										message(code:"survey.q12_melanoma"),
										message(code:"survey.q12_myeloma"),
										message(code:"survey.q12_non_hodgkin"),
										message(code:"survey.q12_throat"),
										message(code:"survey.q12_ovarian"),
										message(code:"survey.q12_pancreatic"),
										message(code:"survey.q12_prostate"),
										message(code:"survey.q12_other")]
						//def TreatmentList=["Radiation", "Chemotherapy", "Surgery", "None"]
						def TreatmentList=[message(code:"survey.q12_opt1"),message(code:"survey.q12_opt2"),message(code:"survey.q12_opt3"),message(code:"survey.q12_opt4")]
						 %>	                    
	                    <tbody>
	                    	<g:each in="${CancerList}" status="i" var="cancertype">
	                    	<% def idx=i+1 %>
	                    	<tr class="prop">
	                    	<td style="width: 30%;font-weight:bold;">
	                    		<g:if test="${cancertype==message(code:'survey.q12_prostate') }"><label style="color:#0000FF"></g:if><g:else><label></g:else>
	                    		<g:if test="${cancertype==message(code:'survey.q12_cervical') || cancertype==message(code:'survey.q12_uterine') || cancertype==message(code:'survey.q12_ovarian') }"><label style="color:#FF1493"></g:if><g:else><label></g:else>
	                    		${idx}. ${cancertype}
	                    		</label>
		                    	<g:if test="${cancertype==message(code:'survey.q12_other') }">
		                    		<g:textField name="q12_which_cancer" 
		                    					 value="${surveyInstance?.q12_which_cancer}" /> 
		                    	</g:if>
	                    	</td>
					<g:if test="${surveyInstance?.mode!='paper' && ( (surveyInstance?.sex=='female' && cancertype==message(code:'survey.q12_prostate')) || (surveyInstance?.sex=='male' && (cancertype==message(code:'survey.q12_cervical') || cancertype==message(code:'survey.q12_uterine') || cancertype==message(code:'survey.q12_ovarian'))) ) }">
							<td style="width: 5%;">
								n/a
								<div style="display:none">
								<g:textField style="width: 50px" name="${('q12_'+idx+'_ageDiagnosed')}"
	                    					 value="${surveyInstance?.('q12_'+idx+'_ageDiagnosed')}"
	                    					 onkeyup="checkIfValidNumber(this.value, -1, ageCalculated, document.getElementById(\'${('cancerAge_status'+idx)}\')); "/> <span id="${('cancerAge_status'+idx)}"></span>
								</div>
							</td>
							<td>
								n/a
								<div style="display:none">
									 <g:each in="${TreatmentList }" status="j" var="treatment">
									 <% def tidx=j+1 %>
									 		<g:checkBox name="${('q12_'+idx+'_'+tidx)}"
									 		 value="${surveyInstance?.('q12_'+idx+'_'+tidx)}" 
									 		 onclick="resetIfnone()"/> <label>${treatment }</label>&nbsp;&nbsp;&nbsp;
									 </g:each>	 								
								</div>
							</td>
               		</g:if>
               		<g:else>

	                    	<td style="width: 5%;">
	                    		<g:textField style="width: 50px" name="${('q12_'+idx+'_ageDiagnosed')}"
	                    					 value="${surveyInstance?.('q12_'+idx+'_ageDiagnosed')}"
	                    					 onkeyup="checkIfValidNumber(this.value, -1, ageCalculated, document.getElementById(\'${('cancerAge_status'+idx)}\')); "/> <span id="${('cancerAge_status'+idx)}"></span>
	                    	</td>
	                    	<td>
							 <g:each in="${TreatmentList }" status="j" var="treatment">
							 <% def tidx=j+1 %>
							 		<g:checkBox name="${('q12_'+idx+'_'+tidx)}"
							 		 value="${surveyInstance?.('q12_'+idx+'_'+tidx)}" 
							 		 onclick="resetIfnone()"/> <label>${treatment }</label>&nbsp;&nbsp;&nbsp;
							 </g:each>	                    	
	                    	</td>
	                   </g:else>
	                    	</tr>
	                    	</g:each>
	                    </tbody>
                    </table>
					</div>
					<ul>
					<label for="q11b"><g:message code="survey.q11b.label" default="q11b" /></label>
					<br/><br/>
					<ul><g:radioGroup name="spread_cancer"
                                  value="${surveyInstance?.spread_cancer}" 
                                  labels="[g.message(code:'survey.yes'),g.message(code:'survey.no')]"
                                  values="['yes','no']" >
								<g:render template="/common/checkmark_radio" model="[it:it]"/>
					</g:radioGroup>
					</ul>
							
					<br/><br/>
					<label for="q11c"><g:message code="survey.q11c.label" default="q11c" /></label>
					<br/><br/>
					
					<ul>

						<g:checkBox name="spread_liver" value="${surveyInstance?.spread_liver}" /> <g:message code="survey.q11c.liver" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<g:checkBox name="spread_brain" value="${surveyInstance?.spread_brain}" /> <g:message code="survey.q11c.brain" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<g:checkBox name="spread_lung" value="${surveyInstance?.spread_lung}" /> <g:message code="survey.q11c.lung" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<g:checkBox name="spread_bone" value="${surveyInstance?.spread_bone}" /> <g:message code="survey.q11c.bone" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<g:checkBox name="spread_other" value="${surveyInstance?.spread_other}" onchange="if (this.checked) document.getElementById('spread_status').style.display='inline'; else document.getElementById('spread_status').style.display='none';" /> <g:message code="survey.q11c.other" />
						 <span id="spread_status">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="red"><g:message code="survey.q11c.specify" /></font> <g:textField name="spread_where" value="${surveyInstance?.spread_where}" /></span>
					
					</ul>
					<br/>
					</ul>
					
                </div>
