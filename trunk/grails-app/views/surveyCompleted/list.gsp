
<%@ page import="u56survey.Survey" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'survey.label', default: 'Survey')}" />
        <title>Hispanic Bio-Bank - Home</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <g:if test="${session.user.role=='admin' }"><span class="menuButton"><g:link controller="person" class="list" action="list">Manage User</g:link></span></g:if>
            <%--<g:if test="${session.user.role=='surveyer' }"><span class="menuButton"><g:link class="create" action="step1"><g:message code="default.new.label" args="[entityName]" /></g:link></span></g:if> --%>
        </div>
        <div class="body">
        <g:if test="${session.user.role=='admin' }">
        
            <h1><g:message code="survey.list" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>

<%

	//def selectedSurveys=u56survey.Survey.findAllBySurveyer(session.user.login)
	//def surveySize=u56survey.Survey.countBySurveyer(session.user.login)
def completed=0
if (session.user.login=='admin')
	completed=u56survey.SurveyCompleted.countByCompleted(true)
else
	completed=u56survey.SurveyCompleted.countBySurveyerAndCompleted(session.user.login, true)
	
def incomplete=surveyInstanceTotal-completed

 %>
            <div class="list">
            	(Total: ${surveyInstanceTotal}=<label style="color:blue">Completed:${completed}</label> + <label style="color:red">Incomplete:${incomplete}</label>)
                <table id="hor-minimalist-b" style="width:900px;">
                    <thead>
                        <tr>
                        	<g:sortableColumn property="id" title="${message(code: 'survey.id.label', default: 'ID')}" />
                            <g:sortableColumn property="consentNumSurv" title="Survey Name" />
                            <g:sortableColumn property="consentNumLoc" title="Location" />
							<g:sortableColumn property="consentNum" title="Informed Consent Number" />

                            <g:sortableColumn property="surveyer" title="surveyer" />  
                            
                            <g:sortableColumn property="completed" title="Completed" />         
                            
                            <g:sortableColumn property="DOB" title="${message(code: 'survey.DOB.label', default: 'DOB')}" />           
                            
                            <g:sortableColumn property="sex" title="${message(code: 'survey.sex.label', default: 'sex')}" />
                                                   
                            <g:sortableColumn property="dateCreated" title="${message(code: 'survey.dateCreated.label', default: 'Date Created')}" />
                            
                            <g:sortableColumn property="lastUpdated" title="${message(code: 'survey.lastUpdated.label', default: 'Date updated')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${surveyInstanceList}" status="i" var="surveyInstance">
                    	
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
							<td><g:link action="view" id="${surveyInstance.id}">${surveyInstance?.id}</g:link></td>
                        	<td><g:link action="view" id="${surveyInstance.id}">${surveyInstance?.consentNumSurv}</g:link></td>
                        	<td><g:link action="view" id="${surveyInstance.id}">${surveyInstance?.consentNumLoc}</g:link></td>
                            <td><g:link action="view" id="${surveyInstance.id}">${surveyInstance?.consentNum}</g:link></td>
                        	<td>${surveyInstance?.surveyer}</td>
                        	<td>
                            <g:if test="${surveyInstance?.completed}">
                            	<label style="color:blue;font-style:bold;">Y</label>
                            </g:if>
                            <g:else>
                            	<label style="color:red;font-style:bold;">N</label>
                            </g:else>
                        	</td>
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
                            <td><g:formatDate date="${surveyInstance.dateCreated}" format="MM/dd/yyyy hh:mm:ss"/></td>
                        	<td><g:formatDate date="${surveyInstance.lastUpdated}" format="MM/dd/yyyy hh:mm:ss"/></td>
                        
                        </tr>
                        
                    </g:each>
                    </tbody>
                </table>
            </div>

            <div class="paginateButtons">
                <g:paginate total="${surveyInstanceTotal}" />
            </div>
            <br/><br/><br/>







        </div>
        </g:if>
    </body>
</html>
