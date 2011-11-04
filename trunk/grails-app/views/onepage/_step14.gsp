                <div class="dialog">
                <br/><ul><label><g:message code="survey.q90" default="q90" /></label></ul>
                <%
				def yesno=[message(code:'survey.yes'), message(code:'survey.no')]
				def MedicalConditionList=[message(code:'survey.q90.t1'),
										message(code:'survey.q90.t2'),
										message(code:'survey.q90.t3'),
										message(code:'survey.q90.t4'),
										message(code:'survey.q90.t5'),
										message(code:'survey.q90.t6')]

				def q91and92freqList=[message(code:'survey.q91.freq1'),message(code:'survey.q91.freq2'),message(code:'survey.q91.freq3')]
				def q91and92freqList2=[message(code:'survey.never2'),message(code:'survey.q91.freq2'),message(code:'survey.q91.freq3')]

				 %>
                    <table class="box-table-b-wide">
                        <tbody>
						<g:each in="${MedicalConditionList}" status="i" var="medcond">
						<%def idx=i+1 %>
						<tr>
							<td style="width:35%;border: 1px solid #9baff1;font-weight:bold;">${idx}. ${medcond }</td>
							<td style="width:20%;border: 1px solid #9baff1;">
								<g:radioGroup name="${('q90_'+idx)}"
	                            	value="${surveyInstance?.('q90_'+idx)}" 
	                                labels="${yesno }" 
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>
							</td>
							<td style="width:20%;border: 1px solid #9baff1;">
								<g:message code="survey.age" /> <g:textField name="${('q90_'+idx+'_age')}" 
																			 value="${surveyInstance?.('q90_'+idx+'_age')}"  style="width:90px"
																			 onkeyup="checkIfValidNumber(this.value, 1, ageCalculated, document.getElementById(\'${('q90_age_status'+idx)}\')); "/> <span id="${('q90_age_status'+idx)}"></span>
							
							</td>
							<td style="border: 1px solid #9baff1;">
								<g:message code="survey.year" /> <g:datePicker name="${('q90_'+idx+'_year')}" precision="year" value="${surveyInstance?.('q90_'+idx+'_year')}"  
                                      years="${thisyear..1900}" default="none" noSelection="${['':'--']}" />
							</td>
						</tr>
						</g:each>
						<tr>
							<td>
							 		7. <g:select name="${('q90_7_medcon')}"
							 				  value="${surveyInstance?.('q90_7_medcon')}"
							 				  from="${MedicalConditionList}"
							 				  noSelection="['':'']"/>									
							</td>
							<td>
								<g:radioGroup name="${('q90_7')}"
	                            	value="${surveyInstance?.('q90_7')}" 
	                                labels="${yesno }" 
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>							
							</td>
							<td>
								<g:message code="survey.age" /> <g:textField name="${('q90_7_age')}" 
																			 value="${surveyInstance?.('q90_7_age')}"  style="width:90px"
																			 onkeyup="checkIfValidNumber(this.value, 1, ageCalculated, document.getElementById(\'${('q90_age_status7')}\')); "/> <span id="${('q90_age_status7')}"></span>
							
							</td>
							<td>
							<g:message code="survey.year" /> <g:datePicker name="${('q90_7_year')}" precision="year" value="${surveyInstance?.('q90_7_year')}"  
                                      years="${thisyear..1900}" default="none" noSelection="${['':'--']}" />
							
							</td>
						</tr>
						<tr>
							<td>
							 		8. <g:select name="${('q90_8_medcon')}"
							 				  value="${surveyInstance?.('q90_8_medcon')}"
							 				  from="${MedicalConditionList}"
							 				  noSelection="['':'']"/>									
							</td>
							<td>
								<g:radioGroup name="${('q90_8')}"
	                            	value="${surveyInstance?.('q90_8')}" 
	                                labels="${yesno }" 
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>							
							</td>
							<td>
								<g:message code="survey.age" /> <g:textField name="${('q90_8_age')}" 
																			 value="${surveyInstance?.('q90_8_age')}"  style="width:90px"
																			 onkeyup="checkIfValidNumber(this.value, 1, ageCalculated, document.getElementById(\'${('q90_age_status8')}\')); "/> <span id="${('q90_age_status8')}"></span>
							
							</td>
							<td>
							<g:message code="survey.year" /> <g:datePicker name="${('q90_8_year')}" precision="year" value="${surveyInstance?.('q90_8_year')}"  
                                      years="${thisyear..1900}" default="none" noSelection="${['':'--']}" />
							
							</td>
						</tr>						
						<tr>
							<td>
							 		9. <g:select name="${('q90_9_medcon')}"
							 				  value="${surveyInstance?.('q90_9_medcon')}"
							 				  from="${MedicalConditionList}"
							 				  noSelection="['':'']"/>									
							</td>
							<td>
								<g:radioGroup name="${('q90_9')}"
	                            	value="${surveyInstance?.('q90_9')}" 
	                                labels="${yesno }" 
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>							
							</td>
							<td>
								<g:message code="survey.age" /> <g:textField name="${('q90_9_age')}" 
																			 value="${surveyInstance?.('q90_9_age')}"  style="width:90px"
																			 onkeyup="checkIfValidNumber(this.value, 1, ageCalculated, document.getElementById(\'${('q90_age_status9')}\')); "/> <span id="${('q90_age_status9')}"></span>
							
							</td>
							<td>
							<g:message code="survey.year" /> <g:datePicker name="${('q90_9_year')}" precision="year" value="${surveyInstance?.('q90_9_year')}"  
                                      years="${thisyear..1900}" default="none" noSelection="${['':'--']}" />
							
							</td>
						</tr>						
						<tr>
							<td>
							 		10. <g:select name="${('q90_10_medcon')}"
							 				  value="${surveyInstance?.('q90_10_medcon')}"
							 				  from="${MedicalConditionList}"
							 				  noSelection="['':'']"/>									
							</td>
							<td>
								<g:radioGroup name="${('q90_10')}"
	                            	value="${surveyInstance?.('q90_10')}" 
	                                labels="${yesno }" 
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>							
							</td>
							<td>
								<g:message code="survey.age" /> <g:textField name="${('q90_10_age')}" 
																			 value="${surveyInstance?.('q90_10_age')}"  style="width:90px"
																			 onkeyup="checkIfValidNumber(this.value, 1, ageCalculated, document.getElementById(\'${('q90_age_status10')}\')); "/> <span id="${('q90_age_status10')}"></span>
							
							</td>
							<td>
							<g:message code="survey.year" /> <g:datePicker name="${('q90_10_year')}" precision="year" value="${surveyInstance?.('q90_10_year')}"  
                                      years="${thisyear..1900}" default="none" noSelection="${['':'--']}" />
							
							</td>
						</tr>						
						<tr>
							<td>
							 		11. <g:select name="${('q90_11_medcon')}"
							 				  value="${surveyInstance?.('q90_11_medcon')}"
							 				  from="${MedicalConditionList}"
							 				  noSelection="['':'']"/>									
							</td>
							<td>
								<g:radioGroup name="${('q90_11')}"
	                            	value="${surveyInstance?.('q90_11')}" 
	                                labels="${yesno }" 
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>							
							</td>
							<td>
								<g:message code="survey.age" /> <g:textField name="${('q90_11_age')}" 
																			 value="${surveyInstance?.('q90_11_age')}"  style="width:90px"
																			 onkeyup="checkIfValidNumber(this.value, 1, ageCalculated, document.getElementById(\'${('q90_age_status11')}\')); "/> <span id="${('q90_age_status11')}"></span>
							
							</td>
							<td>
							<g:message code="survey.year" /> <g:datePicker name="${('q90_11_year')}" precision="year" value="${surveyInstance?.('q90_11_year')}"  
                                      years="${thisyear..1900}" default="none" noSelection="${['':'--']}" />
							
							</td>
						</tr>						
						
                        </tbody>
                    </table>
                    
                    <br/><ul><label><g:message code="survey.q91" default="q91" /></label></ul>
                    <%
					def WhereList=[message(code:'survey.q91.t1'),message(code:'survey.q91.t2'),message(code:'survey.q91.t3')]
					 %>
					 <table class="box-table-b-wide">
					 <thead>
					 <tr>
					 	<th style="border: 1px solid #9baff1;" colspan="2"><strong><g:message code="survey.q91.table" default="q91.table" /></strong></td>
					 </tr>
					 </thead>
					 <tbody>
					 <g:each in="${WhereList }" status="i" var="location">
					 <%def idx=i+1 %>
					 <tr>
					 	<td style="width:25%;font-weight:bold;">
					 		${idx}. ${location }
					 	</td>
					 	<td>

								<g:radioGroup name="${('q91_'+idx)}"
	                            	value="${surveyInstance?.('q91_'+idx)}" 
	                                labels="${q91and92freqList }" 
	                                values="['never','yes_in_the_past', 'yes_currently']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>
								<br/>
								<div style="clear:left;">
									<g:message code="survey.howmanyyears" /> <g:textField name="${('q91_'+idx+'_howManyYears')}"
																			value="${surveyInstance?.('q91_'+idx+'_howManyYears')}" 
																			onkeyup="checkIfValidNumber(this.value, 1, ageCalculated, document.getElementById(\'${('q91_years_status'+idx)}\')); "/> <span id="${('q91_years_status'+idx)}"></span>
								</div>
					 	</td>
					 </tr>
					 </g:each>
					 </tbody>
					 </table>
					 
					 <br/><ul>
					 	<label><font color="blue"><g:message code="survey.q91.footnote.leisure" default="q91.leisure.footnote" /></font></label>
					 	<br/><br/><br/>
					 	<label><g:message code="survey.q92" default="q92" /></label>
					 </ul>
					 <%
					 def MaterialSubstanceList=[message(code:'survey.q92.t1'),
						 message(code:'survey.q92.t2'),
						 message(code:'survey.q92.t3'),
						 message(code:'survey.q92.t4'),
						 message(code:'survey.q92.t5'),
						 message(code:'survey.q92.t6'),
						 message(code:'survey.q92.t7'),
						 message(code:'survey.q92.t8'),
						 message(code:'survey.q92.t9')]
					  %>
					  <table class="box-table-b-wide">
					  <tbody>
					  <g:each in="${MaterialSubstanceList }" status="i" var="mat">
					  <% def idx=i+1 %>
					  <tr>
					  	<td style="width:25%;font-weight:bold;">
					  		${idx}. ${mat }
					  	</td>
					  	<td>
								<g:radioGroup name="${('q92_'+idx)}"
	                            	value="${surveyInstance?.('q92_'+idx)}" 
	                                labels="${q91and92freqList }" 
	                                values="['never','yes_in_the_past', 'yes_currently']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>
								<br/>
								<div style="clear:left;">
									<g:message code="survey.howmanyyears" /> <g:textField name="${('q92_'+idx+'_howManyYears')}" 
																						  value="${surveyInstance?.('q92_'+idx+'_howManyYears')}" 
																						  onkeyup="checkIfValidNumber(this.value, 1, ageCalculated, document.getElementById(\'${('q92_years_status'+idx)}\')); "/> <span id="${('q92_years_status'+idx)}"></span>
								</div>
					  	</td>
					  </tr>
					  </g:each>
					  </tbody>
					  </table>
					  
					  <br/>
					  <ul>
					  
					  	<div>
					  		<label><g:message code="survey.q93" default="q93" /></label>
					  	</div>
					  	<br/>
					  	<ul>
					  	<div>
					  		<g:radioGroup name="q93"
	                            	value="${surveyInstance?.q93}" 
	                                labels="${yesno }"
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
							</g:radioGroup>
						</div>
						</ul>
					  </ul>
					 
					<br/><br/>
					 <ul><g:message code="survey.q93.table" default="q93.table" /></ul>
					 <%
					 def NicotineReplacementList=[message(code:'survey.q93.t1'),
						 						message(code:'survey.q93.t2'),
												message(code:'survey.q93.t3'),
												message(code:'survey.q93.t4'),
												message(code:'survey.q93.t5')]
					  %>
					  <table class="box-table-b-wide">
					  <tbody>
					  <g:each in="${NicotineReplacementList }" status="i" var="replacement">
					  <%def idx=i+1 %>
					  <tr>
					  	<td style="width:25%;font-weight:bold;">${idx}. ${replacement }</td>
					  	<td>
								<g:radioGroup name="${('q93_'+idx)}"
	                            	value="${surveyInstance?.('q93_'+idx)}" 
	                                labels="${q91and92freqList2 }" 
	                                values="['never','yes_in_the_past', 'yes_currently']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>
								<br/>
								<div style="clear:left;">
									<g:message code="survey.monthsofuse" /> <g:textField name="${('q93_'+idx+'_howManyMonths')}"
																						 value="${surveyInstance?.('q93_'+idx+'_howManyMonths')}"
																						 onkeyup="checkIfValidNumber(this.value, 1, ageCalculated, document.getElementById(\'${('q93_months_status'+idx)}\')); "/> <span id="${('q93_months_status'+idx)}"></span>
								</div>					  	
					  	</td>
					  </tr>
					  </g:each>
					  </tbody>
					  </table>
					  
					  <br/><ul><label><g:message code="survey.q94" default="q94" /></label></ul>
					  <%
					  def DrugMedicineList=[message(code:'survey.q94.t1'),
						  					message(code:'survey.q94.t2'),
											message(code:'survey.q94.t3'),
											message(code:'survey.q94.t4'),
											message(code:'survey.q94.t5'),
											message(code:'survey.q94.t6')]
					   %>
<g:javascript>
function clear_q99()
{
	$("[name*='q94_'][type=radio]").attr("checked", false);
	$("[name*='q94_'][name$='ageStart']").val('');
	$("[name*='q94_'][name$='ageStop']").val('');
	$("[name*='q94_'][name$='NumPillsPerWeek']").val('');
	$("[name*='q94_ageStart_status']").html('');
	$("[name*='q94_ageStop_status']").html('');
	$("[name*='q94_pills_status']").html('');
}
</g:javascript>					   
					   <table class="box-table-b-wide">
					   <thead>
					   <tr>
					   		<th style="border: 1px solid #9baff1;;font-weight:bold;" colspan="5">
					   		<g:message code="survey.q94.table" /><input onclick="clear_q99();" type="button" value="Clear Q99" />
					   		</th>
					   </tr>
					   <tr>
					   		<th><g:message code="survey.q94.th1" /></th>
					   		<th><g:message code="survey.q94.th2" /></th>
					   		<th><g:message code="survey.q94.th3" /></th>
					   		<th><g:message code="survey.q94.th4" /></th>
					   		<th><g:message code="survey.q94.th5" /></th>
					   </tr>
					   </thead>
					   <tbody>
					   <g:each in="${DrugMedicineList }" status="i" var="drug">
					   <%def idx=i+1 %>
					   <tr>
					   		<td style="width:30%;font-weight:bold;">${idx}. ${drug }
					   		<g:if test="${idx==5}">
					   			<g:textField style="width:100px" name="q94_otherMedName1" value="${surveyInstance?.q94_otherMedName1}" />
					   		</g:if>
					   		<g:if test="${idx==6}">
					   			<g:textField style="width:100px" name="q94_otherMedName2" value="${surveyInstance?.q94_otherMedName2}" />
					   		</g:if>
					   		</td>
					   		<td style="width:5%">
					   			<g:textField style="width:100px" 
					   				name="${('q94_'+idx+'_ageStart')}" 
					   				value="${surveyInstance?.('q94_'+idx+'_ageStart')}"
									onkeyup="checkIfValidNumber(this.value, 1, ageCalculated, document.getElementById(\'${('q94_ageStart_status'+idx)}\')); "/> <span name="${('q94_ageStart_status'+idx)}" id="${('q94_ageStart_status'+idx)}"></span>
					   		</td>
					   		<td style="width:5%">
					   			<g:textField style="width:100px" 
					   				name="${('q94_'+idx+'_NumPillsPerWeek')}" 
					   				value="${surveyInstance?.('q94_'+idx+'_NumPillsPerWeek')}"
					   				onkeyup="checkIfValidNumber(this.value, 1, 200, document.getElementById(\'${('q94_pills_status'+idx)}\')); "/> <span name="${('q94_pills_status'+idx)}" id="${('q94_pills_status'+idx)}"></span>
					   		</td>
					   		<td style="width:30%">
					   		<%
							def q94StillNoLongerList=[message(code:'survey.stillusing'),message(code:'survey.nolongerusing')] 
							 %>
					   			<g:radioGroup name="${('q94_'+idx)}"
	                            	value="${surveyInstance?.('q94_'+idx)}" 
	                                labels="${q94StillNoLongerList}" 
	                                values="['still_using','no_longer_using']" >
									<g:render template="/common/checkmark_radio_v" model="[it:it]"/>
								</g:radioGroup>
					   		</td>
					   		<td>
					   			<g:textField style="width:100px" 
					   				name="${('q94_'+idx+'_ageStop')}" 
					   				value="${surveyInstance?.('q94_'+idx+'_ageStop')}"
					   				onkeyup="checkIfValidNumber(this.value, document.getElementById('q94_${idx}_ageStart').value, ${surveyInstance?.age ? surveyInstance?.age : 100 }, document.getElementById(\'${('q94_ageStop_status'+idx)}\')); "/> <span name="${('q94_ageStop_status'+idx)}" id="${('q94_ageStop_status'+idx)}"></span>
					   		</td>
					   </tr>
					   </g:each>
					   </tbody>
					   </table>
                </div>