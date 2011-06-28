                <div class="dialog">
                	<br/>
                	<ul><label><g:message code="survey.q14" default="q14" /></label></ul>
                	
                	<%
						//def AlcoholList = ["beer or malt liquor", "wine or wine coolers", "liquor"]
					def AlcoholList = [message(code:"survey.q14.beer_maltliquor"),
										message(code:"survey.q14.wine"),
										message(code:"survey.q14.hardliguor")]
					 %>
                	<table class="box-table-b-wide">
                	<tbody>
                	<g:each in="${AlcoholList}" status="i" var="alcohol">
					<%
						def idx = i +1
					%>
                	<tr class="prop">
                		<td style="width:15%;">
                			<g:message code="survey.q14.question.header" default="q14_Do you drink" /> 
                			<label><strong>${alcohol }</strong>?</label>
                		</td>
                		<td style="width:35%;">
							<g:radioGroup name="${('q14_'+idx)}" 
							value="${surveyInstance?.('q14_'+idx)}"
							labels="[g.message(code:'survey.q14_opt1'),g.message(code:'survey.q14_opt2'), g.message(code:'survey.q14_opt3')]" 
							values="['never','quit', 'drink']" >
							<g:render template="/common/checkmark_radio_v" model="[it:it]"/>
							</g:radioGroup>
                		</td>
                		<td style="vertical-align: bottom; ">
							<g:message code="survey.q14_howManyPerWeek.label" default="q14_howManyPerWeek" /><br/>
							<g:textField name="${('q14_'+idx+'_howManyPerWeek')}" 
										 value="${surveyInstance?.('q14_'+idx+'_howManyPerWeek')}"
										 onkeyup="checkIfValidNumber(this.value, 1, 100, document.getElementById(\'${('alcohol_status'+idx)}\')); " /> <span id="${('alcohol_status'+idx)}"></span>
                		</td>
                	</tr>
                	</g:each>
                	</tbody>
                	</table>
                	<br/><br/>
                    <ul><label><g:message code="survey.q15" default="q15" /></label></ul>
                    <br/>
                    <%
					//def TobaccoList = ["Chewing Tobacco", "Snuff or Dip", "Pipe", "Cigars"]
					def TobaccoList = [message(code:"survey.q15a.label"),
									   message(code:"survey.q15b.label"),
									   message(code:"survey.q15c.label"),
									   message(code:"survey.q15d.label")]
					 %>
					<table class="box-table-b-wide">
					<tbody>
					<g:each in="${TobaccoList }" status="i" var="tobacco">
					<% def idx=i+1 %>
					<tr class="prop">
						<td style="width:15%;">
						<label><strong>${tobacco }</strong></label>
						</td>
						<td style="width:30%;">
                                    <g:radioGroup name="${('q15_'+idx)}"
                                    value="${surveyInstance?.('q15_'+idx)}" 
                                    labels="[g.message(code:'survey.q15_opt1'),g.message(code:'survey.q15_opt2'), g.message(code:'survey.q15_opt3')]"
                                    values="['currently','quit', 'no']" >
										<g:render template="/common/checkmark_radio_v" model="[it:it]"/>
									</g:radioGroup>
						</td>
						<td>
									<g:message code="survey.q15_howManyTimesPerWeek.label" default="q15_howManyTimesPerWeek" /> 
									<g:textField name="${('q15_'+idx+'_howManyTimesPerWeek')}" 
												 value="${surveyInstance?.('q15_'+idx+'_howManyTimesPerWeek')}"
												 onkeyup="checkIfValidNumber(this.value, 1, 200, document.getElementById(\'${('tobaccoWeek_status'+idx)}\')); " /> <span id="${('tobaccoWeek_status'+idx)}"></span>
									<br/>
									<g:message code="survey.q15_howManyYears.label" default="q15_howManyYears" />
									<g:textField name="${('q15_'+idx+'_howManyYears')}"
												 value="${surveyInstance?.('q15_'+idx+'_howManyYears')}"
												 onkeyup="checkIfValidNumber(this.value, 1, ageCalculated, document.getElementById(\'${('tobaccoYear_status'+idx)}\')); " /> <span id="${('tobaccoYear_status'+idx)}"></span>
						
						</td>
					</tr>
					</g:each>
					</tbody>
					</table>
                    
                    <%
						def yesno=[message(code:'survey.yes'), message(code:'survey.no')]
					%>
                    <table class="box-table-b-wide">
                    	<tbody>
                            <tr class="prop">
                                <td style="width: 65%;font-weight:bold;">
                                    <label for="q16"><g:message code="survey.q16" default="q16.smoked100cigarettes" /></label> <span id="smoke100_status"></span>
                                </td>
                                <td>
                                    <g:radioGroup name="q16"
                                     value="${surveyInstance?.q16 }"
                                     labels="${yesno }" 
                                     values="['yes','no']" >
										<g:render template="/common/checkmark_radio" model="[it:it]"/>
									</g:radioGroup>
                                    
                                </td>
                            </tr>
                            <tr class="prop">
                                <td style="width: 65%;font-weight:bold;">
                                    <label for="q17"><g:message code="survey.q17.label" default="q17" /></label>
                                </td>
                                <td>
                                    <g:textField name="q17" 
                                    style="width: 50px"
                                    value="${surveyInstance?.q17}" 
                                    onkeyup="checkIfValidNumber(this.value, 0, ageCalculated, document.getElementById(\'${('q17_status')}\')); " /> <g:message code="survey.years" default="Years" /> <span id="q17_status"></span>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td style="width: 65%;font-weight:bold;">
                                    <label for="q18"><g:message code="survey.q18.label" default="q18" /></label>
                                </td>
                                <td>
                                    <g:message code="survey.smokedFor" default="Smoked for" /> 
                                    <g:textField name="q18" 
                                    style="width: 50px"
                                    value="${surveyInstance?.q18}" 
									onkeyup="checkIfValidNumber(this.value, 0, ageCalculated, document.getElementById(\'${('q18_status')}\')); " /> <g:message code="survey.years.label" default="Years" /> <span id="q18_status"></span>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td style="width: 65%;font-weight:bold;">
                                    <label for="q19"><g:message code="survey.q19.label" default="q19" /></label>
                                </td>
                                <td>
                                    <g:textField name="q19"
                                    			 style="width: 50px"
                                    			 value="${surveyInstance?.q19}"
                                    			 onkeyup="checkIfValidNumber(this.value, 0, 200, document.getElementById(\'${('q19_status')}\')); " /> <g:message code="survey.q19.cigarettesPerDay" default="cigarettes Per Day" /> <span id="q19_status"></span>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td style="width: 65%;font-weight:bold;">
                                    <label for="q20"><g:message code="survey.q20.label" default="q20" /></label>
                                </td>
                                <td>
                                    <%--<g:checkBox name="q20" value="${surveyInstance?.q20}" />--%>
                                    <g:radioGroup name="stillSmoke"
                                     value="${surveyInstance?.stillSmoke }"
                                     labels="${yesno }"  
                                     values="['yes','no']" >
										<g:render template="/common/checkmark_radio" model="[it:it]"/>
									</g:radioGroup> <span id="stillSmoke_status"></span>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td style="width: 65%;font-weight:bold;">
                                    <label for="q21_dateStopSmoking"><g:message code="survey.q21_dateStopSmoking.label" default="q21_dateStopSmoking" /></label>
                                </td>
                                <td>
                                    <g:textField name="q21_whenStopSmoking_years" 
                                    			 style="width: 50px"
                                    			 value="${surveyInstance?.q21_whenStopSmoking_years}"
                                    			 onkeyup="checkIfValidNumber(this.value, 0, ageCalculated, document.getElementById(\'${('q21_status1')}\')); " /> <g:message code="survey.years.label" default="years" /> <span id="q21_status1"></span>
                                    <br/>
                                    <g:textField name="q21_whenStopSmoking_months"
                                    			 style="width: 50px"
                                    			 value="${surveyInstance?.q21_whenStopSmoking_months}"
												 onkeyup="checkIfValidNumber(this.value, 0, 11, document.getElementById(\'${('q21_status2')}\')); " /> <g:message code="survey.months.label" default="months" /> <span id="q21_status2"></span>
									<br/><g:message code="survey.and_or.label" default="and/or" />
                                    <br/>

                                    <g:kimsiDatePicker name="q21_dateStopSmoking" precision="day" value="${surveyInstance?.q21_dateStopSmoking}"
                                      years="${thisyear..1900}" default="none" noSelection="${['':'--']}" /><br/>

                                    
                                </td>
                            </tr>                                                        
                    	</tbody>
                    </table>                                            
                </div>