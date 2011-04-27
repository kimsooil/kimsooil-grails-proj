<div class="dialog">
                    <table class="box-table-b-wide">
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name2" style="font-weight:bold;">
                                    <label for="weight"><g:message code="survey.q9" default="Weight" /></label>
                                </td>
                                <td valign="top" class="${hasErrors(bean: surveyInstance, field: 'weight', 'errors')}">
                                    <g:textField name="weight" value="${surveyInstance?.weight}" /> <g:message code="survey.pounds" default="Pounds" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name2" style="font-weight:bold;">
                                    <label for="height_feet">
                                    	<g:message code="survey.q10" default="Height feet" />
                                    </label>
                                </td>
                                <td valign="top" class="${hasErrors(bean: surveyInstance, field: 'height_feet', 'errors')} ${hasErrors(bean: surveyInstance, field: 'height_inches', 'errors')}">
                                    <g:textField name="height_feet" value="${surveyInstance?.height_feet}" /> <g:message code="survey.feet" default="feet" /><br/>
                                    <g:textField name="height_inches" value="${surveyInstance?.height_inches}" /> <g:message code="survey.inches" default="inches" />
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
						<th style="width: 30%;border: 1px solid #9baff1;""><g:message code="survey.first_infection" default="Year of first infection" /></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${InfectionsList}" status="i" var="infectiontype">
					<% def idx=i %>
					<g:if test="${idx==0}">
					<tr>
						<td style="border: 1px solid #9baff1;font-weight:bold;">${infectiontype }</td>
						<td style="border: 1px solid #9baff1;font-weight:bold;"><g:checkBox name="q11a_hep_donotknow_type" value="${surveyInstance?.q11a_hep_donotknow_type}""/></td>
						<td></td>
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
					<%--
					<input type="radio" name="haveCancer" value="yes" onClick="toggleQ12();" <g:if test="${surveyInstance?.haveCancer=='yes'}">checked="true"</g:if> /> <g:message code="survey.yes" default="Yes" />&nbsp;&nbsp;&nbsp;
					<input type="radio" name="haveCancer" value="no" onClick="toggleQ12();" <g:if test="${surveyInstance?.haveCancer=='no'}">checked="true"</g:if> /> <g:message code="survey.no" default="No" />
					 --%>
					 <br/> <br/>
						 <ul>
						 <div>
						 	<input type="radio" name="haveCancer" value="yes" <g:if test="${surveyInstance?.haveCancer=='yes'}">checked="true"</g:if> /> <g:message code="survey.yes" default="Yes" />&nbsp;&nbsp;&nbsp;
						 	<input type="radio" name="haveCancer" value="no"  <g:if test="${surveyInstance?.haveCancer=='no'}">checked="true"</g:if> /> <g:message code="survey.no" default="No" />

						</div>
						</ul>
					</ul>
								  
									  
                    
                    <div id="q12div">
                    <%--
                    	<g:if test="${surveyInstance?.haveCancer=='yes'}">style="display:block;"</g:if>
                    	<g:else>style="display:none;"</g:else> 
                    --%>	
                    	
                    <br/>
                    <ul><label><g:message code="survey.q12" default="q12" /></label></ul>
                    
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
	                    	<td style="width: 20%;font-weight:bold;">
	                    	${cancertype}
	                    	<g:if test="${cancertype==message(code:'survey.q12_other') }">
	                    		<g:textField name="q12_which_cancer" value="${surveyInstance?.q12_which_cancer}" />
	                    	</g:if>
	                    	</td>
	                    	<td style="width: 10%;">
	                    		<g:textField name="${('q12_'+idx+'_ageDiagnosed')}" value="${surveyInstance?.('q12_'+idx+'_ageDiagnosed')}" />
	                    	</td>
	                    	<td>
	                    	<%--
                                <g:radioGroup name="${('q12_'+idx)}" 
                                	value="${surveyInstance?.('q12_'+idx)}"
                                    labels="[g.message(code:'survey.q12_opt1'),g.message(code:'survey.q12_opt2'),g.message(code:'survey.q12_opt3'), g.message(code:'survey.q12_opt4')]"
                                    values="['radiation','chemotherapy', 'surgery', 'none']" >
										${it.radio} ${it.label}&nbsp;&nbsp;&nbsp;
								</g:radioGroup>
							 --%>
							 <g:each in="${TreatmentList }" status="j" var="treatment">
							 <% def tidx=j+1 %>
							 		<g:checkBox name="${('q12_'+idx+'_'+tidx)}"
							 		 value="${surveyInstance?.('q12_'+idx+'_'+tidx)}" 
							 		 onclick="resetIfnone()"/> <label>${treatment }</label>&nbsp;&nbsp;&nbsp;
							 </g:each>	                    	
	                    	</td>
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
						<g:checkBox name="spread_liver" value="${surveyInstance?.spread_liver}" /><g:message code="survey.q11c.liver" />&nbsp;&nbsp;&nbsp;
						<g:checkBox name="spread_brain" value="${surveyInstance?.spread_brain}" /><g:message code="survey.q11c.brain" />&nbsp;&nbsp;&nbsp;
						<g:checkBox name="spread_lung" value="${surveyInstance?.spread_lung}" /><g:message code="survey.q11c.lung" />&nbsp;&nbsp;&nbsp;
						<g:checkBox name="spread_bone" value="${surveyInstance?.spread_bone}" /><g:message code="survey.q11c.bone" />&nbsp;&nbsp;&nbsp;
						<g:checkBox name="spread_other" value="${surveyInstance?.spread_other}" /><g:message code="survey.q11c.other" />&nbsp;&nbsp;&nbsp;
						<g:textField name="spread_where" value="${surveyInstance?.spread_where}" />
					</ul>
					<br/>
					</ul>
</div>

