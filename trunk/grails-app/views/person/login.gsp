<%@ page import="u56survey.Person" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <title>Login - <g:message code="site.title" /></title>         
  </head>
  <body>
    <div class="body">
      <h1>Login</h1>
      <br/>
      <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
      </g:if>
      <g:form action="authenticate" method="post" >
        <div class="dialog">
          <table id="one-column-emphasis">
            <tbody>            
              <tr class="prop">
                <td class="name">
                  <label for="login">Login:</label>
                </td>
                <td>
                  <input type="text" id="login" name="login"/>
                </td>
              </tr> 
          
              <tr class="prop">
                <td class="name">
                  <label for="password">Password:</label>
                </td>
                <td>
                  <input type="password" id="password" name="password"/>
                </td>
              </tr> 
            </tbody>
          </table>
        </div>
        <div class="buttons">
          <span class="button">
            <input class="information" type="submit" value="Login" />
          </span>
        </div>
      </g:form>
    </div>
  </body>
</html>
