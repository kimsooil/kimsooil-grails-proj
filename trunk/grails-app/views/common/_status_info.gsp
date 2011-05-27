&nbsp;&nbsp;&nbsp;(Created: <g:formatDate date="${surveyInstance?.dateCreated}" type="datetime" style="SHORT" timeStyle="SHORT"/>, Updated: <g:formatDate date="${surveyInstance?.lastUpdated}" type="datetime" style="SHORT" timeStyle="SHORT"/>)
<br/>
<g:javascript>
<g:if test="${dob }">
var ageCalculated = CalAge(${dob[java.util.Calendar.DATE] ? dob[java.util.Calendar.DATE]: 1}, ${dob[java.util.Calendar.MONTH] ? dob[java.util.Calendar.MONTH] : 1}, ${dob[java.util.Calendar.YEAR] ? dob[java.util.Calendar.YEAR] : 1900});
</g:if>
<g:else>
var ageCalculated = CalAge(1, 1, 1900);
</g:else>
//alert(ageCalculated);
</g:javascript>