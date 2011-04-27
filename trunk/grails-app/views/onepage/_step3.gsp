<div class="dialog">
                	<br/><br/>
                	<ul><label for="q13"><g:message code="survey.q13.label" default="q13" /></label> 
                	<br/><br/>
                	<ul>
                	<%--
                                    <g:radioGroup name="familyHaveCancer"
                                     value="${surveyInstance?.familyHaveCancer }"
                                     labels="['Yes','No']"
                                     values="['yes','no']" >
										${it.radio} ${it.label}&nbsp;&nbsp;&nbsp;
									</g:radioGroup>
					--%>
						              <input type="radio" name="familyHaveCancer" value="yes" onClick="toggleQ13();" <g:if test="${surveyInstance?.familyHaveCancer=='yes'}">checked="true"</g:if> /> <g:message code="survey.yes" default="Yes" />&nbsp;&nbsp;&nbsp;
									  <input type="radio" name="familyHaveCancer" value="no" onClick="toggleQ13();" <g:if test="${surveyInstance?.familyHaveCancer=='no'}">checked="true"</g:if> /> <g:message code="survey.no" default="No" />
					</ul>
					</ul>
					<br/>					                	
                	<div
                	<%--
                    	<g:if test="${surveyInstance?.familyHaveCancer=='yes'}">style="display:block;"</g:if>
                    	<g:else>style="display:none;"</g:else>
                    --%> 
                    	id="q13div">                	
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
						 %>
						<g:each in="${FamilyList}" status="i" var="member">
						 <tr class="prop">
						 	<% def idx=i+1 %>
						 	<td valign="top" class="name rounded-foot-left">${idx}. ${member}
						 	<g:if test="${member==message(code:'survey.q13_others') }">
						 	<g:textField name="q13_other_family_member" value="${surveyInstance?.q13_other_family_member"} /></g:if>
						 	</td>
						 	<td valign="top" class="value rounded-foot-right ${hasErrors(bean: surveyInstance, field: 'q13_'+idx+'_cancerType', 'errors')} ${hasErrors(bean: surveyInstance, field: 'q13_'+idx+'_ageDiagnosed', 'errors')}">
						 		<g:textField name="${('q13_'+idx+'_cancerType')}" value="${surveyInstance?.('q13_'+idx+'_cancerType')}" /> / 
								<g:textField name="${('q13_'+idx+'_ageDiagnosed')}" value="${surveyInstance?.('q13_'+idx+'_ageDiagnosed')}" />
						 	</td>
						 </tr>
						 </g:each>
                        </tbody>
                    </table>
</div>
</div>
