
<%@ page import="braintumorpathologyreview.DataEntry" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dataEntry.label', default: 'DataEntry')}" />
        <title>Southeastern Regional Study of Adult Brain Tumors</title>
        <META HTTP-EQUIV="refresh" CONTENT="300">

    </head>
    <body>
<g:if test="${session?.user?.role=='admin'}">    
		        <div class="nav">
		           <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
		            <span class="menuButton"><g:link class="list" action="list">List All Cases</g:link></span>
		            <span class="menuButton"><g:link class="create" action="create_dataEntry_and_caseDetails">Add New Case</g:link></span>
		        </div>
		        <div class="body">
 
		            <h1>Administrator's view</h1>
		            <%--
		            <g:if test="${flash.message}">
			            <div class="message">${flash.message}</div>
		            </g:if>
		             --%>
				            <table id="gradient-style">
				            	<thead>
				            	</thead>
				            	<tbody>
									<tr><td><g:link action="list_unassigned">Unassigned</g:link> (${unassigned})</td></tr>
									<tr><td><g:link action="list_new_inprogress">New Assignment / In Progress</g:link> (${newassignment} / ${in_progress})</td></tr>
									<tr><td><g:link action="list_needs_info">Needs Additional Info</g:link> (${needs_info})</td></tr>
									<tr><td><g:link action="list_completed_rereview_v2">Completed / Re-review Needed</g:link> (${complete} / ${re_review})</td></tr>
								</tbody>
							</table>
<%-- 
     def labels = ['Unassigned('+unassigned+')','New('+newassignment+')','In Progress('+in_progress+')', 'Needs_Info('+needs_info+')', 'Complete('+complete+')', 'Re-review('+re_review+')']   
     def colors = ['ff6600','00ff00','0000ff','802a2a', '000000', 'ff0000']   
     def values = [unassigned, newassignment,in_progress, needs_info, complete, re_review]   
 <g:pieChart size="${[450,200]}" data="${values}" type="3d" labels="${labels}" colors="${colors}" pie="" title="Review Stats"></g:pieChart>

 --%>
<%--
<div class="list">
	<FORM>
	<INPUT TYPE="button" onClick="history.go(0)" VALUE="Refresh"> (Or it will be reloaded every 5 minutes)
	</FORM>
</div>
 --%>		        
</g:if>
<g:elseif test="${session?.user?.role=='reviewer'}">
		        <div class="nav">
		        <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
		        <span class="menuButton"><g:link class="edit" action="contact">Email Coordinator</g:link></span>
		        </div>
<div class="body">
 


                        <table id="box-table-a">
                        	<thead></thead>
                        	<tbody>
		                    	<tr><td><g:link action="secondpage" params="[listing:'not-completed']">New Assignments / In Progress: (${num_not_completed})</g:link></td></tr>
		                    	<tr><td><g:link action="secondpage" params="[listing:'completed']">Complete: (${num_completed})</g:link></td></tr>
	                    	</tbody>
	                    </table>
<%--   
     def labels2 = ['Done('+num_completed+')', 'To Do('+num_not_completed+')']   
     def colors2 = ['00ff00', 'ff0000']   
     def values2 = [num_completed, num_not_completed]   
   
 <g:pieChart data="${values2}" type="3d" labels="${labels2}" colors="${colors2}" pie="" title="Review Stats"></g:pieChart>
 --%>


</div>

</g:elseif>
<g:else>
<div style="padding:1em 1em 2em 1em"><br/>&nbsp;&nbsp;You don't have proper role. <g:link controller="user" action="login">Login first.</g:link></div>
</g:else>        
        
    </body>
</html>
