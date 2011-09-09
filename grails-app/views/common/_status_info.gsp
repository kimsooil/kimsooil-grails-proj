<g:if test="${surveyInstance?.dateCreated}">
&nbsp;&nbsp;&nbsp;(Created: <g:formatDate date="${surveyInstance?.dateCreated}" type="datetime" style="SHORT" timeStyle="SHORT"/>, <g:if test="${surveyInstance?.dateCompleted}">Completed: <g:formatDate date="${surveyInstance?.dateCompleted}" type="datetime" style="SHORT" timeStyle="SHORT"/></g:if><g:else>Updated: <g:formatDate date="${surveyInstance?.lastUpdated}" type="datetime" style="SHORT" timeStyle="SHORT"/></g:else>)
<br/>
</g:if>
<g:javascript>
<g:if test="${dob }">
var ageCalculated = CalAge_precise(${dob[java.util.Calendar.DATE] ? dob[java.util.Calendar.DATE]: 1}, ${dob[java.util.Calendar.MONTH] ? dob[java.util.Calendar.MONTH]+1 : 1}, ${dob[java.util.Calendar.YEAR] ? dob[java.util.Calendar.YEAR] : 1900});
var dob_date=${dob[java.util.Calendar.DATE] ? dob[java.util.Calendar.DATE]: 1};
var dob_month=${dob[java.util.Calendar.MONTH] ? dob[java.util.Calendar.MONTH]+1 : 1};
var dob_year=${dob[java.util.Calendar.YEAR] ? dob[java.util.Calendar.YEAR] : 1900};

</g:if>
<g:else>
var ageCalculated = CalAge_precise(1, 1, 1900);
</g:else>

var today = new Date();
var today_date=today.getDate(); // 1-31
var today_month=today.getMonth()+1; //0-11
var today_year=today.getFullYear(); // 4 digits

//alert(ageCalculated);
</g:javascript>