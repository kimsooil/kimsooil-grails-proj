                <div class="dialog">
                	<br/><br/>
                	<ul>
	                	<label for="q13"><g:message code="survey.q13.label" default="q13" /></label> 
	                	<br/><br/>
	                	<ul>
<%--	
							<input type="radio" name="familyHaveCancer" value="yes" onClick="toggleQ13();" <g:if test="${surveyInstance?.familyHaveCancer=='yes'}">checked="true"</g:if> /> <g:message code="survey.yes" default="Yes" />&nbsp;&nbsp;&nbsp;
							<input type="radio" name="familyHaveCancer" value="no" onClick="toggleQ13();" <g:if test="${surveyInstance?.familyHaveCancer=='no'}">checked="true"</g:if> /> <g:message code="survey.no" default="No" />
 --%>							
                                <g:radioGroup name="familyHaveCancer"
                                   value="${surveyInstance?.familyHaveCancer}" 
                                   labels="[g.message(code:'survey.yes'),g.message(code:'survey.no')]"
                                   values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>						

						</ul>
					</ul>
					<br/>					                	
                	<div id="q13div"> 
                	<%--
                    	<g:if test="${surveyInstance?.familyHaveCancer=='yes'}">style="display:block;"</g:if>
                    	<g:else>style="display:none;"</g:else>
                    	 id="q13div">
                    --%>
                     
                    	                	
                    <table class="box-table-b-wide">
                    	<thead>
                    		<tr>
                    		<th class="rounded-company"><g:message code="survey.q13.family" default="Family" /></th>
                    		<th class="rounded-q4"><g:message code="survey.q13.typeofcancer_and_ageofdiagnosis" default="Type of Cancer / Age of Diagnosis" /></th>
                    		</tr>
                    	</thead>

                        <tbody>
                        <%						
						def FamilyList=[message(code:"survey.q13_mother"),
										message(code:"survey.q13_father"),
										message(code:"survey.q13_sister"),
										message(code:"survey.q13_brother"),
										message(code:"survey.q13_daughter"),
										message(code:"survey.q13_son"),
										message(code:"survey.q13_maternal_grandmother"),
										message(code:"survey.q13_maternal_grandfather"),
										message(code:"survey.q13_maternal_aunt"),
										message(code:"survey.q13_maternal_uncle"),
										message(code:"survey.q13_paternal_grandmother"),
										message(code:"survey.q13_paternal_grandfather"),
										message(code:"survey.q13_paternal_aunt"),
										message(code:"survey.q13_paternal_uncle"),
										message(code:"survey.q13_others")]

						def CancerList=["anal":message(code:"survey.q12_anal"),
										"bladder":message(code:"survey.q12_bladder"),
										"brain":message(code:"survey.q12_brain"),
										"breast":message(code:"survey.q12_breast"),
										"carcinoma":message(code:"survey.q12_carcinoma"),
										"cervical":message(code:"survey.q12_cervical"),
										"colon":message(code:"survey.q12_colon"),
										"uterine":message(code:"survey.q12_uterine"),
										"esophageal":message(code:"survey.q12_esophageal"),
										"gallbladder":message(code:"survey.q12_gallbladder"),
										"GIST":message(code:"survey.q12_GIST"),
										"hodgkin":message(code:"survey.q12_hodgkin"),
										"kidney":message(code:"survey.q12_kidney"),
										"leukemia":message(code:"survey.q12_leukemia"),
										"liver":message(code:"survey.q12_liver"),
										"lung":message(code:"survey.q12_lung"),
										"melanoma":message(code:"survey.q12_melanoma"),
										"myeloma":message(code:"survey.q12_myeloma"),
										"non_hodgkin":message(code:"survey.q12_non_hodgkin"),
										"throat":message(code:"survey.q12_throat"),
										"ovarian":message(code:"survey.q12_ovarian"),
										"pancreatic":message(code:"survey.q12_pancreatic"),
										"prostate":message(code:"survey.q12_prostate"),
										"other":message(code:"survey.q12_other")]
						 %>
						<g:each in="${FamilyList}" status="i" var="member">
						 <tr class="prop">
						 	<% def idx=i+1 %>
						 	<td valign="top" class="name rounded-foot-left">${idx}. ${member}
							 	<g:if test="${member==message(code:'survey.q13_others') }">
							 		<g:textField name="q13_other_family_member" value="${surveyInstance?.q13_other_family_member}" />
							 	</g:if>
						 	</td>
						 	<td valign="top" class="value rounded-foot-right ${hasErrors(bean: surveyInstance, field: 'q13_'+idx+'_cancerType', 'errors')} ${hasErrors(bean: surveyInstance, field: 'q13_'+idx+'_ageDiagnosed', 'errors')}">
						 		<%-- <g:textField name="${('q13_'+idx+'_cancerType')}" value="${surveyInstance?.('q13_'+idx+'_cancerType')}" /> --%>
						 		<g:select name="${('q13_'+idx+'_cancerType')}"
						 				  value="${surveyInstance?.('q13_'+idx+'_cancerType')}"
						 				  from="${CancerList}"
						 				  optionKey="key"
						 				  optionValue="value"
						 				  noSelection="['':'-'+message(code:'survey.q13.typeofcancer')+'-']"/> / 
								<g:textField name="${('q13_'+idx+'_ageDiagnosed')}" 
											   value="${surveyInstance?.('q13_'+idx+'_ageDiagnosed')}"
											   onkeyup="checkIfValidNumber(this.value, 1, ageCalculated, document.getElementById(\'${('cancerAge_status'+idx)}\')); " /> <span id="${('cancerAge_status'+idx)}"></span>
						 	</td>
						 </tr>
						 </g:each>
						 <tr>
						 	<td>
							 		16. <g:select name="${('q13_16')}"
							 				  value="${surveyInstance?.('q13_16')}"
							 				  from="${FamilyList}"
							 				  noSelection="['':'']"/>						 	
						 	</td>
						 	<td>
							 		<g:select name="${('q13_16_cancerType')}"
							 				  value="${surveyInstance?.('q13_16_cancerType')}"
							 				  from="${CancerList}"
							 				  optionKey="key"
							 				  optionValue="value"
							 				  noSelection="['':'-'+message(code:'survey.q13.typeofcancer')+'-']"/>				
									/ <g:textField name="${('q13_16_ageDiagnosed')}" 
											   value="${surveyInstance?.('q13_16_ageDiagnosed')}"
											   onkeyup="checkIfValidNumber(this.value, -1, 125, document.getElementById(\'${('cancerAge_status16')}\')); " /> <span id="${('cancerAge_status16')}"></span>							 				  		 	
						 	</td>
						 </tr>
						 <tr>
						 	<td>
							 		17. <g:select name="${('q13_17')}"
							 				  value="${surveyInstance?.('q13_17')}"
							 				  from="${FamilyList}"

							 				  noSelection="['':'']"/>						 	
						 	</td>
						 	<td>
							 		<g:select name="${('q13_17_cancerType')}"
							 				  value="${surveyInstance?.('q13_17_cancerType')}"
							 				  from="${CancerList}"
							 				  optionKey="key"
							 				  optionValue="value"
							 				  noSelection="['':'-'+message(code:'survey.q13.typeofcancer')+'-']"/>		
									/ <g:textField name="${('q13_17_ageDiagnosed')}" 
											   value="${surveyInstance?.('q13_17_ageDiagnosed')}"
											   onkeyup="checkIfValidNumber(this.value, -1, 125, document.getElementById(\'${('cancerAge_status17')}\')); " /> <span id="${('cancerAge_status17')}"></span>							 				  		 	
							 				  				 	
						 	</td>
						 </tr>						 
						 <tr>
						 	<td>
							 		18. <g:select name="${('q13_18')}"
							 				  value="${surveyInstance?.('q13_18')}"
							 				  from="${FamilyList}"

							 				  noSelection="['':'']"/>						 	
						 	</td>
						 	<td>
							 		<g:select name="${('q13_18_cancerType')}"
							 				  value="${surveyInstance?.('q13_18_cancerType')}"
							 				  from="${CancerList}"
							 				  optionKey="key"
							 				  optionValue="value"
							 				  noSelection="['':'-'+message(code:'survey.q13.typeofcancer')+'-']"/>			
									/ <g:textField name="${('q13_18_ageDiagnosed')}" 
											   value="${surveyInstance?.('q13_18_ageDiagnosed')}"
											   onkeyup="checkIfValidNumber(this.value, -1, 125, document.getElementById(\'${('cancerAge_status18')}\')); " /> <span id="${('cancerAge_status18')}"></span>							 				  		 	
							 				  			 	
						 	</td>
						 </tr>						 
						 <tr>
						 	<td>
							 		19. <g:select name="${('q13_19')}"
							 				  value="${surveyInstance?.('q13_19')}"
							 				  from="${FamilyList}"

							 				  noSelection="['':'']"/>						 	
						 	</td>
						 	<td>
							 		<g:select name="${('q13_19_cancerType')}"
							 				  value="${surveyInstance?.('q13_19_cancerType')}"
							 				  from="${CancerList}"
							 				  optionKey="key"
							 				  optionValue="value"
							 				  noSelection="['':'-'+message(code:'survey.q13.typeofcancer')+'-']"/>
									/ <g:textField name="${('q13_19_ageDiagnosed')}" 
											   value="${surveyInstance?.('q13_19_ageDiagnosed')}"
											   onkeyup="checkIfValidNumber(this.value, -1, 125, document.getElementById(\'${('cancerAge_status19')}\')); " /> <span id="${('cancerAge_status19')}"></span>							 				  		 	
							 				  						 	
						 	</td>
						 </tr>						 
						 <tr>
						 	<td>
							 		20. <g:select name="${('q13_20')}"
							 				  value="${surveyInstance?.('q13_20')}"
							 				  from="${FamilyList}"

							 				  noSelection="['':'']"/>						 	
						 	</td>
						 	<td>
							 		<g:select name="${('q13_20_cancerType')}"
							 				  value="${surveyInstance?.('q13_20_cancerType')}"
							 				  from="${CancerList}"
							 				  optionKey="key"
							 				  optionValue="value"
							 				  noSelection="['':'-'+message(code:'survey.q13.typeofcancer')+'-']"/>		
									/ <g:textField name="${('q13_20_ageDiagnosed')}" 
											   value="${surveyInstance?.('q13_20_ageDiagnosed')}"
											   onkeyup="checkIfValidNumber(this.value, -1, 125, document.getElementById(\'${('cancerAge_status20')}\')); " /> <span id="${('cancerAge_status20')}"></span>							 				  		 	
							 				  				 	
						 	</td>
						 </tr>						 
						 
                        </tbody>
                    </table>
                    </div>
                </div>