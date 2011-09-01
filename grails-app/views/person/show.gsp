
<%@ page import="u56survey.Person" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    <%--
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "id")}</td>
                            
                        </tr>
                     --%>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.login.label" default="Login" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "login")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.password.label" default="Password" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "password")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.role.label" default="Role" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "role")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.location.label" default="Location" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "location")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.language.label" default="Language" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "language")}</td>
                            
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "name")}</td>
                            
                        </tr>
                        
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.nameFirst.label" default="Name First" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "nameFirst")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.nameLast.label" default="Name Last" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "nameLast")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.nameMiddle.label" default="Name Middle" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "nameMiddle")}</td>
                            
                        </tr>                        
                        
                                            
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.sex.label" default="Sex" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "sex")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.assignedToLocation.label" default="Assigned To Location" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "assignedToLocation")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.dob.label" default="Dob" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${personInstance?.dob}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.email1.label" default="Email1" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "email1")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.email2.label" default="Email2" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "email2")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.emergencyContact_FirstName.label" default="Emergency Contact First Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "emergencyContact_FirstName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.emergencyContact_LastName.label" default="Emergency Contact Last Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "emergencyContact_LastName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.emergencyContact_MiddleName.label" default="Emergency Contact Middle Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "emergencyContact_MiddleName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.emergencyContact_email.label" default="Emergency Contactemail" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "emergencyContact_email")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.emergencyContact_phone.label" default="Emergency Contactphone" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "emergencyContact_phone")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.homeAddress.label" default="Home Address" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "homeAddress")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.homeCity.label" default="Home City" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "homeCity")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.homeCountry.label" default="Home Country" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "homeCountry")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.homeState.label" default="Home State" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "homeState")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.homeZipCode.label" default="Home Zip Code" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "homeZipCode")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.locAddress.label" default="Loc Address" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "locAddress")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.locAreaCode.label" default="Loc Area Code" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "locAreaCode")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.locCity.label" default="Loc City" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "locCity")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.locCountry.label" default="Loc Country" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "locCountry")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.locPhoneExt.label" default="Loc Phone Ext" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "locPhoneExt")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.locPhoneNum.label" default="Loc Phone Num" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "locPhoneNum")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.locState.label" default="Loc State" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "locState")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.locZipCode.label" default="Loc Zip Code" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "locZipCode")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.locationName.label" default="Location Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "locationName")}</td>
                            
                        </tr>
                    


                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.phone1Area.label" default="Phone1 Area" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "phone1Area")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.phone1Ext.label" default="Phone1 Ext" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "phone1Ext")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.phone1Num.label" default="Phone1 Num" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "phone1Num")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.phone2Area.label" default="Phone2 Area" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "phone2Area")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.phone2Ext.label" default="Phone2 Ext" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "phone2Ext")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.phone2Num.label" default="Phone2 Num" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "phone2Num")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.primaryPhoneArea.label" default="Primary Phone Area" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "primaryPhoneArea")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.primaryPhoneExt.label" default="Primary Phone Ext" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "primaryPhoneExt")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.primaryPhoneNum.label" default="Primary Phone Num" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "primaryPhoneNum")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.ssn.label" default="Ssn" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "ssn")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${personInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
