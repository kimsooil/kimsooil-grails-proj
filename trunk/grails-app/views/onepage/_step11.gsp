                <div class="dialog">
					<%
					def yesno=[message(code:'survey.yes'), message(code:'survey.no')]     
					%>           
                
                    <table class="box-table-b-wide">
                        <tbody>
	                    <tr>
	                    	<td style="width:40%;font-weight:bold;"><label><g:message code="survey.q72" default="q72" /></label></td>
	                    	<td style="width:60%">
	                        	<g:radioGroup name="q72"
	                            	value="${surveyInstance?.q72}" 
	                                labels="${yesno }"
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>
							</td>
						</tr>
	                    <tr>
	                    	<td style=";font-weight:bold;"><label><g:message code="survey.q73" default="q73" /></label></td>
	                    	<td>
		                    	<g:message code="survey.alive" default="Alive" />: <g:textField name="q73_alive" value="${surveyInstance?.q73_alive}" />
		                    	<br/><g:message code="survey.dead" default="Dead" />: <g:textField name="q73_dead" value="${surveyInstance?.q73_dead}" />
		                    	<br/><g:message code="survey.miscarriage" default="Miscarriage" />: <g:textField name="q73_miscarriage" value="${surveyInstance?.q73_miscarriage}" />
	                    	</td>
	                    </tr>
	                    <tr>
	                    	<td style=";font-weight:bold;"><label><g:message code="survey.q74" default="q74" /></label></td>
	                    	<td>
		                    	<g:textField name="q74" value="${surveyInstance?.q74}" /> <g:message code="survey.years" default="years" />
	                    	</td>
	                    </tr> 
	                    <tr>
	                    	<td style=";font-weight:bold;"><label><g:message code="survey.q75" default="q75" /></label></td>
	                    	<td>
		                    	<g:textField name="q75" value="${surveyInstance?.q75}" /> <g:message code="survey.years" default="years" />
	                    	</td>
	                    </tr>
	                    <tr>
	                    	<td style=";font-weight:bold;"><label><g:message code="survey.q76" default="q76" /></label></td>
	                    	<td>
		                    	<g:textField name="q76" value="${surveyInstance?.q76}" />
	                    	</td>
	                    </tr>
	                    <tr>
	                    	<td style=";font-weight:bold;"><label><g:message code="survey.q77" default="q77" /></label></td>
	                    	<td>
	                        	<g:radioGroup name="q77"
	                            	value="${surveyInstance?.q77}" 
	                                labels="${yesno }"
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>
	                    	</td>
	                    </tr>
                        </tbody>
                    </table>
                    <br/><ul><label><g:message code="survey.q78" default="q78" /></label></ul>
                    <table class="box-table-b-wide">
                    <thead>
                    <tr>
                    	<th><g:message code="survey.baby" default="Baby" /></th>
                    	<th><g:message code="survey.weeksmonths" default="Weeks / Months" /></th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
					def BabyOrderList=[message(code:'survey.1st'),message(code:'survey.2nd'),message(code:'survey.3rd'),message(code:'survey.4th'),message(code:'survey.5th'),
						message(code:'survey.6th'),message(code:'survey.7th'),message(code:'survey.8th'),message(code:'survey.9th'),message(code:'survey.10th')]
					%>
					<g:each in="${BabyOrderList}" status="i" var="baby">
	    			<%
					def idx=i+1
					%> 
                    <tr>
                    	<td style="padding: 3px;font-weight:bold;">${baby}</td>
                    	<td style="padding: 3px;">
                    		<g:textField name="${('q78_'+idx+'_week')}" value="${surveyInstance?.('q78_'+idx+'_week')}" /> / 
                    		<g:textField name="${('q78_'+idx+'_month')}" value="${surveyInstance?.('q78_'+idx+'_month')}" />
                    	</td>
                    </tr>
                    </g:each>
                    </tbody>
                    </table>

                    <table class="box-table-b-wide">
                    <tbody>
	                    <tr>
	                    	<td style="width:25%;font-weight:bold;"><label><g:message code="survey.q79" default="q79" /></label></td>
	                    	<td style="width:75%">
	                        	<g:radioGroup name="q79"
	                            	value="${surveyInstance?.q79}" 
	                                labels="${yesno }"
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>
	                    	</td>
	                    </tr>
	                    </tbody>
	                    </table>
                    <table class="box-table-b-wide">
                    <tbody>
	                    
	                    <tr>
	                    	<td style="width:25%;font-weight:bold;"><label><g:message code="survey.q80" default="q80" /></label></td>
	                    	<td style="width:75%">
	                        	<g:radioGroup name="q80"
	                            	value="${surveyInstance?.q80}" 
	                                labels="${yesno }" 
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>
								<div style="clear:left">
								<br/><g:message code="survey.whichone" default="Which one" /> <g:textField name="q80_which" value="${surveyInstance?.q80_which}" />&nbsp;&nbsp;&nbsp;
								<br/><g:message code="survey.atwhatage" default="At what age" /> <g:textField name="q80_whatAge" value="${surveyInstance?.q80_whatAge}" />&nbsp;&nbsp;&nbsp;
								<br/><g:message code="survey.forhowlong" default="For how long" /> <g:textField name="q80_howLong" value="${surveyInstance?.q80_howLong}" />
								</div>
	                    	</td>
	                    </tr>
	                    <tr>
	                    	<td style="width:25%;font-weight:bold;"><label><g:message code="survey.q81" default="q81" /></label></td>
	                    	<td style="width:75%">
		                    	<g:textField name="q81" value="${surveyInstance?.q81}" />
	                    	</td>
	                    </tr>
                    </tbody>
                    </table>
                    
                    <h1><label style="color:black"><g:message code="step11b.label" default="Step11b" /></label></h1>
                    	                    
                    <table class="box-table-b-wide">
                    <tbody>	                    
	                    <tr>
	                    	<td style="width:25%;font-weight:bold;"><label><g:message code="survey.q82" default="q82" /></label></td>
	                    	<td style="width:75%">
	                        	<g:radioGroup name="q82"
	                            	value="${surveyInstance?.q82}" 
	                                labels="${yesno }"
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>
	                    	</td>
	                    </tr>	                    
                    </tbody>
                    </table>
                    <%--
                    <br/><label><g:message code="survey.q82.table" default="Family History of Breast Cancer" /></label><br/><br/>
                    --%>
                    
                    <%
					def PersonList=[message(code:'survey.mother'),
									message(code:'survey.father'),
									message(code:'survey.sister'),
									message(code:'survey.brother'),
									message(code:'survey.daughter'), 
									message(code:'survey.son'),						
									message(code:'survey.grandmother.m'),
									message(code:'survey.grandfather.m'),
									message(code:'survey.aunt.m'),
									message(code:'survey.uncle.m'),
									message(code:'survey.grandmother.p'),
									message(code:'survey.grandfather.p'),
									message(code:'survey.aunt.p'),	
									message(code:'survey.uncle.p'),
									message(code:'survey.others')]
					
					def BreastCancerTypeList=[message(code:'survey.breastcancer.diag1'), message(code:'survey.breastcancer.diag2'), message(code:'survey.breastcancer.diag3') ]
					def AliveDeadList=[message(code:'survey.alive'), message(code:'survey.dead')]
					%>
					<table class="box-table-b-wide">
					<thead>
					<tr>
						<th><g:message code="survey.q82.thead1" /></th>
						<th><g:message code="survey.q82.thead2" /></th>
						<th><g:message code="survey.q82.thead3" /></th>
						<th><g:message code="survey.q82.thead4" /></th>
						<th><g:message code="survey.q82.thead5" /></th>
					</tr>
					</thead>
					<g:each in="${PersonList }" status="i" var="person">
					<% def idx=i+1 %>
					<tr>
						<td style="width:10%; padding: 5px;font-weight:bold;">
						${idx}. ${person }
						<g:if test="${person==message(code:'survey.others') }">
							<g:textField name="q82_others" value="${surveyInstance?.q82_others}" />
						</g:if>
						</td>
						<td style="width:20%; padding: 5px">
                        	<g:radioGroup name="${('q82_'+idx)}"
                            	value="${surveyInstance?.('q82_'+idx)}" 
                                labels="${yesno }"
                                values="['yes','no']" >
								<g:render template="/common/checkmark_radio" model="[it:it]"/>
							</g:radioGroup>						
						</td>
						<td style="padding: 5px">
							<g:select name="${('q82_'+idx+'_type')}"
									from="${BreastCancerTypeList}"
									value="${surveyInstance?.('q82_'+idx+'_type')}"
									noSelection="['':'']" />
						</td>
						<td style="padding: 5px">
							<g:textField name="${('q82_'+idx+'_whatAge')}" value="${surveyInstance?.('q82_'+idx+'_whatAge')}" />
						</td>
						<td style="padding: 5px">
							<g:select name="${('q82_'+idx+'_aliveDead')}"
									from="${AliveDeadList}"
									value="${surveyInstance?.('q82_'+idx+'_aliveDead')}"
									noSelection="['':'']" />						
						</td>
					</tr>
					</g:each>
					</table>
                </div>
