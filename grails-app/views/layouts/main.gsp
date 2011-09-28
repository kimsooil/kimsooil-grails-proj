<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    <head>
        <title><g:layoutTitle default="HISPBB" /></title>
        
<g:if test="${request.getHeader('user-agent').indexOf('iPad')>=0 && request.getHeader('user-agent').indexOf('Safari')>=0}">
        <link rel="stylesheet" href="${resource(dir:'css',file:'main-ipad.css')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'style-ipad.css')}" />
</g:if>
<g:else>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'style.css')}" />
</g:else>

<link rel="stylesheet" href="${resource(dir:'css',file:'jquery.alerts.css')}" />
<link rel="stylesheet" href="${resource(dir:'css',file:'jquery-ui-1.8.11.custom.css')}" />
<link rel="stylesheet" href="${resource(dir:'css',file:'jqdialog.css')}" />
<link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />

        <g:layoutHead />

 
<g:javascript library="application" />

 
<%--<g:javascript src="jquery.js" /> --%>
<g:javascript src="jquery-1.5.1.min.js" />
<g:javascript src="jquery-ui-1.8.11.custom.min.js" />
        
<g:javascript src="jquery.custom_radio_checkbox.js" />

<%--
<g:javascript src="jquery.ui.draggable.js" />
 --%>
<g:javascript src="jqdialog.min.js" />
<g:javascript src="jquery.alerts.js" />

<g:javascript src="formValidator.js" />  

<g:javascript src="input_validation.js" />    

<script type='text/javascript' src="${resource(dir:'fullcalendar',file:'fullcalendar.min.js')}"></script>  
<g:javascript>


$(document).ready(function(){
	$(".radio").dgStyle();
	$(".vradio").dgStyle();
	$(".checkbox").dgStyle();
	$(".vcheckbox").dgStyle();
	
	
	
});
<g:if test="${request.getHeader('user-agent').indexOf('MSIE')>=0}">
//$(document).ready(function (){
//	window.alert=function(mess){
//		$("#modal").jqwindow("alert",mess);
//	};
//     }
//);
</g:if>
</g:javascript>  
     
    </head>
    <body>
        <%
		//out << request.getHeader('user-agent')
		//out << "requestURI: "+request.requestURI
		%>    
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
        </div>

        <table style="border: 0px solid #ccc">
        <tr>
        <td>
        	<%--<div id="ponceLogo" class="logo"><a href="${createLink(uri: '/')}"><img src="${resource(dir:'images',file:'Ponce2.jpg')}" alt="ponce" border="0" /></a> --%>
        	<br/>
        	<%--<div id="moffittLogo" class="logo"><a href="${createLink(uri: '/')}"><img src="${resource(dir:'images',file:'MCC-Logo-DarkLight.png')}" alt="moffitt" border="0" /></a></div> --%>
        	<%--<div id="moffittLogo" class="logo"><a href="${createLink(uri: '/')}"><img src="${resource(dir:'images',file:'psm45percent.JPG')}" alt="moffitt" border="0" /></a> --%>
<g:if test="${!(request.requestURI.indexOf('person')>=0 && request.requestURI.indexOf('login')>=0)}">        	
        	<div><a href="${createLink(uri: '/')}"><img width="140" height="90" src="${resource(dir:'images',file:'hispbb.JPG')}" alt="moffitt" border="0" /></a></div>
</g:if>        	
        </td>
<%--
         <td>
        	<div id="psmLogo" class="logo"><a href="${createLink(uri: '/')}"><img src="${resource(dir:'images',file:'Ponce2.jpg')}" alt="psm" border="0" /></a></div>
        </td>
 --%>        
        <td>
	        <br/> <br/>
	        <span class="title"><g:message code="site.title"/></span><br/><br/>
	        <span class="subtitle"><g:message code="site.subtitle"/></span>
	        <%--<label style="color:deepskyblue">Hispanic Bio-Bank <a href="/hispbb/changes.html">(7/26/2011)</a>
	         - <a href="/hispbb/changes.html">Changes</a></label>
	         - <label>(<a href="/hispbb/browsers.html">Best viewed with Safari & FireFox - <font color="red">not IE</font></a>)</label> --%>
        </td>

       </tr>
        </table>
		
        <div>
        <g:if test="${flash.print!='print'}">
        	<span style="float:right; padding:1em"><g:loginControl /></span>
	        <span style="float:right; padding:1em"><langs:selector langs="es, en"/></span>
        </g:if>
        </div>


        <g:layoutBody />

    </body>
    
</html>