                <div class="dialog">
                <br/><ul><label><g:message code="survey.q30" default="q30" /></label></ul>

                	<%
					def ProstateProblemList=[message(code:"survey.q30.p1"),
											message(code:"survey.q30.p2"),
											message(code:"survey.q30.p3"),
											message(code:"survey.q30.p4"),
											message(code:"survey.q30.p5"),
											message(code:"survey.q30.p6")]

					def yesno=[message(code:'survey.yes'), message(code:'survey.no')]
					%>  					 
                    <table class="box-table-b-wide">
                    <thead>
                    <tr>
                    	<th style="width:50%"><g:message code="survey.problems" default="Problems" /></th>
                    	<th><g:message code="survey.yesno" default="Yes / No" /></th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${ProstateProblemList }" status="i" var="problem">
                    <% def idx=i+1 %>
                    <tr>
                    	<td style="font-weight:bold;">
                    	${problem }

                    	</td>
                    	<td>
                        	<g:radioGroup name="${('q30_'+idx)}"
                            	value="${surveyInstance?.('q30_'+idx)}" 
                                labels="${yesno }" 
                                values="['yes','no']" >
								<g:render template="/common/checkmark_radio" model="[it:it]"/>
							</g:radioGroup>
                    	</td>
                    </tr>
                    </g:each>
                    </tbody>
                    </table>
                    <br/><ul><label><g:message code="survey.q31" default="q31" /></label></ul>

                	<%
					def ProstateProblemList2=[message(code:"survey.q31.p1"),
											message(code:"survey.q31.p2"),
											message(code:"survey.q31.p3")]
					 %>
                    <table class="box-table-b-wide">
                    <thead>
                    <tr>
                    	<th style="width:50%"><g:message code="survey.prostateProblems" default="Prostate Problems" /></th>
                    	<th><g:message code="survey.yesno" default="Yes / No" /></th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${ProstateProblemList2 }" status="i" var="problem">
                    <% def idx=i+1 %>
                    <tr>
                    	<td style="font-weight:bold;">
                    	${problem }

                    	</td>
                    	<td>
                        	<g:radioGroup name="${('q31_'+idx)}"
                            	value="${surveyInstance?.('q31_'+idx)}" 
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
                    	<td style="width:30%;font-weight:bold;""><label><g:message code="survey.q32" default="q32" /></label></td>
                    	<td style="width:15%">
                        	<g:radioGroup name="q32"
                            	value="${surveyInstance?.q32}" 
                                labels="${yesno }" 
                                values="['yes','no']" >
								<g:render template="/common/checkmark_radio_v" model="[it:it]"/>
							</g:radioGroup>
						</td>
						<td align="right"><g:message code="survey.when" default="When" />:<br/>
							<g:datePicker name="date_rectal_exam" precision="month" value="${surveyInstance?.date_rectal_exam}"
                                      years="${thisyear..1900}" default="none" noSelection="${['':'--']}" />
						</td>
						<td><g:message code="survey.findings" default="Findings" />:
						 <g:textField  style="width:150px;" name="findings_rectal_exam" value="${surveyInstance?.findings_rectal_exam}" />
                    	</td>
                    </tr>
                    <tr>
                    	<td style="font-weight:bold;"><label><g:message code="survey.q33" default="q33" /></label></td>
                    	<td>
                        	<g:radioGroup name="q33"
                            	value="${surveyInstance?.q33}" 
                                labels="${yesno }" 
                                values="['yes','no']" >
								<g:render template="/common/checkmark_radio_v" model="[it:it]"/>
							</g:radioGroup>
						</td>
						<td align="right"><g:message code="survey.mostRecentTest" default="Most recent Test" />:<br/>
						<g:datePicker name="date_most_recent_PSA_test" precision="month" value="${surveyInstance?.date_most_recent_PSA_test}"
                                      years="${thisyear..1900}" default="none" noSelection="${['':'--']}" />
						</td>
						<td><g:message code="survey.results" default="Results" />: <g:textField style="width:150px;" name="results_PSA_test" value="${surveyInstance?.results_PSA_test}" />
                    	</td>
                    </tr>
                    <tr>
                    	<td style="font-weight:bold;"><label><g:message code="survey.q34" default="q34" /></label></td>
                    	<td colspan="3">
                        	<g:radioGroup name="q34"
                            	value="${surveyInstance?.q34}" 
                                labels="${yesno }" 
                                values="['yes','no']" >
								<g:render template="/common/checkmark_radio_v" model="[it:it]"/>
							</g:radioGroup>                    	
                    	</td>
                    </tr>                                        
                    </tbody>
                    </table>                     
                </div>
