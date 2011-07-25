<g:if test="${session.user.role=='admin' }">
<%
    	def colors = ['FF0000']
		def values =[]
		def labels =[]
		//def locations = u56survey.Survey.executeQuery("select distinct p.location from Person p where p.role='surveyer'")
		//def locations = u56survey.Survey.executeQuery("select distinct p.location from Person p")
		def locations = u56survey.Site.executeQuery("select distinct s.fourletters from Site s")
		locations.each {
			values << u56survey.Survey.countByConsentNumLoc(it)
			labels << it+" ["+u56survey.Survey.countByConsentNumLoc(it)+"]"
		}
		def colors2 = ['0000ff']
		def values2 =[]
		def labels2 =[]
		//def surveyers = u56survey.Person.executeQuery("select distinct p.login from Person p where p.role='surveyer'")
		def surveyers = u56survey.Person.executeQuery("select distinct p.login from Person p")
		surveyers.each {
			values2 << u56survey.Survey.countBySurveyer(it)
			labels2 << it+" ["+u56survey.Survey.countBySurveyer(it)+"]"
		}

%>
	<ul>
	<g:pieChart title='Surveys Per Site' colors="${colors}"
		labels="${labels}" fill="${'bg,s,efefef'}" dataType='simple' data='${values}' />
	<g:pieChart title='Surveys Per Surveyer' colors="${colors2}"
		labels="${labels2}" fill="${'bg,s,efefef'}" dataType='simple' data='${values2}' />		
	</ul>
</g:if>
<g:else>
<%
		def selectedSurveys=u56survey.Survey.findAllBySurveyer(session.user.login)
		def surveySizeTotal=u56survey.Survey.countBySurveyer(session.user.login)
		def surveySizeCompleted=u56survey.Survey.countBySurveyerAndCompleted(session.user.login,true)
		def surveySizeIncomplete=surveySizeTotal - surveySizeCompleted
		
		def colors3 = ['00ff00']
		
		def values3=[]
		values3 << surveySizeCompleted
		values3 << surveySizeIncomplete
		
		def labels3=[]
		labels3 << "Completed["+surveySizeCompleted+"]"
		labels3 << "Incomplete["+surveySizeIncomplete+"]"
 
 %>
	<g:pieChart title='Completed vs. Incomplete' colors="${colors3}"
		labels="${labels3}" fill="${'bg,s,efefef'}" dataType='simple' data='${values3}' />		

</g:else>
	<br/>