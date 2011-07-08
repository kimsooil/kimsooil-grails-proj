<%@ page import="u56survey.Survey" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'survey.label', default: 'Survey')}" />
        <title>Hispanic Bio-Bank - Calendar View</title>

<link rel='stylesheet' type='text/css' href="${resource(dir:'fullcalendar',file:'fullcalendar.css')}" />
<link rel='stylesheet' type='text/css' href="${resource(dir:'fullcalendar',file:'fullcalendar.print.css')}" media='print' />

<script type='text/javascript' src="${resource(dir:'fullcalendar',file:'fullcalendar.min.js')}"></script>
<style type="text/css">
<!--
	#calendar {
        width: 750px;
        margin: 0 auto;
        }
-->
</style>
    </head>
    <body>
<script type='text/javascript'>

    $(document).ready(function() {
		var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();
		
        $('#calendar').fullCalendar({
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,basicWeek,basicDay'
            },           
            editable: true,
            events: [
<%

surveyInstanceList.each{
    def cdate=it.dateCreated
    def cy=cdate[java.util.Calendar.YEAR]
    def cm=cdate[java.util.Calendar.MONTH]
    def cd=cdate[java.util.Calendar.DATE]
    def udate=it.lastUpdated
    def uy=udate[java.util.Calendar.YEAR]
    def um=udate[java.util.Calendar.MONTH]
    def ud=udate[java.util.Calendar.DATE]
	def current_step=it.step ? it.step : ''
	def sex=it.sex=='female'? 'F' : (it.sex=='male'? 'M': '')
	

    if (it.completed)
        println "{title:"+"\'$it.id[$sex]\'"+",color:\'#0000ff\', start: new Date($cy, $cm, $cd), end: new Date($uy, $um, $ud),url:\'/hispbb/survey/show/$it.id\'},"
    else
        println "{title:"+"\'$it.id[$sex]($current_step)\'"+",color:\'#ff0000\', start: new Date($cy, $cm, $cd), end: new Date($uy, $um, $ud),url:\'/hispbb/survey/show/$it.id\'},"
   
}
println "{}"  // supressing js-error in IE7
%>

            ]
        });
       
    });

</script>   
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <g:if test="${session.user.role=='admin' }"><span class="menuButton"><g:link controller="person" class="list" action="list">Manage User</g:link></span></g:if>
            <%--<g:if test="${session.user.role=='surveyer' }"><span class="menuButton"><g:link class="create" action="step1"><g:message code="default.new.label" args="[entityName]" /></g:link></span></g:if> --%>
        </div>

        <div class="body">
<h1>Calendar View</h1>
<div id='calendar'></div>

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
            
<br/>
<h1>Full Survey List</h1>  
<div class="list">

&nbsp;&nbsp;&nbsp;(Total: ${surveyInstanceTotal}=<label style="color:blue">Completed:${completed}</label> + <label style="color:red">Incomplete:${incomplete}</label>)
          
                <table id="hor-minimalist-b" style="text-align:center;width:700px;">
  <thead>
                        <tr>
                            <g:sortableColumn property="consentNumSurv" title="Survey Name" />
                            <g:sortableColumn property="consentNumLoc" title="Location" />
                            <g:sortableColumn property="id" title="${message(code: 'survey.id.label', default: 'ID')}" />
                            <g:sortableColumn property="otherNumberOrComments" title="Other Number, ID, etc." />
                            <g:sortableColumn property="surveyer" title="surveyer" /> 
                           
                            <g:sortableColumn property="completed" title="Completed" />        
                            <g:sortableColumn property="step" title="Step" />
                            <g:sortableColumn property="DOB" title="${message(code: 'survey.DOB.label', default: 'DOB')}" />          
                           
                            <g:sortableColumn property="sex" title="${message(code: 'survey.sex.label', default: 'sex')}" />
                                                  
                            <g:sortableColumn property="dateCreated" title="${message(code: 'survey.dateCreated.label', default: 'Date Created')}" />
                           
                            <g:sortableColumn property="lastUpdated" title="${message(code: 'survey.lastUpdated.label', default: 'Date updated')}" />
                       
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${surveyInstanceList.sort{-it.id}}" status="i" var="surveyInstance">
                       
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <%
                                def stepNum=0
                                def stepNumUrl="show"
                                if (!surveyInstance.completed && surveyInstance.step){
                                    stepNum = surveyInstance.step.toInteger()
                                    stepNumUrl=(surveyInstance.step && stepNum>=1 && stepNum<=15 ) ? (stepNum==1 ? "step1_edit": "step"+stepNum) : "show"
                                }
                               
                             %>
                            <td><g:link action="${stepNumUrl }" id="${surveyInstance.id}">${surveyInstance?.consentNumSurv}</g:link></td>
                            <td><g:link action="${stepNumUrl }" id="${surveyInstance.id}">${surveyInstance?.consentNumLoc}</g:link></td>
                            <td><g:link action="${stepNumUrl }" id="${surveyInstance.id}">${surveyInstance?.id}</g:link></td>
                            <td><g:link action="${stepNumUrl }" id="${surveyInstance.otherNumberOrComments}">${surveyInstance?.otherNumberOrComments}</g:link></td>
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
                                                 
                            <td><g:formatDate date="${surveyInstance.dateCreated}" format="MM/dd/yyyy hh:mm:ss"/></td>
                            <td><g:formatDate date="${surveyInstance.lastUpdated}" format="MM/dd/yyyy hh:mm:ss"/></td>
                       
                        </tr>
                       
                    </g:each>
                    </tbody>
                </table>
            </div>
</div>
            <br/><br/><br/>



    </body>
</html>