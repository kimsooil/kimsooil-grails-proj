<%

	//def selectedSurveys=u56survey.Survey.findAllBySurveyer(session.user.login)
	//def surveySize=u56survey.Survey.countBySurveyer(session.user.login)
def completed=0
if (session.user.login=='admin')
	completed=u56survey.Survey.countByCompleted(true)
else
	completed=u56survey.Survey.countBySurveyerAndCompleted(session.user.login, true)
	
def incomplete=surveyInstanceTotal-completed

 %>
             
            <div class="list">
            	(Total: ${surveyInstanceTotal}=<label style="color:blue">Completed:${completed}</label> + <label style="color:red">Incomplete:${incomplete}</label>)
            	
            	<%--<g:if test="${session.user.role=='admin' }"> --%>
            		<%--<export:formats />
            		<export:formats formats="['csv', 'excel', 'ods', 'pdf', 'rtf', 'xml']" />
            		--%>
            		<export:formats formats="['csv', 'xml']" />
            		
            	<%--</g:if> --%>
                <table id="hor-minimalist-b" style="width:900px;">
                    <thead>
                        <tr>
                        	<g:sortableColumn property="id" title="${message(code: 'survey.id.label', default: 'ID')}" />
                            <g:sortableColumn property="consentNumSurv" title="Survey Name" />
                            <g:sortableColumn property="consentNumLoc" title="Location" />
							<g:sortableColumn property="consentNum" title="Informed Consent Number" />
							<%--<g:sortableColumn property="otherNumberOrComments" title="Other Number, ID, etc." /> --%>
                            <g:sortableColumn property="surveyer" title="surveyer" />  
                            
                            <g:sortableColumn property="completed" title="Completed" />         
                            <g:sortableColumn property="step" title="Step" />
                            <g:sortableColumn property="DOB" title="${message(code: 'survey.DOB.label', default: 'DOB')}" />           
                            
                            <g:sortableColumn property="sex" title="${message(code: 'survey.sex.label', default: 'sex')}" />
                                                   
                            <g:sortableColumn property="dateCreated" title="${message(code: 'survey.dateCreated.label', default: 'Date Created')}" />
                            
                            <g:sortableColumn property="lastUpdated" title="${message(code: 'survey.lastUpdated.label', default: 'Date updated')}" />
                            <g:sortableColumn property="dateCompleted" title="Date Completed" />                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${surveyInstanceList}" status="i" var="surveyInstance">
                    	
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
							<%
								def stepNum=0
								def stepNumUrl="show"
								if (!surveyInstance.completed && surveyInstance.step){
									stepNum = surveyInstance.step.toInteger()
									stepNumUrl=(surveyInstance.step && stepNum>=1 && stepNum<=15 ) ? (stepNum==1 ? "step1_edit": "step"+stepNum) : "show"
								}
								
							 %>
							<td><g:link action="${stepNumUrl }" id="${surveyInstance.id}">${surveyInstance?.id}</g:link></td>
                        	<td><g:link action="${stepNumUrl }" id="${surveyInstance.id}">${surveyInstance?.consentNumSurv}</g:link></td>
                        	<td><g:link action="${stepNumUrl }" id="${surveyInstance.id}">${surveyInstance?.consentNumLoc}</g:link></td>
                            <td><g:link action="${stepNumUrl }" id="${surveyInstance.id}"><g:formatNumber number="${surveyInstance?.consentNum }" format="####"/></g:link></td>
                            <%--<td><g:link action="${stepNumUrl }" id="${surveyInstance.otherNumberOrComments}">${surveyInstance?.otherNumberOrComments}</g:link></td> --%>
                        	<td>${surveyInstance?.surveyer}</td>
                        	<td>
                            <g:if test="${surveyInstance?.completed}">
                            	<label style="color:blue;font-style:bold;">Y</label>
                            </g:if>
                            <g:else>
                            	<label style="color:red;font-style:bold;">N</label>
                            </g:else>
                        	</td>
                        	<td>${surveyInstance?.step }</td>
                            <td><g:formatDate format="MM/dd/yyyy" date="${surveyInstance?.DOB}" /></td>                 
                        	<td>${surveyInstance?.sex }</td>
                            
                            <%--${fieldValue(bean: surveyInstance, field: "country")}--%>
                            <%--
                            <td>
                            <g:if test="${surveyInstance?.country }">
							<%
							def countries = [] as SortedSet
							def countryNames = [:]
							
							Locale.ISOCountries.each {
							  if (it) {
								countries << it
							  }
							}
							countries.each{twolettercode->
								Locale l= new Locale("", twolettercode);
								countryNames.put(twolettercode, l.getDisplayCountry())
							}
							out << countryNames.get(surveyInstance.country)
							 %>
                            </g:if>                            
                            </td>
                             --%>                        
                            <td><g:formatDate date="${surveyInstance.dateCreated}" format="MM/dd/yyyy HH:mm:ss"/></td>
                        	<td><g:formatDate date="${surveyInstance.lastUpdated}" format="MM/dd/yyyy HH:mm:ss"/></td>
                        	<td><g:formatDate date="${surveyInstance.dateCompleted}" format="MM/dd/yyyy HH:mm:ss"/></td>
                        
                        </tr>
                        
                    </g:each>
                    </tbody>
                </table>
            </div>

            <div class="paginateButtons">
                <g:paginate total="${surveyInstanceTotal}" />
            </div>
            

            <br/><br/><br/>


