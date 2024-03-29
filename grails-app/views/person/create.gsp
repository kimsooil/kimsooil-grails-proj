

<%@ page import="u56survey.Person" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${personInstance}">
            <div class="errors">
                <g:renderErrors bean="${personInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="login"><g:message code="person.login.label" default="Login" /></label><label style="color:red">*</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'login', 'errors')}">
                                    <%-- <g: name="login" cols="40" rows="5" value="${personInstance?.login}" /> --%>
                                    <g:textField name="login" maxlength="255" value="${personInstance?.login}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="password"><g:message code="person.password.label" default="Password" /></label><label style="color:red">*</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'password', 'errors')}">
                                    <g:passwordField name="password" maxlength="255" value="${personInstance?.password}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="role"><g:message code="person.role.label" default="Role" /></label><label style="color:red">*</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'role', 'errors')}">
                                    <g:select name="role" from="${personInstance.constraints.role.inList}" value="${personInstance?.role}" valueMessagePrefix="person.role" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="location"><g:message code="person.location.label" default="Location" /></label><label style="color:red">*</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'location', 'errors')}">
                                    <g:select name="location" from="${personInstance.constraints.location.inList}" value="${personInstance?.location}" valueMessagePrefix="person.location" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="language"><g:message code="person.language.label" default="Language" /></label><label style="color:red">*</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'language', 'errors')}">
                                    <g:select name="language" from="${personInstance.constraints.language.inList}" value="${personInstance?.language}" valueMessagePrefix="person.language" noSelection="['': '']" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="person.name.label" default="Name" /></label><label style="color:red">*</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'name', 'errors')}">
                                    <g:textField name="name"  value="${personInstance?.name}" />
                                </td>
                            </tr>
                             <tr class="prop">
                                <td valign="top" class="name">
                                    <label>(The following fields are optional)</label>
                                </td>
                                <td valign="top">
                                    -----------------
                                </td>
                            </tr>                       
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nameFirst"><g:message code="person.nameFirst.label" default="Name First" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'nameFirst', 'errors')}">
                                    <g:textField name="nameFirst" value="${personInstance?.nameFirst}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nameLast"><g:message code="person.nameLast.label" default="Name Last" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'nameLast', 'errors')}">
                                    <g:textField name="nameLast" value="${personInstance?.nameLast}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nameMiddle"><g:message code="person.nameMiddle.label" default="Name Middle" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'nameMiddle', 'errors')}">
                                    <g:textField name="nameMiddle" value="${personInstance?.nameMiddle}" />
                                </td>
                            </tr>

                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="sex"><g:message code="person.sex.label" default="Sex" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'sex', 'errors')}">
                                    <g:select name="sex" from="${personInstance.constraints.sex.inList}" value="${personInstance?.sex}" valueMessagePrefix="person.sex" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="assignedToLocation"><g:message code="person.assignedToLocation.label" default="Assigned To Location" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'assignedToLocation', 'errors')}">
                                    <g:textField name="assignedToLocation" value="${personInstance?.assignedToLocation}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dob"><g:message code="person.dob.label" default="Dob" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'dob', 'errors')}">
                                    <g:datePicker name="dob" precision="day" value="${personInstance?.dob}" default="none" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email1"><g:message code="person.email1.label" default="Email1" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'email1', 'errors')}">
                                    <g:textField name="email1" value="${personInstance?.email1}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email2"><g:message code="person.email2.label" default="Email2" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'email2', 'errors')}">
                                    <g:textField name="email2" value="${personInstance?.email2}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="emergencyContact_FirstName"><g:message code="person.emergencyContact_FirstName.label" default="Emergency Contact First Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'emergencyContact_FirstName', 'errors')}">
                                    <g:textField name="emergencyContact_FirstName" value="${personInstance?.emergencyContact_FirstName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="emergencyContact_LastName"><g:message code="person.emergencyContact_LastName.label" default="Emergency Contact Last Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'emergencyContact_LastName', 'errors')}">
                                    <g:textField name="emergencyContact_LastName" value="${personInstance?.emergencyContact_LastName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="emergencyContact_MiddleName"><g:message code="person.emergencyContact_MiddleName.label" default="Emergency Contact Middle Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'emergencyContact_MiddleName', 'errors')}">
                                    <g:textField name="emergencyContact_MiddleName" value="${personInstance?.emergencyContact_MiddleName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="emergencyContact_email"><g:message code="person.emergencyContact_email.label" default="Emergency Contactemail" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'emergencyContact_email', 'errors')}">
                                    <g:textField name="emergencyContact_email" value="${personInstance?.emergencyContact_email}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="emergencyContact_phone"><g:message code="person.emergencyContact_phone.label" default="Emergency Contactphone" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'emergencyContact_phone', 'errors')}">
                                    <g:textField name="emergencyContact_phone" value="${personInstance?.emergencyContact_phone}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="homeAddress"><g:message code="person.homeAddress.label" default="Home Address" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'homeAddress', 'errors')}">
                                    <g:textField name="homeAddress" value="${personInstance?.homeAddress}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="homeCity"><g:message code="person.homeCity.label" default="Home City" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'homeCity', 'errors')}">
                                    <g:textField name="homeCity" value="${personInstance?.homeCity}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="homeCountry"><g:message code="person.homeCountry.label" default="Home Country" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'homeCountry', 'errors')}">
                                    <g:textField name="homeCountry" value="${personInstance?.homeCountry}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="homeState"><g:message code="person.homeState.label" default="Home State" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'homeState', 'errors')}">
                                    <g:textField name="homeState" value="${personInstance?.homeState}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="homeZipCode"><g:message code="person.homeZipCode.label" default="Home Zip Code" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'homeZipCode', 'errors')}">
                                    <g:textField name="homeZipCode" value="${personInstance?.homeZipCode}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="locAddress"><g:message code="person.locAddress.label" default="Loc Address" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'locAddress', 'errors')}">
                                    <g:textField name="locAddress" value="${personInstance?.locAddress}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="locAreaCode"><g:message code="person.locAreaCode.label" default="Loc Area Code" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'locAreaCode', 'errors')}">
                                    <g:textField name="locAreaCode" value="${personInstance?.locAreaCode}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="locCity"><g:message code="person.locCity.label" default="Loc City" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'locCity', 'errors')}">
                                    <g:textField name="locCity" value="${personInstance?.locCity}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="locCountry"><g:message code="person.locCountry.label" default="Loc Country" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'locCountry', 'errors')}">
                                    <g:textField name="locCountry" value="${personInstance?.locCountry}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="locPhoneExt"><g:message code="person.locPhoneExt.label" default="Loc Phone Ext" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'locPhoneExt', 'errors')}">
                                    <g:textField name="locPhoneExt" value="${personInstance?.locPhoneExt}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="locPhoneNum"><g:message code="person.locPhoneNum.label" default="Loc Phone Num" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'locPhoneNum', 'errors')}">
                                    <g:textField name="locPhoneNum" value="${personInstance?.locPhoneNum}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="locState"><g:message code="person.locState.label" default="Loc State" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'locState', 'errors')}">
                                    <g:textField name="locState" value="${personInstance?.locState}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="locZipCode"><g:message code="person.locZipCode.label" default="Loc Zip Code" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'locZipCode', 'errors')}">
                                    <g:textField name="locZipCode" value="${personInstance?.locZipCode}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="locationName"><g:message code="person.locationName.label" default="Location Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'locationName', 'errors')}">
                                    <g:textField name="locationName" value="${personInstance?.locationName}" />
                                </td>
                            </tr>
                        
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="phone1Area"><g:message code="person.phone1Area.label" default="Phone1 Area" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'phone1Area', 'errors')}">
                                    <g:textField name="phone1Area" value="${personInstance?.phone1Area}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="phone1Ext"><g:message code="person.phone1Ext.label" default="Phone1 Ext" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'phone1Ext', 'errors')}">
                                    <g:textField name="phone1Ext" value="${personInstance?.phone1Ext}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="phone1Num"><g:message code="person.phone1Num.label" default="Phone1 Num" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'phone1Num', 'errors')}">
                                    <g:textField name="phone1Num" value="${personInstance?.phone1Num}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="phone2Area"><g:message code="person.phone2Area.label" default="Phone2 Area" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'phone2Area', 'errors')}">
                                    <g:textField name="phone2Area" value="${personInstance?.phone2Area}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="phone2Ext"><g:message code="person.phone2Ext.label" default="Phone2 Ext" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'phone2Ext', 'errors')}">
                                    <g:textField name="phone2Ext" value="${personInstance?.phone2Ext}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="phone2Num"><g:message code="person.phone2Num.label" default="Phone2 Num" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'phone2Num', 'errors')}">
                                    <g:textField name="phone2Num" value="${personInstance?.phone2Num}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="primaryPhoneArea"><g:message code="person.primaryPhoneArea.label" default="Primary Phone Area" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'primaryPhoneArea', 'errors')}">
                                    <g:textField name="primaryPhoneArea" value="${personInstance?.primaryPhoneArea}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="primaryPhoneExt"><g:message code="person.primaryPhoneExt.label" default="Primary Phone Ext" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'primaryPhoneExt', 'errors')}">
                                    <g:textField name="primaryPhoneExt" value="${personInstance?.primaryPhoneExt}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="primaryPhoneNum"><g:message code="person.primaryPhoneNum.label" default="Primary Phone Num" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'primaryPhoneNum', 'errors')}">
                                    <g:textField name="primaryPhoneNum" value="${personInstance?.primaryPhoneNum}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ssn"><g:message code="person.ssn.label" default="Ssn" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'ssn', 'errors')}">
                                    <g:textField name="ssn" value="${personInstance?.ssn}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
