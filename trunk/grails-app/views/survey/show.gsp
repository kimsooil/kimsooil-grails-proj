
<%@ page import="u56survey.Survey" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'survey.label', default: 'Survey')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <g:if test="${session.user.role=='admin' }"><span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span></g:if>
            <%--<span class="menuButton"><g:link class="create" action="step1"><g:message code="default.new.label" args="[entityName]" /></g:link></span> --%>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
<g:form>
            <div class="buttons2">

			<%
				def stepNum=0
				def stepNumUrl="step1_edit"
				if (surveyInstance.step=='verify'){
					stepNumUrl="verify"
				}
				else if (surveyInstance.step=='completed'){
					stepNumUrl="preview"
				}
				else if (surveyInstance.step){
					stepNum = surveyInstance.step.toInteger()
					
					if (stepNum >=1 && stepNum <=15)
						stepNumUrl = stepNum==1 ? "step1_edit": "step"+stepNum
					else
						stepNumUrl = "show"
				}
								
			%>
                    
                    <%--
                    <g:hiddenField name="id" value="${surveyInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="step1_edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                     --%>

                    <g:if test="${!surveyInstance?.completed}">

                    	<%--<g:link class="editbutton" action="verify" id="${surveyInstance?.id }" ><g:message code="verify" default="verify" /></g:link> --%>
                   		<span class="button"><g:link class="editbutton" action="${stepNumUrl }" id="${surveyInstance.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link></span>
                    </g:if>
                    <g:else>

                    	<span class="button"><g:link class="editbutton" action="preview" id="${surveyInstance?.id }" ><g:message code="preview" default="readonly" /></g:link></span>
                 
                    	<label style="color:orange">Locked by completion<br/>(Contact admin for any inquiry about this survey)</label>
                  	
                    </g:else>

                     
                    <%--<span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span> --%>
               
            </div>
</g:form>            
            <div class="dialog">
                <table>
                    <tbody>
                        <tr class="prop">
                            <td valign="top" class="name">Survey Name</td>
                            
                            <td valign="top" class="value">${fieldValue(bean: surveyInstance, field: "consentNumSurv")}</td>
                            
                        </tr>                    
                        <tr class="prop">
                            <td valign="top" class="name">location</td>
                            
                            <td valign="top" class="value">${fieldValue(bean: surveyInstance, field: "consentNumLoc")}</td>
                            
                        </tr>                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="survey.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: surveyInstance, field: "id")}</td>
                            
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">Completed (Y/N)</td>
                            
                            <td valign="top" class="value">
                            <g:if test="${surveyInstance?.completed}">
                            	<label style="color:blue;font-style:bold;">Y</label>
                            </g:if>
                            <g:else>
                            	<label style="color:red;font-style:bold;">N</label>
                            </g:else>
                            </td>
                            
                        </tr>                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="survey.DOB.label" default="DOB" /></td>
                            
                            <td valign="top" class="value"><g:formatDate format="MM/dd/yyyy" date="${surveyInstance.DOB}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">sex</td>
                            
                            <td valign="top" class="value">${fieldValue(bean: surveyInstance, field: "sex")}</td>
                            
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="survey.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${surveyInstance?.dateCreated}" /></td>
                            
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="survey.lastUpdated.label" default="Last Updated" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${surveyInstance?.lastUpdated}" /></td>
                            
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="Current Step" default="Current Step" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: surveyInstance, field: "step")}</td>
                            
                        </tr>                        
<%--
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="survey.country.label" default="Country" /></td>
                            
                            <td valign="top" class="value">
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
                            
                        </tr>
 --%>

                    

                    
                    </tbody>
                </table>
            </div>

        </div>
    </body>
</html>
