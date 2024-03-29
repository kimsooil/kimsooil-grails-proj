<%@ page import="u56survey.Person" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
    <title>Login - <g:message code="site.title" /></title>
<style type="text/css">
<!--
body {
  background-image: url("../images/tere55percent.JPG");
  background-position: 50% 0%;
  background-repeat: repeat;
  background-color: black;  
}
.fortypercent{
width: 40%;
}
-->
</style>              
  </head>
  <body>
    <div class="body">
      <%--<h1 style="color:cyan">Login</h1> --%>
      <br/>
      <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
      </g:if>
      
      <g:form action="authenticate" method="post" >
        <div>
          <table id="one-column-emphasis">
            <tbody>            
              <tr class="prop">
                <td class="name">
                  <label style="color:white" for="login"><g:message code="id" />:</label>
                </td>
                <td>
                  <input style="width:250px;" type="text" id="login" name="login"/>
                  <%--<g:textField name="login" value="" />--%>
                </td>
              </tr> 
          
              <tr class="prop">
                <td class="name">
                  <label style="color:white" for="password"><g:message code="password2" />:</label>
                </td>
                <td>
                  <input  style="width:250px;" type="password" id="password" name="password"/>
                 <%--<g:passwordField name="password" value="" />--%>
                </td>
              </tr> 
            </tbody>
          </table>
        </div>
        <div class="buttons fortypercent">
          <span class="button">
            <input class="information" type="submit" value="${message(code:'login2')}" />
            <%--<g:actionSubmit value="${message(code:'login2')}" />--%>
          </span>
        </div>
      </g:form>
    </div>
  </body>
</html>
