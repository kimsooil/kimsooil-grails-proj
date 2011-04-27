<%
	def i=0
    def step=''
	def current_url = request.requestURI
	
		def stepTitles=[message(code:"step1.label"),
						message(code:"step2.label"),
						message(code:"step3.label"),
						message(code:"step4.label"),
						message(code:"step5.label"),
						message(code:"step6.label"),
						message(code:"step7.label"),
						message(code:"step8.label"),
						message(code:"step9.label"),
						message(code:"step10.label"),
						message(code:"step11.label"),
						message(code:"step12.label"),
						message(code:"step13.label"),
						message(code:"step14.label"),
						message(code:"step15.label"),]
		
		if (current_url.indexOf('step')>=0){
			if (current_url.indexOf('_edit')>=0){
				step= current_url.substring(current_url.indexOf('step')+4,current_url.indexOf('_edit'))
			}
			else{
				step=current_url.substring(current_url.indexOf('step')+4,current_url.indexOf('.dispatch'))
			}
		}
		if (step!='') session.step=step.toInteger()
 %>
<g:while test="${i < 15}">
    <%
    i++
    //out << "step=["+step+"]"
    %>
    <g:if test="${step=='1' && current_url.indexOf('_edit')==-1 }">
        <%
            if (i==1) out << "<label style='font-size:18px;font-weight:bold;padding: 4px 6px;'>"+i+"</label>"
            else out << "<label style='font-weight:bold;padding: 4px 6px;'>"+i+"</label>"
         %>
    </g:if>
    <g:else>
        <g:if test="${i.toString().trim()==step }">
            <g:link title="${stepTitles[i-1] }" action="${('step')+(i==1?'1_edit':i)}" id="${surveyInstance?.id}">
	            <g:if test="${i==7 }">
	            	<label style="color:#0000FF;font-size:18px;">${i}</label>
	            </g:if>
	            <g:elseif test="${i>=9 && i<=11}">
	            	<label style="color:#FF1493;font-size:18px;">${i}</label>
	            </g:elseif>
	            <g:else>
	            	<label style="font-size:18px;">${i}</label>
	            </g:else>
            </g:link>
        </g:if>
        <g:else>
            <g:link title="${stepTitles[i-1]}" action="${('step')+(i==1?'1_edit':i)}" id="${surveyInstance?.id}">
	            <g:if test="${i==7 }">
	            	<label style="color:#0000FF">${i}</label>
	            </g:if>
	            <g:elseif test="${i>=9 && i<=11}">
	            	<label style="color:#FF1493">${i}</label>
	            </g:elseif>
	            <g:else>
	            	<label>${i}</label>
	            </g:else>
            </g:link>
        </g:else>
    
    </g:else>
</g:while>

<g:link title="preview" action="preview" id="${surveyInstance?.id}"><label>*</label></g:link>