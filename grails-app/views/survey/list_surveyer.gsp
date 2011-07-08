
<%@ page import="u56survey.Survey" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'survey.label', default: 'Survey')}" />
        <title>Hispanic Bio-Bank - List</title>
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
%>
            ]
        });
       
    });

</script>   
    
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <%--<g:if test="${session.user.role=='surveyer' }"><span class="menuButton"><g:link class="create" action="step1"><g:message code="default.new.label" args="[entityName]" /></g:link></span></g:if> --%>
        </div>
        <div class="body">
<h1>Calendar View</h1>
<div id='calendar'></div>
        
            <h1><g:message code="survey.list" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>

				<g:render template="/common/survey_list" model=[surveyInstanceList:Survey.list, surveyInstanceTotal: Survey.count()]/>
        </div>

    </body>
</html>
