
<%@ page import="braintumorpathologyreview.ReviewQuestions" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'reviewQuestions.label', default: 'ReviewQuestions')}" />
        <title>Complete Review Questions</title>
        <g:javascript library="prototype" />
		<g:javascript library="application" />
		<modalbox:modalIncludes />
		<g:javascript src="validate-reviewQuestionsForm.js" />
		
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/dataEntry/firstpage')}">Home</a></span>
            <g:if test="${session.user.role=='admin' }">
            <%--<span class="menuButton"><g:link controller="dataEntry" class="list" action="list">List all cases</g:link></span> --%>
            </g:if>
        </div>

        <div class="body">
            <%--<h1>Form - please complete or request more info</h1>
            <div class="message">Please complete or request more info</div> --%>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            
            <g:hasErrors bean="${reviewQuestionsInstance}">
            <div class="errors">
                <g:renderErrors bean="${reviewQuestionsInstance}" as="list" />
            </div>
            </g:hasErrors>

                <div class="dialog">
                <g:form method="post" >
                  <g:hiddenField name="id" value="${reviewQuestionsInstance?.id}" />
                  <g:hiddenField name="version" value="${reviewQuestionsInstance?.version}" />

                  <table>
                  <tr>
                    <td valign="top">
     
                    <table>
					<caption style="color:black;text-align:right">Study ID:&nbsp;&nbsp;${caseDetailsInstance?.subject_initials}-${reviewQuestionsInstance.studyid}
					<g:if test="${session.user.role=='admin' }">
						<br/>Type: <label style="color:blue">${caseDetailsInstance.gliomaOrMeningioma }</label>
					</g:if>
                  	<br/>Status: <label style="color:red">${reviewQuestionsInstance.status}</label>
                  	</caption>
                        <tbody>
<g:if test="${session.user.role=='admin' }">   
                        <tr><td colspan="2">
                        <table id="ver-zebra"  style="width:100%">
                        	<caption>History</caption>
		                        <colgroup>
		                        	<col class="vzebra-odd" />
		                        	<col class="vzebra-even" />
		                        	<col class="vzebra-odd" />
		                        	<col class="vzebra-even" />
		                        </colgroup>

                            <tr class="prop">
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
													//if (log!="") out << log+"<br/>"
												}
												else if (matcher2.matches()){
													def r=ReviewQuestions.get(matcher2[0][7])
													log=(log =~ /_([0-9]+) ([0-9]+)_/).replaceAll("<a href='../../reviewQuestions/show/${matcher2[0][7]}'>${r.reviewer.name}</a>")
													log=(log =~ / ([0-9]+):([0-9]+):/).replaceAll(" ")
													//if (log!="") out << log+"<br/>"

												}
												else{
													log=(log =~ / ([0-9]+):([0-9]+):/).replaceAll(" ")
													//if (log!="") out << log+"<br/>"
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
                        
						<g:if test="${dataEntryInstance.reviews.size() > 1}">                        
						<tr><td colspan="2">
	                    					<table>
				                        	<tbody>
				                        	<tr>
				                        	<td width="20%">Other Review(s)</td>
				                        	<td>
												<ul>
												<g:each in="${dataEntryInstance.reviews}" var="r">
												<g:if test="${r.id!=reviewQuestionsInstance.id}">
												<li>
												<%--<g:link action="show" id="${r.id }">${r.gradingSubClassification}=${GradingSubClassification.get(r.gradingSubClassification) }</g:link> by ${r.reviewer.name} with confidence (${r.levelOfDiagnosticCertainty }) --%>
												${r.gradingSubClassification}=${GradingSubClassification.get(r.gradingSubClassification) } by ${r.reviewer.name}
												</li>
												</g:if>
												</g:each>				                        	
												</ul>
				                        	</td></tr>
				                        	</tbody>
				                        	</table>
						</td>
						</tr>
						</g:if>
						
</g:if>
<g:if test="${session.user.role=='reviewer' && reviewQuestionsInstance?.messages!='' && reviewQuestionsInstance?.messages!=null}">
												
	                    <tr><td colspan="2">
	                    					<table>
				                        	<tbody>
				                        	<tr>
				                        	<td width="20%" valign="top">Message(s)</td>
				                        	<td>
						                        <%
													reviewQuestionsInstance?.messages.split("-=-").each{msg->
														msg = msg.replace("[", "")
														msg = msg.replace("]", "")
														msg=(msg =~ / ([0-9]+):([0-9]+):/).replaceAll(" ")
														if (msg!="") out << "${msg}<br/>"
						                        	}
												%>
				                        	</td></tr>
				                        	</tbody>
				                        	</table>
				        </td>
                        </tr>									                               
</g:if>                        
                      
						<tr>
							<td colspan="2">
                        <table id="ver-minimalist" style="width:100%">
		                        <caption>Pathology</caption>
		                        <thead>
		                        <tr>
		                        	<th>Surgery Date</th>
			                        <th>Surgery Type</th>
			                        <th>Review Type</th>
									<g:if test="${session.user.role=='admin' }"><th>SurgPathNum</th></g:if>
			                        <th>Diagnosis</th>	                            
			                        <th>Site</th>	                            
		                            <th>Pathology report (PDF)</th>
			                    </tr>
			                    </thead>
			                    <tbody>
			 	                <%def i=0%>
								<g:while test="${i < 6}">
			    				<%i++%>
			    				<g:if test="${caseDetailsInstance?.('pshow'+i) }">
								<tr>
				                    <td>${caseDetailsInstance.('surgeryDate'+i) }</td>
				                    <td>${caseDetailsInstance.('surgeryType'+i) }</td>
				                    <td>${caseDetailsInstance.('reviewType'+i) }</td>
				                    <g:if test="${session.user.role=='admin' }"><td>${caseDetailsInstance.('SurgPathNum'+i) }</td></g:if>
				                    <td>${caseDetailsInstance.('Diagnosis'+i) }</td>
				                    <td>${caseDetailsInstance.('Site'+i) }</td>
				                    <td>
				                    	<g:if test="${caseDetailsInstance?.('ReportUrl'+i)!='' && caseDetailsInstance?.('ReportUrl'+i)!=null}">
		                        		<%
											def sp=caseDetailsInstance?.('ReportUrl'+i).split("\\\\")
											def spSize=sp.size()
											def pathFileName=sp[spSize-1]
											
											//def actualFileLocation="M:\\dept\\Dept_CliRes\\Brain Tumor (Egan)\\Slide Requests\\Scanned Documents\\"+pathFileName
											//def actualFileLocation=resource(dir:'files/'+'admin'+'/'+caseDetailsInstance.studyid+'/path', file:''+pathFileName)
											def actualFileLocation=resource(dir:'/pdf', file:''+pathFileName)
											def actualFileLocation2=resource(dir:'/pdf', file:''+pathFileName, absolute:"true")
											htmltags = "<a href=# onclick=document.getElementById(&quot;ComboExample&quot;).style.display=&quot;none&quot;>X[Close]</a><br/>"
											htmltags +="<iframe src=&quot;${actualFileLocation}&quot; width=&quot;100%&quot; height=&quot;320&quot; scrolling=&quot;no&quot; frameborder=&quot;0&quot; style=&quot;border:solid #0f0 0.1em&quot;></iframe><br/>"
		
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

		                    </td>
						</tr>                        
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
 						<g:if test="${caseDetailsInstance?.('mshow'+i) }">
 						<tr>
                         	<td>${caseDetailsInstance.('MRIDate'+i) }</td>
                        	<td>${caseDetailsInstance.('MRISummary'+i) }</td>
                        	<td>
                        		<g:if test="${caseDetailsInstance?.('MRIReport'+i)!='' && caseDetailsInstance?.('MRIReport'+i)!=null}">
                        		<%
									def sp=caseDetailsInstance?.('MRIReport'+i).split("\\\\")
									def spSize=sp.size()
									def mriFileName=sp[spSize-1]
									//def actualFileLocation_mri="M:\\dept\\Dept_CliRes\\Brain Tumor (Egan)\\Slide Requests\\Scanned Documents\\"+mriFileName
									//def actualFileLocation_mri=resource(dir:'files/'+'admin'+'/'+caseDetailsInstance.studyid+'/mri', file:''+mriFileName)
									def actualFileLocation_mri=resource(dir:'pdf', file:''+mriFileName)
									def actualFileLocation_mri2=resource(dir:'/pdf', file:''+mriFileName, absolute:"true")
									htmltags = "<a href=# onclick=document.getElementById(&quot;ComboExample2&quot;).style.display=&quot;none&quot;>X[Close]</a><br/>"
									htmltags +="<iframe src=&quot;${actualFileLocation_mri}&quot; width=&quot;100%&quot; height=&quot;320&quot; scrolling=&quot;no&quot; frameborder=&quot;no&quot; style=&quot;border:solid #00f 0.1em&quot;></iframe><br/>"
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
	<g:if test="${caseDetailsInstance?.case_note!=''}">
	${caseDetailsInstance?.case_note}
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
                        		<th>Status</th>
                        </tr>
                        </thead>
                        <tbody>
 		                <%i=0%>
						<g:while test="${i < 6}">
	    				<%i++%>
	    				<g:if test="${caseDetailsInstance?.('sshow'+i) }">   
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
									if (imageid[0] ==~ /\d+/ ){
										url = "http://10.6.20.46/imageserver/@"+imageid[0]+"/view.apml"
										url2 = "http://10.6.20.46/imageserver/@"+imageid[0]
										htmltags = "<a href=# onclick=document.getElementById(&quot;_webscope"+i+"&quot;).style.display=&quot;none&quot;>X[Close]</a><br/>"
										htmltags +="<iframe src=&quot;${url2}&quot; width=&quot;100%&quot; height=&quot;500&quot; scrolling=&quot;no&quot; frameborder=&quot;no&quot; style=&quot;border:solid #f00 0.1em&quot;></iframe><br/>"
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
<tr><td>
<div id="ComboExample"></div>
<div id="ComboExample2"></div>
<div id="_webscope1"></div>
<div id="_webscope2"></div>
<div id="_webscope3"></div>
<div id="_webscope4"></div>
<div id="_webscope5"></div>
<div id="_webscope6"></div>
</td></tr>

<tr>                    
                    <td>
                    	<table id="one-column-emphasis">
                    	<caption style="color:blue">&nbsp;&nbsp;Neuropathology Review</caption>
                    	<tr>
                    	<td valign="top" style="width:50%">
                    	    <table>                                                                                                     
                    	    <colgroup>
                    	    	<col class="oce-first" />
                    	    </colgroup>                                                                                                     
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="astrocyticPhenotype"><g:message code="reviewQuestions.astrocyticPhenotype.label" default="Astrocytic Phenotype" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'astrocyticPhenotype', 'errors')}">
                                    <g:checkBox name="astrocyticPhenotype" value="${reviewQuestionsInstance?.astrocyticPhenotype}" />
                                </td>
                            </tr>
                         
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="oligodendroglialPhenotype"><g:message code="reviewQuestions.oligodendroglialPhenotype.label" default="Oligodendroglial Phenotype" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'oligodendroglialPhenotype', 'errors')}">
                                    <g:checkBox name="oligodendroglialPhenotype" value="${reviewQuestionsInstance?.oligodendroglialPhenotype}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="mitoses"><g:message code="reviewQuestions.mitoses.label" default="Mitoses" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'mitoses', 'errors')}">
                                    <g:checkBox name="mitoses" value="${reviewQuestionsInstance?.mitoses}" />
                                </td>
                            </tr>
                           <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="necrosis"><g:message code="reviewQuestions.necrosis.label" default="Necrosis" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'Necrosis', 'errors')}">
                                    
                                    <g:checkBox id="necrosis" name="necrosis" value="${reviewQuestionsInstance?.necrosis}" onclick="toggleNecrosis()"/>
                                    <span id="necrosisDiv">
                                    	<g:if test="document.getElementById('necrosis').checked">
                                    	&nbsp;&nbsp;&nbsp;<label>Specify:</label> <g:select disabled="${reviewQuestionsInstance?.necrosis ? '':'true' }" id="NecrosisScale" name="NecrosisScale" from="${VPscale}" value="${reviewQuestionsInstance?.NecrosisScale}"  noSelection="${['null':'Select One...']}"/>
                                    	</g:if>
                                    </span>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="pseudopalisadingNecrosis">Pseudopalisading Necrosis</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'pseudopalisadingNecrosis', 'errors')}">
                                    <g:checkBox name="pseudopalisadingNecrosis" value="${reviewQuestionsInstance?.pseudopalisadingNecrosis}" />
                                </td>
                            </tr>                        
<%--                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="invasion"><g:message code="reviewQuestions.invasion.label" default="Invasion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'invasion', 'errors')}">
                                    <g:checkBox name="invasion" value="${reviewQuestionsInstance?.invasion}" />
                                </td>
                            </tr>
 --%>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="vascularProliferation"><g:message code="reviewQuestions.vascularProliferation.label" default="Vascular Proliferation" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'vascularProliferation', 'errors')}">
                                    <g:checkBox id="vascularProliferation" name="vascularProliferation" value="${reviewQuestionsInstance?.vascularProliferation}" onclick="toggleVP()"/>
                                    <span id="VPscaleDiv">
                                    	<g:if test="document.getElementById('vascularProliferation').checked">
                                    	&nbsp;&nbsp;&nbsp;<label>Specify:</label> <g:select disabled="${reviewQuestionsInstance?.vascularProliferation ? '':'true' }" id="VPscale" name="VPscale" from="${VPscale}" value="${reviewQuestionsInstance?.VPscale}"  noSelection="${['null':'Select One...']}"/>
                                    	</g:if>
                                    </span>
                                    
                                </td>
                            </tr>
                         
                           </table>
                           </td>

                            <td valign="top" style="width:50%">
                            <table>
                    	    <colgroup>
                    	    	<col class="oce-first" />
                    	    </colgroup>                                                                                                     

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="perivascularInflammation"><g:message code="reviewQuestions.perivascularInflammation.label" default="Perivascular Inflammation" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'perivascularInflammation', 'errors')}">
                                    <g:checkBox name="perivascularInflammation" value="${reviewQuestionsInstance?.perivascularInflammation}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="rosenthalFibers"><g:message code="reviewQuestions.rosenthalFibers.label" default="Rosenthal Fibers" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'rosenthalFibers', 'errors')}">
                                    <g:checkBox name="rosenthalFibers" value="${reviewQuestionsInstance?.rosenthalFibers}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="EGBS"><g:message code="reviewQuestions.EGBS.label" default="EGBS" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'EGBS', 'errors')}">
                                    <g:checkBox name="EGBS" value="${reviewQuestionsInstance?.EGBS}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="mini_gemistocytesPresent"><g:message code="reviewQuestions.mini_gemistocytesPresent.label" default="Minigemistocytes Present" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'mini_gemistocytesPresent', 'errors')}">
                                    <g:checkBox name="mini_gemistocytesPresent" value="${reviewQuestionsInstance?.mini_gemistocytesPresent}" />
                                </td>
                            </tr>
<%--                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="artifactPresentOrBadSection"><g:message code="reviewQuestions.artifactPresentOrBadSection.label" default="Artifact Present Or Bad Section" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'artifactPresentOrBadSection', 'errors')}">
                                    <g:checkBox name="artifactPresentOrBadSection" value="${reviewQuestionsInstance?.artifactPresentOrBadSection}" />
                                </td>
                            </tr>
 --%>                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="giantCellsPresent">Giant Cells Present</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'giantCellsPresent', 'errors')}">
                                    <g:checkBox name="giantCellsPresent" value="${reviewQuestionsInstance?.giantCellsPresent}" />
                                </td>
                            </tr>                            
                            
                            </table>
                            </td></tr>
                            <tr><td colspan="2">
		                            <table>
		                    	    <colgroup>
		                    	    	<col class="oce-first" />
		                    	    </colgroup>                                                                                                     
			                            <tr class="prop2">
			                                <td valign="top" class="name">
			                                  <label for="gradingSubClassification"><g:message code="reviewQuestions.gradingSubClassification.label" default="Grading Sub Classification" /></label>
			                                </td>
			                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'gradingSubClassification', 'errors')}">
			                                    <%
												def rg = reviewQuestionsInstance?.gradingSubClassification
												def dxOptGrp="<select id='gradingSubClassification' name='gradingSubClassification' onchange='checkIfMoreOptions()'>"
												
												 dxOptGrp +="<option value='null' selected='selected'>Select One...</option>"
												def selectedOrNot=""
												GradingSubClassification.each{dx->
													if (rg==dx.key) selectedOrNot="selected" else selectedOrNot="" 
													if (dx.key.length()==1)
														dxOptGrp+= "<optgroup style='font-style:normal;' label='"+dx.key+". "+dx.value+"'/>"
													else
														dxOptGrp+="<option value='"+dx.key+"' "+selectedOrNot+">"+dx.key+" : "+dx.value+"</option>"
													//out << dx.key+":"+dx.value
													if (dx.key=='9') dxOptGrp+="<option value='"+dx.key+"' "+selectedOrNot+">"+dx.key+" : "+dx.value+"</option>"
			                                    }
												dxOptGrp +="</select>"
												out << dxOptGrp
												 %>

			                            <%
											def rgCon = (rg=='1E' || rg=='1F' || rg=='1G' || rg=='1J')
											//def gemistocytic = reviewQuestionsInstance?.gemistocytic ? "Yes" : "No"
										 %>
			                            <span id="gemistocyticDiv" style="display:${rgCon ? 'inline' : 'none'}"><br/>
			                                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label id="gemistocyticLabel" name="gemistocyticLabel" for="gemistocytic">if 1E or 1F or 1G or 1J: Gemistocytic?</label>
			                                    <%--<g:select id="gemistocyticSelected" name="gemistocyticSelected" from="${GemistocyticOptions }" value="${reviewQuestionsInstance?.gemistocytic}" noSelection="${['null':'Select One...']}"/> --%>
			                                    <g:select id="gemistocytic" name="gemistocytic" from="${GemistocyticOptions }" value="${reviewQuestionsInstance?.gemistocytic}" noSelection="${['null':'Select One...']}"/>
			                            </span>
			
										<%
											def rgCon2 = (rg=='2A' || rg=='2B' || rg=='2C')
										 %>
										<span id="extentOligoDiv" style="display:${rgCon2 ? 'inline' : 'none'}"><br/>
			                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label for="extentOligo">if 2A-2C: Extent of Oligo component?</label>
			                                    <g:select id="extentOligo" name="extentOligo" from="${ExtentOligoList}" value="${reviewQuestionsInstance?.extentOligo}"  noSelection="${['null':'Select One...']}"/>
										</span>
										<%
											def rgCon3 =(rg=='9')
										 %>
										<span id="possibleSubClassificationDiv" style="display:${rgCon3 ? 'inline' : 'none'}"><br/>
			                                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label for="possibleSubClassification">if 9: Possible subclassification</label>
			                                    <%
			                                    def psc = reviewQuestionsInstance?.possibleSubClassification
												def pdxOptGrp="<select id='possibleSubClassification' name='possibleSubClassification'>"
												pdxOptGrp +="<option value='null' selected='selected'>Select One...</option>"
												def p_selectedOrNot=""
												GradingSubClassification.each {dx->
													if (psc==dx.key) p_selectedOrNot="selected" else p_selectedOrNot="" 
													if (dx.key.length()==1){
														pdxOptGrp+= "<optgroup style='font-style:normal;' label='"+dx.key+". "+dx.value+"'/>"
													}
													else{
														pdxOptGrp+="<option value='"+dx.key+"' "+p_selectedOrNot+">"+dx.key+" : "+dx.value+"</option>"
													}
													if (dx.key=='9') pdxOptGrp+="<option value='"+dx.key+"' "+p_selectedOrNot+">"+dx.key+" : "+dx.value+"</option>"
													
			                                    }
												pdxOptGrp +="</select>"
												out << pdxOptGrp
												 %>
			                                  

			                            </span>
	                            	</td></tr>
			                            <tr class="prop2">
			                                <td valign="top" class="name">
			                                  <label for="levelOfDiagnosticCertainty"><g:message code="reviewQuestions.levelOfDiagnosticCertainty.label" default="Level Of Diagnostic Certainty" /></label>
			                                </td>
			                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'levelOfDiagnosticCertainty', 'errors')}">
			                                    <g:select id="levelOfDiagnosticCertainty" name="levelOfDiagnosticCertainty" from="${['1(low)', '2', '3(high)']}" value="${reviewQuestionsInstance?.levelOfDiagnosticCertainty}"  noSelection="${['null':'Select One...']}"/>
			                                </td>
			                            </tr>
				                        <tr class="prop2">
				                                <td valign="top" class="name">
				                                  <label for="notes"><g:message code="reviewQuestions.notes.label" default="Notes" /></label>
				                                </td>
				                                <td valign="top" class="value ${hasErrors(bean: reviewQuestionsInstance, field: 'notes', 'errors')}">
				                                    <g:textArea id="notes" name="notes" value="${reviewQuestionsInstance?.notes}"  style="width:100%" />
				                                </td>
				
				                        </tr>

		                            </table>
		                            </td></tr>
	                        	<tr><td colspan="2">                            


                    <div class="buttons2">
                    	&nbsp;&nbsp;<g:actionSubmit class="edit" action="do_save_finish_later" value="Save/Finish later" />
                    	&nbsp;&nbsp;&nbsp;&nbsp;<g:actionSubmit class="save" action="do_review_complete" value="Review Complete" onclick="return checkIfAllRequiredAreSelected()"/>
						&nbsp;&nbsp;&nbsp;&nbsp;<g:actionSubmit class="info" action="contact2" value="Request More Info" />
                    </div>
                   
                    </td></tr>

                    </table>
                    </g:form>
                </div>
              
               

        </div>
    </body>
</html>