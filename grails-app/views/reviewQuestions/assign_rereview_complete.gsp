
<%@ page import="braintumorpathologyreview.ReviewQuestions" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

        <g:set var="entityName" value="${message(code: 'reviewQuestions.label', default: 'ReviewQuestions')}" />
        <title>Assign (Complete + Re-review)</title>
        <g:javascript library="prototype" />

    </head>
    <body>
<%
	def caseDetailsInstance = braintumorpathologyreview.CaseDetails.findByStudyid(reviewQuestionsInstance?.studyid)
	def dataEntryInstance = braintumorpathologyreview.DataEntry.findByStudyid(reviewQuestionsInstance?.studyid)

%>  
        <div class="body">
   
            <h1>Re-Assign / Replace existing review</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${reviewQuestionsInstance}">
            <div class="errors">
                <g:renderErrors bean="${reviewQuestionsInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post"
            	onsubmit="if ((document.getElementById('reviewer.id').value=='') || (GotError==true)){alert('No reviewer selected or Exceed the maximum reviews per case'); return false;} else {return true;}" >
                <g:hiddenField name="id" value="${reviewQuestionsInstance?.id}" />
                <g:hiddenField name="version" value="${reviewQuestionsInstance?.version}" />
                <div class="dialog">                   
                      
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="studyid">studyid</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'studyid', 'errors')}">
                                    <g:link controller="dataEntry" action="show_dataEntry_and_caseDetails" id="${caseDetailsInstance.id}">${reviewQuestionsInstance?.studyid}</g:link>
                                    (total reviews: ${dataEntryInstance.reviews.size()})
                                </td>
                            </tr>
							<%--
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="requests">Reviewer assigned (current)</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'reviewer', 'errors')}">
                                	${reviewQuestionsInstance?.reviewer}
                                </td>
                            </tr>
							 --%>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="requests">Reviewer assigned</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'reviewer', 'errors')}">
                                	<g:if test="${session.user.role=='admin' }">
                                	<%
										// do not include current reviewer
										//def uList=braintumorpathologyreview.User.findAllByRoleAndLoginNotEqual("reviewer", reviewQuestionsInstance.reviewer.login)
										def uList=braintumorpathologyreview.User.findAllByRole("reviewer")

									 %>
									  	<g:if test="${dataEntryInstance.reviews.size()==1 }">
	                                    	<g:select name="reviewer.id" 
	                                    			from="${uList}" 
	                                    			optionKey="id" 
	                                    			value="" 
	                                    			noSelection="['':'-Choose reviewer-']"
	                                    			onchange="if (this.value==\'${dataEntryInstance?.reviews[0].reviewer.id}\'){
	                                    						document.getElementById(\'reviewer_check\').style.color='blue';
	                                    						document.getElementById(\'reviewer_check\').innerHTML='1st reviewer (replace existing)';
	                                    					  } else {
	                                    					  	document.getElementById(\'reviewer_check\').innerHTML='';
	                                    					  }" />
	                                    			<br/><span id="reviewer_check" style="color:blue;"></span>
	                                    </g:if>
	                                    <g:elseif test="${dataEntryInstance.reviews.size()==2 }">
	                                    	<g:select name="reviewer.id" 
	                                    			from="${uList}" 
	                                    			optionKey="id" 
	                                    			value="" 
	                                    			noSelection="['':'-Choose reviewer-']"
	                                    			onchange="if (this.value==\'${dataEntryInstance?.reviews[0].reviewer.id}\'){
	                                    						document.getElementById(\'reviewer_check\').style.color='blue';
	                                    						document.getElementById(\'reviewer_check\').innerHTML='1st reviewer (replace existing)';
	                                    					  } else if (this.value==\'${dataEntryInstance?.reviews[1].reviewer.id}\'){
	                                    					  	document.getElementById(\'reviewer_check\').style.color='green';
	                                    						document.getElementById(\'reviewer_check\').innerHTML='2nd reviewer (replace existing)';
	                                    					  } else {
	                                    					  	document.getElementById(\'reviewer_check\').style.color='red';
	                                    					  	document.getElementById(\'reviewer_check\').innerHTML='Exceed max # of reviews - Error';
	                                    					  	
	                                    					  	GotError=true;
	                                    					  }" />
	                                    			<br/><span id="reviewer_check" style="color:blue;"></span>	                                    
                                    	</g:elseif>
                                    	<g:else>
	                                    	<g:select name="reviewer.id" 
	                                    			from="${uList}" 
	                                    			optionKey="id" 
	                                    			value="" 
	                                    			noSelection="['':'-Choose reviewer-']"
											/>                                    	
                                    	</g:else>
                                    </g:if>
                                    <g:elseif test="${session.user.role=='reviewer'}">
                                    	<label for="reviewer">${reviewQuestionsInstance.reviewer.name}</label>
                                    </g:elseif>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="requests">Notes to reviewer</label>
                                </td>                            
                                <td>
                                	<g:textArea id="notes" name="notes" value="${reviewQuestionsInstance?.notes}"  style="width:100%" />
                                </td>
							</tr>
<%--                             
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="requests">Status</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'reviewer', 'errors')}">
                                	<g:if test="${session.user.role=='admin' }">
                                    	<g:select name="status" from="${reviewStatus}" value="${reviewQuestionsInstance?.status}" />
                                    </g:if>
                                    <g:elseif test="${session.user.role=='reviewer' }">
                                    	<label for="status">${reviewQuestionsInstance.status}</label>
                                    </g:elseif>
                                </td>
                            </tr>
--%>
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                
                <g:hiddenField name="studyid" value="${reviewQuestionsInstance.studyid}" />
                
                    <span class="button"><g:actionSubmit class="save" action="doAssign_rereview_complete" value="Assign" /></span>
                    <%-- 
                    <g:if test="${session.user.role=='admin' }">
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    </g:if>
                     --%>
                </div>
            </g:form>
        </div>
    </body>
</html>
