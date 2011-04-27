                <div class="dialog">
					<%
					def yesno=[message(code:'survey.yes'), message(code:'survey.no')]     
					%>                
                    <br/>
                    <ul>
                    <div>
	                    <label><g:message code="survey.q83" default="q83" /></label>
	                    <br/><br/>
	                    <div>
	                    <g:radioGroup name="q83"
		                            	value="${surveyInstance?.q83}" 
		                                labels="${yesno }" 
		                                values="['yes','no']" >
										<g:render template="/common/checkmark_radio" model="[it:it]"/>
									</g:radioGroup>
						
						</div>
					</div>
					</ul>
                    <ul>
                    <br/><br/>
                    <div style="clear:left">
                    	<label><g:message code="survey.q84" default="q84" /></label>
                    </div>
                    </ul>
                    <br/>
                    

                    <%
					def RadiationTypeList=[message(code:'survey.q84.t1'),
											message(code:'survey.q84.t2'),
											message(code:'survey.q84.t3'),
											message(code:'survey.q84.t4'),
											message(code:'survey.q84.t5'),
											message(code:'survey.q84.t6'),
											message(code:'survey.q84.t7'),
											message(code:'survey.q84.t8'),
											message(code:'survey.q84.t9'),
											message(code:'survey.q84.t10')]
					 %>
					 <table class="box-table-b-wide">
					 <thead>
					 <tr>
					 	<th><g:message code="survey.typeofradiation" default="Disease/ Type of radiation" /></th>
					 	<th><g:message code="survey.yesno" default="Yes / No" /></th>
					 	<th><g:message code="survey.whenradiation" default="when did you receive the radiation?" /></th>
					 	<th><g:message code="survey.atwhatage" default="At what age" /></th>
					 </tr>
					 </thead>
					 <tbody>
					 <g:each in="${RadiationTypeList }" status="i" var="radiation">
					 <%def idx = i+1 %>
					 <tr>
					 	<td style="width:25%;font-weight:bold">					 		
					 		<g:if test="${radiation==message(code:'survey.q84.t10') }">
					 			<g:message code="survey.q84.another.place" default="Indicate another place" />
					 			<g:textField name="q84_another" value="${surveyInstance?.q84_another}" />
					 		</g:if>
					 		<g:else>
					 			${radiation }
					 		</g:else>
					 	</td>
					 	<td style="width:25%">
	                        	<g:radioGroup name="${('q84_'+idx)}"
	                            	value="${surveyInstance?.('q84_'+idx)}" 
	                                labels="${yesno }" 
	                                values="['yes','no']" >
									<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>					 	
					 	</td>
					 	<td style="width:40%">
					 		<g:kimsiDatePicker name="${('q84_'+idx+'_rad_date')}" precision="day" value="${surveyInstance?.('q84_'+idx+'_rad_date')}"  
                                      years="${thisyear..1900}" default="none" noSelection="${['':'--']}" />
					 	</td>
					 	<td style="width:10%">
					 		<g:textField name="${('q84_'+idx+'_whatAge')}" value="${surveyInstance?.('q84_'+idx+'_whatAge')}" />
					 	</td>
					 </tr>
					 </g:each>
					 </tbody>
					 </table>
                </div>
