
<%
new u56survey.Survey().properties.each{
//if (it.key!='constraints' && it.key!='id' && it.key!='version') out << it.key+"("+it.value+")<br/>"
%>	
<g:if test="${it.key!='constraints' && it.key!='id' && it.key!='version' && it.key!='metaClass'  && it.key!='dirtyPropertyNames' && surveyInstance?.(it.key).toString()!='null'}">
<label>${it.key}=${surveyInstance.(it.key)}</label><br/>
<%--<g:hiddenField name="${it.key}" value="${surveyInstance.(it.key).toString()}" />--%>

</g:if>
<%
}
