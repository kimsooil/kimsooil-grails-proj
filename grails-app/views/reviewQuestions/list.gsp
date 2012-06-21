
<%@ page import="braintumorpathologyreview.ReviewQuestions" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'reviewQuestions.label', default: 'ReviewQuestions')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'reviewQuestions.id.label', default: 'Id')}" />
                            
                            <th>Initial Status</th>
                            
                            <g:sortableColumn property="studyid" title="studyid" />
                            
                            <th>reviewer assigned</th>
                            
                            <g:sortableColumn property="gradingSubClassification" title="Grading SubClassification" />
                            
                            <g:sortableColumn property="levelOfDiagnosticCertainty" title="Level Of Diagnostic Certainty(1~3)" />
                            
                            <!-- <th>Complete?</th> -->
                            
                            <g:sortableColumn property="dateCreated" title="Date Created" />
                            
                            <g:sortableColumn property="lastUpdated" title="Last Updated" />
<!--                            
                            <th>Final Status</th>
                         
                            <g:sortableColumn property="rosenthalFibers" title="${message(code: 'reviewQuestions.rosenthalFibers.label', default: 'Rosenthal Fibers')}" />
                        
                            <g:sortableColumn property="artifactPresentOrBadSection" title="${message(code: 'reviewQuestions.artifactPresentOrBadSection.label', default: 'Artifact Present Or Bad Section')}" />
                        
                            <g:sortableColumn property="mini_gemistocytesPresent" title="${message(code: 'reviewQuestions.mini_gemistocytesPresent.label', default: 'Minigemistocytes Present')}" />
                        
                            <g:sortableColumn property="gemistocytic" title="${message(code: 'reviewQuestions.gemistocytic.label', default: 'Gemistocytic')}" />
                        
                            <g:sortableColumn property="oligodendroglialPhenotype" title="${message(code: 'reviewQuestions.oligodendroglialPhenotype.label', default: 'Oligodendroglial Phenotype')}" />
 -->                            
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${reviewQuestionsInstanceList}" status="i" var="reviewQuestionsInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                     
                            <td><g:link action="show" id="${reviewQuestionsInstance.id}">${fieldValue(bean: reviewQuestionsInstance, field: "id")}</g:link></td>

                        	<td>${reviewQuestionsInstance.status}</td>

                        	<td><g:link controller="dataEntry" action="showcasedetails" id="${reviewQuestionsInstance.studyid}">${fieldValue(bean: reviewQuestionsInstance, field: "studyid")}</g:link></td>

                            <td><g:link controller="user" action="show" id="${reviewQuestionsInstance.reviewer.id}">${reviewQuestionsInstance.reviewer.encodeAsHTML()}</g:link></td>
                            
                            <td>${fieldValue(bean: reviewQuestionsInstance, field: "gradingSubClassification")}</td>
                            
                            <td>${fieldValue(bean: reviewQuestionsInstance, field: "levelOfDiagnosticCertainty")}</td>
                            


                           <td><g:formatDate format="yyyy-MM-dd HH:mm" date="${reviewQuestionsInstance.dateCreated}" /></td>
                           
                           <td><g:formatDate format="yyyy-MM-dd HH:mm" date="${reviewQuestionsInstance.lastUpdated}" /></td>
<!--                            
                            <td><label style="color:red">Complete/Re-review/In progress</label></td>
                            
                        
                            <td><g:formatBoolean boolean="${reviewQuestionsInstance.rosenthalFibers}" /></td>
                        
                            <td><g:formatBoolean boolean="${reviewQuestionsInstance.artifactPresentOrBadSection}" /></td>
                        
                            <td><g:formatBoolean boolean="${reviewQuestionsInstance.mini_gemistocytesPresent}" /></td>
                        
                            <td><g:formatBoolean boolean="${reviewQuestionsInstance.gemistocytic}" /></td>
                        
                            <td><g:formatBoolean boolean="${reviewQuestionsInstance.oligodendroglialPhenotype}" /></td>
-->
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${reviewQuestionsInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
