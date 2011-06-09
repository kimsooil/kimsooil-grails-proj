                <div class="dialog">
                <br/>
                <ul><label><g:message code="survey.q22" default="q22" /></label></ul>
				
                	<%
					//def ActivityList=["Running", "Walking", "Swimming", "Aerobics", "Weight lifting", "Bicycling", "Gymnastics", "Others"]
					def ActivityList=[message(code:"survey.q22.running"),
									message(code:"survey.q22.walking"),
									message(code:"survey.q22.swimming"),
									message(code:"survey.q22.aerobics"),
									message(code:"survey.q22.weightlifting"),
									message(code:"survey.q22.bicycling"),
									message(code:"survey.q22.gymnastics"),
									message(code:"survey.q22.others")]
									
					 %>
                    <table class="box-table-b">
                    	<thead>
                    	<tr>
	                    	<th><g:message code="survey.q22_activities" default="Activities" /></th>
	                    	<th><g:message code="survey.q22_frequency" default="Frequency" /></th>
                    	</tr>
                    	</thead>
                        <tbody>
                        <g:each in="${ActivityList }" status="i" var="activity">
                        <% def idx=i+1 %>
						<tr class="prop">
							<td style="width:25%;font-weight: bold;">
								${activity }
								<g:if test="${activity==message(code:'survey.q22.others') }">
									<g:textField style="width:100px" name="q22_others" value="${surveyInstance?.q22_others }" />
									<span id="q22_others_status"></span>
								</g:if>
							</td>
							<td style="width:80%;">
								<%
								def freqlist=[message(code:"survey.daily"),message(code:"survey.weekly"),message(code:"survey.monthly"),message(code:"survey.never")]
								 %>
								<g:radioGroup name="${('q22_'+idx)}"
		                            	value="${surveyInstance?.('q22_'+idx)}" 
		                                labels="${freqlist }" 
		                                values="['daily','weekly', 'monthly', 'never']" >
										<g:render template="/common/checkmark_radio" model="[it:it]"/>
								</g:radioGroup>
							</td>
						</tr>
						</g:each>                                                                                    
                        </tbody>
                    </table>
					<br/><ul><label><g:message code="survey.q23" default="q23" /></label></ul>
					<br/>
					<table class="box-table-b">
					<thead>
						<tr>
						<th><g:message code="survey.q23.levelOfActivity" default="Level of Activity" /></th>
						<th><g:message code="survey.q23.checkMark" default="Check mark" /></th>
						</tr>
					</thead>
					<tbody>
					<%
					def activityList=[message(code:"survey.q23.act1"),
						message(code:"survey.q23.act2"),
						message(code:"survey.q23.act3"),
						message(code:"survey.q23.act4"),
						message(code:"survey.q23.act5")]
					 %>
							<g:radioGroup name="LevelOfActivity"
							value="${surveyInstance?.LevelOfActivity}"
							labels="${activityList }"
							values="['1','2','3','4','5']">
							<tr class="prop">
								<td style="width:75%;font-weight: bold;">${it.label }</td>
								<td>
									${it.radio}

								</td>
							</tr> 
							</g:radioGroup>
					</tbody>
					</table>                 
                </div>