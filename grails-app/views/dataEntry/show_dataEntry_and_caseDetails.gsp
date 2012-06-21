
<%@ page import="braintumorpathologyreview.ReviewQuestions" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'reviewQuestions.label', default: 'ReviewQuestions')}" />
        <title>Case Details by Study ID</title>
		<g:javascript library="prototype" />

    </head>
    <body>  
        <div class="nav">
        
            <span class="menuButton"><a class="home" href="${createLink(uri: '/dataEntry/firstpage')}">Home</a></span>
            <g:if test="${session.user.role=='admin' }">
            	<span class="menuButton"><g:link controller="dataEntry" class="list" action="list">List All Cases</g:link></span>
            <%-- <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span> --%>
            </g:if>           
        </div>
        <div class="body">
        <g:form>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            

            <div class="dialog">
                    <div class="buttons2">
                    	<%--<span class="button"><g:actionSubmit class="edit" action="returnToMain" value="Return to Main" /></span> --%>
                   		<g:if test="${session.user.role=='admin' }">
                   			<span class="button"><g:actionSubmit class="edit" action="edit_dataEntry_and_caseDetails" value="Edit Case Details" /></span>
                   		</g:if>
                    </div>                   
          
                  <table>
                  <caption style="color:black;text-align:right">
                  Study ID:&nbsp;&nbsp;${caseDetailsInstance.subject_initials}-${caseDetailsInstance.studyid}
                  <br/>Brain Tumor Type: <label style="color:blue">
                  	<g:if test="${caseDetailsInstance.gliomaOrMeningioma=='null' }">
                  		N/A
                  	</g:if>
                  	<g:else>
                  		${caseDetailsInstance.gliomaOrMeningioma }
                  	</g:else></label>
                  </caption>
                  <tr>
                    <td valign="top">
     
                    <table>
                        <tbody>

                        
<g:if test="${session.user.role=='admin' }">                          
                        <tr>
                        <td colspan="2">
                        
                         
                        <table id="ver-zebra"  style="width:100%">
                        	<caption>History</caption>
		                        <colgroup>
		                        	<col class="vzebra-odd" />
		                        	<col class="vzebra-even" />
		                        	<col class="vzebra-odd" />
		                        	<col class="vzebra-even" />
		                        </colgroup>
                            <%--                        	
                        	<thead>
                            <tr class="prop">

                                <th id="vzebra-comedy" scope="col"><label for="studyid">Study ID</label></th>
                                <th id="vzebra-adventure" scope="col"><label for="requests">Status</label></th>
                                <th id="vzebra-comedy" scope="col"><label for="requests">Reviewer</label></th>

		                        <th id="vzebra-adventure" scope="col">History</th>
		                    </tr>
		                    </thead>	                            
                             --%>

                            <tr class="prop">
                            <%--
                                <td valign="top">
									<g:if test="${session.user.role=='admin' }">
										<g:link controller="dataEntry" action="edit_dataEntry_and_caseDetails" id="${caseDetailsInstance.id}">${reviewQuestionsInstance.studyid}</g:link>
									</g:if>
                                    <g:else>
                                    	<label for="studyid">${reviewQuestionsInstance.studyid}</label>
                                    </g:else>
                                </td>
                                <td valign="top">
									<label for="casestatus">${dataEntryInstance.casestatus}</label>
                                </td>

                                <td valign="top">
									<label for="reviewer">${reviewQuestionsInstance.reviewer.name}</label>
                                </td>
                                --%>                                
		                        <td valign="top">
			                        <g:if test="${dataEntryInstance?.track_logs!='' && dataEntryInstance?.track_logs!=null}">
			                        <%
										dataEntryInstance?.track_logs.split("-=-").each{log->

											if (log!="null"){
												def matcher = (log =~ /.([0-9]+).([0-9]+).([0-9]+) ([0-9]+).([0-9]+). Completed _([0-9]+) ([0-9]+)_./)
												def matcher2 = (log =~ /.([0-9]+).([0-9]+).([0-9]+) ([0-9]+).([0-9]+). Completed.Rereview _([0-9]+) ([0-9]+)_./)
												if (matcher.matches()){
													def r=ReviewQuestions.get(matcher[0][7])		
													log=(log =~ /_([0-9]+) ([0-9]+)_/).replaceAll("<a href='../../reviewQuestions/show/${matcher[0][7]}'>${r.reviewer.name}</a>")
													log=(log =~ / ([0-9]+):([0-9]+):/).replaceAll(" ")
													
												}
												else if (matcher2.matches()){
													def r=ReviewQuestions.get(matcher2[0][7])
													log=(log =~ /_([0-9]+) ([0-9]+)_/).replaceAll("<a href='../../reviewQuestions/show/${matcher2[0][7]}'>${r.reviewer.name}</a>")
													log=(log =~ / ([0-9]+):([0-9]+):/).replaceAll(" ")
													

												}
												else{
													log=(log =~ / ([0-9]+):([0-9]+):/).replaceAll(" ")
													
												}
												log = log.replace("[", "")
												log = log.replace("]", "")
	
												if (log!="") out << log+"<br/>"
											}
										}
									 %>
									 </g:if>
									 <g:else>
									 	${dataEntryInstance?.track_logs}
									 </g:else>
									 <%--[<g:formatDate format="MM/dd/yyyy HH:mm" date="${dataEntryInstance.lastUpdated}" />: Last Updated] --%>
		                        </td>
                                
                            </tr>
                         </table>


                        
                        </td></tr>

</g:if>

                        
<%--
						<tr><td colspan="2">
	                    					<table>
				                        	<tbody>
				                        	<tr>
				                        	<td width="20%">All Review(s)</td>
				                        	<td>
<ul>
<g:each in="${dataEntryInstance.reviews}" var="r">
<li>
${r.gradingSubClassification}=${GradingSubClassification.get(r.gradingSubClassification) } by ${r.reviewer.name} with confidence (${r.levelOfDiagnosticCertainty })
</li>
</g:each>				                        	
</ul>
				                        	</td></tr>
				                        	</tbody>
				                        	</table>
						</td>
						</tr>
 
	                    <tr><td colspan="2">
	                    					<table>
				                        	<tbody>
				                        	<tr>
				                        	<td width="20%">Message(s)</td>
				                        	<td>
				                        	<g:each in="${dataEntryInstance.reviews}" var="r">
						                        <g:if test="${r.messages!='' && r.messages!=null}">
						                        <%
													r.messages.split("-").each{msg->
														if (msg!="") out << "${msg}<br/>"
						                        	}
												%>
												 </g:if>
												 <g:else>
												 	${r.messages}
												 </g:else>
				                        	</g:each>
				                        	</td></tr>
				                        	</tbody>
				                        	</table>
				        </td>
                        </tr>									                               
 --%>
                        
                        <tr><td colspan="2">
                        
                        
                        
                        
                        <table id="ver-minimalist" style="width:100%">
		                        <caption>Pathology</caption>
		                        <thead>
		                        <tr>
		                        	<th>Date</th>
			                        <th>Surgery Type</th>
			                        <th>Review Type</th>
									<g:if test="${session.user.role=='admin' }"><th>SurgPathNum</th></g:if>
			                        <th>Dx</th>	                            
			                        <th>Institute</th>	                            
		                            <th>Pathology report (PDF)</th>
			                    </tr>
			                    </thead>
			                    <tbody>
			 	                <%def i=0%>
								<g:while test="${i < 6}">
			    				<%i++%>
								<g:if test="${caseDetailsInstance.('pshow'+i) }">
								<tr>
				                    <td>${caseDetailsInstance.('surgeryDate'+i) }<%--(<g:formatDate format="yyyy-MM-dd" date="${caseDetailsInstance?.('pdate'+i)}" />) --%></td>
				                    <td>${caseDetailsInstance.('surgeryType'+i) }</td>
				                    <td>${caseDetailsInstance.('reviewType'+i) }</td>
				                    	<g:if test="${session.user.role=='admin' }"><td>${caseDetailsInstance.('SurgPathNum'+i) }</td></g:if>
				                    <td>
				                    	<g:if test="${caseDetailsInstance.('Diagnosis'+i).size() > 2}">
				                    		${caseDetailsInstance.('Diagnosis'+i) }
				                    	</g:if>
				                    	<g:elseif test="${caseDetailsInstance.('Diagnosis'+i)}">
				                    		${caseDetailsInstance.('Diagnosis'+i) } : ${GradingSubClassification.get(caseDetailsInstance.('Diagnosis'+i)) }
				                    	</g:elseif>
				                    </td>
				                    <td>${caseDetailsInstance.('Site'+i) }</td>
				                    <td>
				                    	<g:if test="${caseDetailsInstance?.('ReportUrl'+i)!='' && caseDetailsInstance?.('ReportUrl'+i)!=null}">
		                        		<%
											def sp=caseDetailsInstance?.('ReportUrl'+i).split("\\\\")
											def spSize=sp.size()
											def pathFileName=sp[spSize-1]
											//out << pathFileName
											
											def actualFileLocation=resource(dir:'/pdf', file:''+pathFileName)
											def actualFileLocation2=resource(dir:'/pdf', file:''+pathFileName, absolute:"true")
											htmltags = "<a href=# onclick=document.getElementById(&quot;ComboExample&quot;).style.display=&quot;none&quot;>X[Close]</a><br/>"
											htmltags +="<iframe src=&quot;${actualFileLocation}&quot; width=&quot;100%&quot; height=&quot;320&quot; scrolling=&quot;no&quot; frameborder=&quot;0&quot; style=&quot;border:solid #0f0 0.1em&quot;></iframe><br/><br/>"
		
										 %>
					                    	<g:if test="${pathFileName.contains('.pdf')}">
					                    		<a href="#" onclick="document.getElementById('ComboExample').style.display='block';document.getElementById('ComboExample').innerHTML='${htmltags}'"><img border="0" src="${resource(dir:'images',file:'file_icon_pdf.gif')}"/></a>
					                    		<%--<a href="#" onclick="document.getElementById('ComboExample').innerHTML=''">X</a>
					                    		<a target="_path${i}" href="${actualFileLocation}">PopUp</a> --%>
					                    	</g:if>
					                    	<g:else>
					                    		<label>Not Available</label>
					                    	</g:else>
				                    	
				                    	</g:if>
				                    	<g:else>
					                    		<label>Not Available</label>
					                    </g:else>
				                    </td>
								</tr>
								</g:if>
			 					</g:while>
		                        </tbody>                                  
                    </table>
                    
                    
                    
                    </td></tr>
                    <tr><td valign="top">
                    
                    
                    
                    
                    <table id="ver-minimalist" style="width:100%">
                    	<caption>MRI</caption>
                    	<thead>
                       <tr class="prop">
                       		<th>Date</th>
                            <th>MRI Summary</th>
                            <th>MRI report (PDF)</th>

                        </tr>
                        </thead>
 						<tbody>
		                <%i=0%>
						<g:while test="${i < 2}">
	    				<%i++%>                        
 						<g:if test="${caseDetailsInstance.('mshow'+i) }">
 						<tr>
                         	<td>${caseDetailsInstance.('MRIDate'+i) }<%--<g:formatDate format="yyyy-MM-dd" date="${caseDetailsInstance?.('mdate'+i)}" />) --%></td>
                        	<td>${caseDetailsInstance.('MRISummary'+i) }</td>
                        	<td>
                        		<g:if test="${caseDetailsInstance?.('MRIReport'+i)!='' && caseDetailsInstance?.('MRIReport'+i)!=null}">
                        		<%
									def sp=caseDetailsInstance?.('MRIReport'+i).split("\\\\")
									def spSize=sp.size()
									def mriFileName=sp[spSize-1]
									//out << mriFileName
									//def actualFileLocation_mri="M:\\dept\\Dept_CliRes\\Brain Tumor (Egan)\\Slide Requests\\Scanned Documents\\"+mriFileName
									//def actualFileLocation_mri=resource(dir:'files/'+'admin'+'/'+caseDetailsInstance.studyid+'/mri', file:''+mriFileName)
									def actualFileLocation_mri=resource(dir:'pdf', file:''+mriFileName)
									def actualFileLocation_mri2=resource(dir:'/pdf', file:''+mriFileName, absolute:"true")
									htmltags = "<a href=# onclick=document.getElementById(&quot;ComboExample2&quot;).style.display=&quot;none&quot;>X[Close]</a><br/>"
									htmltags +="<iframe src=&quot;${actualFileLocation_mri}&quot; width=&quot;100%&quot; height=&quot;320&quot; scrolling=&quot;no&quot; frameborder=&quot;no&quot; style=&quot;border:solid #00f 0.1em&quot;></iframe><br/><br/>"
								 %>
									 <g:if test="${mriFileName.contains('.pdf')}">								 
	                        			<a href="#" onclick="document.getElementById('ComboExample2').style.display='block';document.getElementById('ComboExample2').innerHTML='${htmltags}'"><img border="0" src="${resource(dir:'images',file:'file_icon_pdf.gif')}"/></a>
	                        			<%--<a href="#" onclick="document.getElementById('ComboExample2').innerHTML=''">X</a>
	                        			<a target="${'_mri'+i }" href="${actualFileLocation_mri}">PopUp</a> --%>
	                        		</g:if>
	                        		<g:else>
	                        			<label>Not Available</label>
	                        		</g:else>
                        		</g:if>
                        		<g:else>
					              		<label>Not Available</label>
					            </g:else>
                        	</td>
 						</tr>
 						</g:if>
 						</g:while>

 						</tbody>
 
                       </table>
                       <br/><br/>
<table><caption>Case Note</caption>
<tr>
<td>
	<g:if test="${caseDetailsInstance.case_note!=''}">
	${caseDetailsInstance.case_note}
	</g:if>
	<g:else>
		<label>&nbsp;</label>
	</g:else>
</td>
</tr>
</table>                           
                       
                       
                       
                       
                       </td>
                    <td valign="top">
                    
                    
                    
                    <table id="ver-minimalist" style="width:100%">
                		<caption>Slides</caption>
                		<thead>
                        <tr class="prop">
                        		<th>Surgery Type</th>
                        		<th>Stain</th>
                        		<th>Aperio Image</th>
                        </tr>
                        </thead>
                        <tbody>
 		                <%i=0%>
						<g:while test="${i < 6}">
	    				<%i++%>
	    				<g:if test="${caseDetailsInstance.('sshow'+i) }">   
	    				<tr>
                        	<td>${caseDetailsInstance.('SurgType'+i) }</td>
                        	<td>${caseDetailsInstance.('StainType'+i) }</td>
                        	<td>
                        		<g:if test="${caseDetailsInstance?.('imageid'+i)!='' && caseDetailsInstance?.('imageid'+i)!=null}">
                        		<%--${caseDetailsInstance.('Status'+i) } --%>
                        		<%
									def sp=caseDetailsInstance?.('imageid'+i).split("\\\\")
									def spSize=sp.size()
									def svsFileName=sp[spSize-1]
									def imageid= svsFileName.split("\\.")
									def url=""
									if (imageid[0] ==~ /\d+/ ){
										url = "http://10.6.20.46/imageserver/@"+imageid[0]+"/view.apml"
										url2 = "http://10.6.20.46/imageserver/@"+imageid[0]
										htmltags = "<a href=# onclick=document.getElementById(&quot;_webscope"+i+"&quot;).style.display=&quot;none&quot;>X[Close]</a><br/>"
										htmltags +="<iframe src=&quot;${url2}&quot; width=&quot;100%&quot; height=&quot;500&quot; scrolling=&quot;no&quot; frameborder=&quot;no&quot; style=&quot;border:solid #f00 0.1em&quot;></iframe><br/><br/>"
										%>
										<a href="#" onclick="document.getElementById(&quot;${'_webscope'+i}&quot;).style.display='block';document.getElementById(&quot;${'_webscope'+i}&quot;).innerHTML='${htmltags}'"><img border="0" src="${resource(dir:'images',file:'zoom_draw.png')}"/></a>
										<%-- <a href="#" onclick="document.getElementById(&quot;${'_webscope'+i}&quot;).style.display='none'">X</a> --%>
										<%
										//out << "<a target=_webscope"+i+" href='http://10.6.20.46/imageserver/@"+imageid[0]+"/view.apml'>PopUp</a>"
									}
									else if (caseDetailsInstance.('imageid'+i).trim()=='Available on Request')
										out << "Available on Request"
									else
										out << "Available on Request"
								 %>
								 </g:if>
								 <g:else>
								 	<label>Available on Request</label>
								 </g:else>
                        	</td>
	    				</tr>
	    				</g:if>                     
 						</g:while>
						</tbody>
                    </table>
                    
                    
                    
                    </td>
                       
                       </tr>
                        </tbody>
                    </table>
                    </td>
</tr>



                    </table>

            </div>
<div id="ComboExample"></div>
<div id="ComboExample2"></div>
<div id="_webscope1"></div>
<div id="_webscope2"></div>
<div id="_webscope3"></div>
<div id="_webscope4"></div>
<div id="_webscope5"></div>
<div id="_webscope6"></div>
 

 			<g:hiddenField name="id" value="${caseDetailsInstance?.id}" />   
            </g:form>
        </div>
    </body>
</html>
