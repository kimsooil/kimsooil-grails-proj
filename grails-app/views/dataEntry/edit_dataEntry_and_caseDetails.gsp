
<%@ page import="braintumorpathologyreview.ReviewQuestions" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'reviewQuestions.label', default: 'ReviewQuestions')}" />
        <title>Update Case</title>
		<g:javascript library="prototype" />
		<g:javascript>
			function trim (str) {
				var	str = str.replace(/^\s\s*/, ''),
					ws = /\s/,
					i = str.length;
				while (ws.test(str.charAt(--i)));
				return str.slice(0, i + 1);
			}		
			function checkIfvalid(){
				var trimmedInitials=trim($('subject_initials').value);
				var trimmedStudyid=trim($('studyid').value);
				if (trimmedInitials=='' || trimmedInitials==null){
					alert ("Subject Initials can not be empty");
					return false;
				} 
				if (trimmedStudyid=='' || trimmedStudyid==null){
					alert ("Study ID can not be empty.");
					return false;
				}
				return true;				
			}
			function changeSite1(){
				$('Site1').value=$('siteOpt1').value;
			}
			function changeSite2(){
				$('Site2').value=$('siteOpt2').value;
			}
			function changeSite3(){
				$('Site3').value=$('siteOpt3').value;
			}
			function changeSite4(){
				$('Site4').value=$('siteOpt4').value;
			}
			function changeSite5(){
				$('Site5').value=$('siteOpt5').value;
			}
			function changeSite6(){
				$('Site6').value=$('siteOpt6').value;
			}

			function changeDx1(){
				$('Diagnosis1').value=$('DiagnosisOpt1').value;
			}
			function changeDx2(){
				$('Diagnosis2').value=$('DiagnosisOpt2').value;
			}
			function changeDx3(){
				$('Diagnosis3').value=$('DiagnosisOpt3').value;
			}
			function changeDx4(){
				$('Diagnosis4').value=$('DiagnosisOpt4').value;
			}
			function changeDx5(){
				$('Diagnosis5').value=$('DiagnosisOpt5').value;
			}
			function changeDx6(){
				$('Diagnosis6').value=$('DiagnosisOpt6').value;
			}
			
		</g:javascript>
    </head>
    <body>  
        <div class="nav">
        
            <span class="menuButton"><a class="home" href="${createLink(uri: '/dataEntry/firstpage')}">Home</a></span>
            <g:if test="${session.user.role=='admin' }">
            	<span class="menuButton"><g:link controller="dataEntry" class="list" action="list">List All Cases</g:link></span>
            </g:if>           
        </div>
        <div class="body">
        <g:uploadForm action="save" method="post" >
            <h1>Update Existing Case</h1> 
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            

            <div class="dialog">
                 
                  <table>
                  <caption style="color:black;text-align:right">
                  Study ID (INITIALS - ID#): &nbsp;&nbsp;<g:textField id="subject_initials" name="subject_initials" value="${caseDetailsInstance?.subject_initials}" />-<g:textField id="studyid" name="studyid" value="${caseDetailsInstance?.studyid}" /> (e.g. AAA-xxxxxx)
                  <br/>Brain Tumor Type: <g:select id="gliomaOrMeningioma" name="gliomaOrMeningioma" from="${['Glioma', 'Meningioma']}" value="${caseDetailsInstance?.gliomaOrMeningioma}" noSelection="${['null':'-----']}"/>
                  </caption>
                  <tr>
                    <td valign="top">
     
                    <table>
                        <tbody>
                        <tr><td colspan="2">
                        
                        
                        
                        
                        <table id="ver-minimalist" style="width:100%">
		                        <caption>Pathology</caption>
		                        <thead>
		                        <tr>
		                        	<th>No.</th>
		                        	<th>on/off</th>
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
								<tr>
									<td>${i}</td>
									<td><g:checkBox name="${'pshow'+i}" value="${caseDetailsInstance.('pshow'+i)}" /></td>
				                    <td>
				                    	<g:textField style="width: 80px" name="${'surgeryDate'+i}" value="${caseDetailsInstance.('surgeryDate'+i)}" />
				                    	<%--<g:datePicker style="width: 100px" name="${'pdate'+i }" value="${caseDetailsInstance.('pdate'+i)}" precision="day" years="${2000..2010}"/> --%>
				                    </td>
				                    <td><g:select name="${'surgeryType'+i }" from="${['Biopsy', 'Resection'] }" value="${caseDetailsInstance.('surgeryType'+i) }" noSelection="${['':'-----']}"/></td>
				                    <td><g:select name="${'reviewType'+i }" from="${['Diagnostic', 'Consult', 'FISH'] }" value="${caseDetailsInstance.('reviewType'+i) }" noSelection="${['':'-----']}"/></td>
				                    <td><g:textField style="width: 100px" name="${'SurgPathNum'+i }" value="${caseDetailsInstance.('SurgPathNum'+i) }"/></td>
				                    <td><g:textField name="${'Diagnosis'+i }" value="${caseDetailsInstance.('Diagnosis'+i) }"/><br/>
			                        <%
												def cdx = caseDetailsInstance.('Diagnosis'+i)
												if (cdx.size()>2){
													def sp=cdx.split("=")
													def dxcode=sp[0].trim()
													cdx = dxcode
												}

												def dxOptGrp="<select id='${'DiagnosisOpt'+i }' name='${'DiagnosisOpt'+i }' onchange=${'changeDx'+i+'()'}>"
												dxOptGrp +="<option value='' selected='selected'>-----</option>"
												def selectedOrNot=""
												GradingSubClassification.each{dx->
													if (cdx==dx.key) selectedOrNot="selected" else selectedOrNot=""
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
									 </td>
				                    <td>
				                    	<g:textField name="${'Site'+i }" value="${caseDetailsInstance.('Site'+i) }" /><br/>
				                    	<%
											def temp_site=caseDetailsInstance.('Site'+i)
										 %>
				                    	<g:select name="${'siteOpt'+i }" from="${['Emory', 'Moffitt', 'UAB', 'Vanderbilt'] }" value="${temp_site }" noSelection="${['':'-----']}" onchange="${'changeSite'+i+'()'}"/>
				                    </td>
				                    <td>
				                    	<g:textField name="${'ReportUrl'+i }" value="${caseDetailsInstance.('ReportUrl'+i)}"/>
				                    	<input type="file" id="${'payload'+i }" name="${'payload'+i }"/>
				                    </td>
								</tr>
			 					</g:while>
		                        </tbody>                                  
                    </table>
                    
                    
                    
                    </td></tr>
                    <tr><td valign="top">
                    
                    
                    
                    
                    <table id="ver-minimalist" style="width:100%">
                    	<caption>MRI</caption>
                    	<thead>
                       <tr class="prop">
                       		<th>No.</th>
                       		<th>on/off</th>
                       		<th>Date</th>
                            <th>MRI Summary</th>
                            <th>MRI report (PDF)</th>

                        </tr>
                        </thead>
 						<tbody>
		                <%i=0%>
						<g:while test="${i < 2}">
	    				<%i++%>                        
 						
 						<tr valign="top">
 							<td>${i }</td>
 							<td><g:checkBox name="${'mshow'+i}" value="${caseDetailsInstance.('mshow'+i)}" /></td>
                         	<td>
                         		<g:textField style="width: 80px" name="${'MRIDate'+i }" value="${caseDetailsInstance.('MRIDate'+i) }" />
                         		<%--<g:datePicker style="width: 100px" name="${'mdate'+i }" value="${caseDetailsInstance.('mdate'+i)}" precision="day" years="${2000..2010}"/> --%>
                         	</td>
                        	<td><g:textArea name="${'MRISummary'+i }" value="${caseDetailsInstance.('MRISummary'+i) }" />
                        	</td>
                        	<td>
                        		<g:textField name="${'MRIReport'+i }" value="${caseDetailsInstance.('MRIReport'+i)}" />
                        		<input type="file" id="${'mripayload'+i }" name="${'mripayload'+i }"/>
                        	</td>
 						</tr>
 						</g:while>

 						</tbody>
 
                       </table>
                       <br/><br/>
<table><caption>Case Note</caption>
<tr>
<td><g:textArea id="case_note" name="case_note" value="${caseDetailsInstance.case_note}"  style="width:100%" /></td>
</tr>
</table>                           
                    </td>
                    <td valign="top">
                    
                    
                    
                    <table id="ver-minimalist" style="width:100%">
                		<caption>Slides</caption>
                		<thead>
                        <tr class="prop">
								<th>No.</th>
                        		<th>on/off</th>
                        		<th>Surgery Type</th>
                        		<th>Stain</th>
								<th>Aperio Image</th>
                        </tr>
                        </thead>
                        <tbody>
 		                <%i=0%>
						<g:while test="${i < 6}">
	    				<%i++%>   
	    				<tr>
	    					<td>${i }</td>
	    					<td><g:checkBox name="${'sshow'+i}" value="${caseDetailsInstance.('sshow'+i)}" /></td>
                        	<td><g:select name="${'SurgType'+i }" from="${['Biopsy', 'Resection'] }" value="${caseDetailsInstance.('SurgType'+i) }" noSelection="${['':'-----']}"/></td>
                        	<td><g:select name="${'StainType'+i }" from="${['H&E', 'GFAP', 'Ki67/MIB-1', 'EGFR', 'TP53', 'Unstained section', 'other'] }" value="${caseDetailsInstance.('StainType'+i) }" noSelection="${['':'-----']}"/></td>
                        	<td><g:textField name="${'imageid'+i }" value="${caseDetailsInstance.('imageid'+i) }" /></td>
	    				</tr>                     
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
			<g:hiddenField name="id" value="${caseDetailsInstance?.id}" />            
            <div class="buttons2">
            	<span class="button"><g:actionSubmit class="save" action="update_dataEntry_and_caseDetails" value="Update" onclick="return checkIfvalid();"/></span>
            </div>                   

            </g:uploadForm>
        </div>
    </body>
</html>
