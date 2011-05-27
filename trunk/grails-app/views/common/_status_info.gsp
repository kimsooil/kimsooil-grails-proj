&nbsp;&nbsp;&nbsp;(Created: <g:formatDate date="${surveyInstance?.dateCreated}" type="datetime" style="SHORT" timeStyle="SHORT"/>, Updated: <g:formatDate date="${surveyInstance?.lastUpdated}" type="datetime" style="SHORT" timeStyle="SHORT"/>)
<br/>
<g:javascript>
var ageCalculated = CalAge(${dob[java.util.Calendar.DATE]}, ${dob[java.util.Calendar.MONTH]}, ${dob[java.util.Calendar.YEAR]});
//alert(ageCalculated);
</g:javascript>