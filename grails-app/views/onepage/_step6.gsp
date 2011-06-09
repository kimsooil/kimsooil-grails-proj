                <div class="dialog">
                    <%
						def yesno=[message(code:'survey.yes'), message(code:'survey.no')]
					%>                
                    <table class="box-table-b-wide">
                        <tbody>
                            <tr class="prop">
                                <td valign="top" style="width:60%;font-weight: bold;">
                                    <label for="q24_HowDoYouFeelRightNow"><g:message code="survey.q24" default="HowDoYouFeelRightNow" /></label>
                                </td>
                                <td valign="top" class="${hasErrors(bean: surveyInstance, field: 'q24_howDoYouFeelRightNow', 'errors')}">
                                <%
								def feelingList=[message(code:"survey.q24.calm"),
									message(code:"survey.q24.muchEnergy"),
									message(code:"survey.q24.desolation"),
									message(code:"survey.q24.sadness")]
								 %>
                                    <g:radioGroup name="q24_howDoYouFeelRightNow"
                                     value="${surveyInstance?.q24_howDoYouFeelRightNow }"
                                     labels="${feelingList }" 
                                     values="['calm','much_energy', 'desolation', 'sadness']" >
										<g:render template="/common/checkmark_radio_v" model="[it:it]"/>
									</g:radioGroup>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" style="font-weight: bold;">
                                    <label for="q25_howHaveYouFeltForPast4Weeks"><g:message code="survey.q25" default="howHaveYouFeltForPast4Weeks" /></label>
                                </td>
                                <td valign="top" class="${hasErrors(bean: surveyInstance, field: 'q25_howHaveYouFeltForPast4Weeks', 'errors')}">
                                    <g:textField name="q25_howHaveYouFeltForPast4Weeks"
												 value="${surveyInstance?.q25_howHaveYouFeltForPast4Weeks}"
												 onkeyup="checkIfNumberOnly(this.value, document.getElementById(\'${('q25_status')}\')); "/> <span id="${('q25_status')}"></span> 

                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" style="font-weight: bold;">
                                    <label for="q26"><g:message code="survey.q26" default="in the past 3 months have you had any health problem" /></label>
                                </td>
                                <td valign="top" class="${hasErrors(bean: surveyInstance, field: 'q26', 'errors')}">
                                    <g:radioGroup name="q26"
                                     value="${surveyInstance?.q26 }"
                                     labels="${yesno }" 
                                     values="['yes', 'no']" >
										<g:render template="/common/checkmark_radio" model="[it:it]"/>
									</g:radioGroup>
									<div  style="clear:left">
									<br/><g:message code="survey.q26.ifyesexplain" default="If yes, explain"/>: <g:textField name="q26_explain"
																															 value="${surveyInstance?.q26_explain}"
																															 onkeyup="checkIfNumberOnly(this.value, document.getElementById(\'${('q26_status')}\')); "/> <span id="${('q26_status')}"></span>
									</div>
                                </td>
                            </tr>                                                                                   
                            <tr class="prop">
                                <td valign="top" style="font-weight: bold;">
                                    <label for="q27"><g:message code="survey.q27" default="Does your health affect your social activities?" /></label>
                                </td>
                                <td valign="top" class="${hasErrors(bean: surveyInstance, field: 'q27', 'errors')}">
                                    <g:radioGroup name="q27"
                                     value="${surveyInstance?.q27 }"
                                     labels="${yesno }" 
                                     values="['yes', 'no']" >
										<g:render template="/common/checkmark_radio" model="[it:it]"/>
									</g:radioGroup>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" style="font-weight: bold;">
                                    <label for="q28"><g:message code="survey.q28" default="How is your health?" /></label>
                                </td>
                                <td valign="top" class="${hasErrors(bean: surveyInstance, field: 'q28', 'errors')}">
                                <%
								def healthList=[message(code:"survey.q28.excellent"),
									message(code:"survey.q28.veryGood"),
									message(code:"survey.q28.good"),
									message(code:"survey.q28.regular"),
									message(code:"survey.q28.poor")]
								 %>
                                    <g:radioGroup name="q28"
                                     value="${surveyInstance?.q28 }"
                                     labels="${healthList }" 
                                     values="['excellent', 'very_good', 'good', 'regular', 'poor']" >
										<g:render template="/common/checkmark_radio_v" model="[it:it]"/>
									</g:radioGroup>
                                </td>
                            </tr>                                                                                                                                            
                        </tbody>
                    </table>
                    <br/><ul><label><g:message code="survey.q29" default="q29" /></label></ul>
                    
                    <%
					def PsychoDiagnosisList=["Depression", 
						"Dementia", "Schizophrenia", "Attention Deficit Disorder", 
						"Maniac-Depressive Disorder", "Obsessive-Compulsive Disorder", "Other:"]
					def PsychoDiagnosisList2=[message(code:"survey.q29.1"),
						message(code:"survey.q29.2"),
						message(code:"survey.q29.3"),
						message(code:"survey.q29.4"),
						message(code:"survey.q29.5"),
						message(code:"survey.q29.6"),
						message(code:"survey.q29.7")]
					 %>
                    <table class="box-table-b-wide">
                    <thead>
                    <tr>
                    	<th><g:message code="survey.q29.diagnosis" default="Diagnosis" /></th>
                    	<th><g:message code="survey.yesno" default="Yes / No" /></th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${PsychoDiagnosisList2 }" status="i" var="diagnosis">
                    <% def idx=i+1 %>
                    <tr>
                    	<td style="width:60%;font-weight: bold;">
                    	${diagnosis }
                    	<g:if test="${diagnosis==message(code:'survey.q29.7') }">
                    		<g:textField name="q29_other" value="${surveyInstance?.q29_other}" />
                    	</g:if>
                    	</td>
                    	<td>
                        	<g:radioGroup name="${('q29_'+idx)}"
                            	value="${surveyInstance?.('q29_'+idx)}" 
                                labels="${yesno }"  
                                values="['yes','no']" >
								<g:render template="/common/checkmark_radio" model="[it:it]"/>
							</g:radioGroup>
                    	</td>
                    </tr>
                    </g:each>
                    </tbody>
                    </table>
                </div>