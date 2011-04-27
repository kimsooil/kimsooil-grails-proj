

<%@ page import="u56survey.Survey" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'survey.label', default: 'Survey')}" />
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
            <g:hasErrors bean="${surveyInstance}">
            <div class="errors">
                <g:renderErrors bean="${surveyInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="DOB"><g:message code="survey.DOB.label" default="DOB" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'DOB', 'errors')}">
                                    <g:datePicker name="DOB" precision="day" value="${surveyInstance?.DOB}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="addr_city"><g:message code="survey.addr_city.label" default="Addrcity" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'addr_city', 'errors')}">
                                    <g:textField name="addr_city" value="${surveyInstance?.addr_city}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="addr_state"><g:message code="survey.addr_state.label" default="Addrstate" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'addr_state', 'errors')}">
                                    <g:textField name="addr_state" value="${surveyInstance?.addr_state}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="addr_street1"><g:message code="survey.addr_street1.label" default="Addrstreet1" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'addr_street1', 'errors')}">
                                    <g:textField name="addr_street1" value="${surveyInstance?.addr_street1}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="addr_street2"><g:message code="survey.addr_street2.label" default="Addrstreet2" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'addr_street2', 'errors')}">
                                    <g:textField name="addr_street2" value="${surveyInstance?.addr_street2}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="addr_zipcode"><g:message code="survey.addr_zipcode.label" default="Addrzipcode" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'addr_zipcode', 'errors')}">
                                    <g:textField name="addr_zipcode" value="${surveyInstance?.addr_zipcode}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="age"><g:message code="survey.age.label" default="Age" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'age', 'errors')}">
                                    <g:textField name="age" value="${surveyInstance?.age}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="another_place_for_radiation_treatment"><g:message code="survey.another_place_for_radiation_treatment.label" default="Anotherplaceforradiationtreatment" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'another_place_for_radiation_treatment', 'errors')}">
                                    <g:textField name="another_place_for_radiation_treatment" value="${surveyInstance?.another_place_for_radiation_treatment}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="biopsy_results"><g:message code="survey.biopsy_results.label" default="Biopsyresults" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'biopsy_results', 'errors')}">
                                    <g:textField name="biopsy_results" value="${surveyInstance?.biopsy_results}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="contact_info_doctor"><g:message code="survey.contact_info_doctor.label" default="Contactinfodoctor" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'contact_info_doctor', 'errors')}">
                                    <g:textField name="contact_info_doctor" value="${surveyInstance?.contact_info_doctor}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="country"><g:message code="survey.country.label" default="Country" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'country', 'errors')}">
                                    <g:textField name="country" value="${surveyInstance?.country}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="current_occupation"><g:message code="survey.current_occupation.label" default="Currentoccupation" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'current_occupation', 'errors')}">
                                    <g:textField name="current_occupation" value="${surveyInstance?.current_occupation}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="current_occupation_time"><g:message code="survey.current_occupation_time.label" default="Currentoccupationtime" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'current_occupation_time', 'errors')}">
                                    <g:textField name="current_occupation_time" value="${surveyInstance?.current_occupation_time}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateStopSmoking"><g:message code="survey.dateStopSmoking.label" default="Date Stop Smoking" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'dateStopSmoking', 'errors')}">
                                    <g:datePicker name="dateStopSmoking" precision="day" value="${surveyInstance?.dateStopSmoking}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="date_digital_rectal_exam"><g:message code="survey.date_digital_rectal_exam.label" default="Datedigitalrectalexam" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'date_digital_rectal_exam', 'errors')}">
                                    <g:datePicker name="date_digital_rectal_exam" precision="day" value="${surveyInstance?.date_digital_rectal_exam}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="date_last_mammography"><g:message code="survey.date_last_mammography.label" default="Datelastmammography" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'date_last_mammography', 'errors')}">
                                    <g:datePicker name="date_last_mammography" precision="day" value="${surveyInstance?.date_last_mammography}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="date_last_visit_gynecologist"><g:message code="survey.date_last_visit_gynecologist.label" default="Datelastvisitgynecologist" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'date_last_visit_gynecologist', 'errors')}">
                                    <g:datePicker name="date_last_visit_gynecologist" precision="day" value="${surveyInstance?.date_last_visit_gynecologist}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="date_most_recent_PSA_test"><g:message code="survey.date_most_recent_PSA_test.label" default="Datemostrecent PSA test" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'date_most_recent_PSA_test', 'errors')}">
                                    <g:datePicker name="date_most_recent_PSA_test" precision="day" value="${surveyInstance?.date_most_recent_PSA_test}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="date_most_recent_pap_smear"><g:message code="survey.date_most_recent_pap_smear.label" default="Datemostrecentpapsmear" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'date_most_recent_pap_smear', 'errors')}">
                                    <g:datePicker name="date_most_recent_pap_smear" precision="day" value="${surveyInstance?.date_most_recent_pap_smear}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="date_rectal_exam"><g:message code="survey.date_rectal_exam.label" default="Daterectalexam" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'date_rectal_exam', 'errors')}">
                                    <g:datePicker name="date_rectal_exam" precision="day" value="${surveyInstance?.date_rectal_exam}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="date_sigmoidoscopy_colonoscopy"><g:message code="survey.date_sigmoidoscopy_colonoscopy.label" default="Datesigmoidoscopycolonoscopy" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'date_sigmoidoscopy_colonoscopy', 'errors')}">
                                    <g:datePicker name="date_sigmoidoscopy_colonoscopy" precision="day" value="${surveyInstance?.date_sigmoidoscopy_colonoscopy}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="education"><g:message code="survey.education.label" default="Education" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'education', 'errors')}">
                                    <g:textField name="education" value="${surveyInstance?.education}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="everyHowManyDaysMenstrualCycle"><g:message code="survey.everyHowManyDaysMenstrualCycle.label" default="Every How Many Days Menstrual Cycle" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'everyHowManyDaysMenstrualCycle', 'errors')}">
                                    <g:textField name="everyHowManyDaysMenstrualCycle" value="${surveyInstance?.everyHowManyDaysMenstrualCycle}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="findings_digital_rectal_exam"><g:message code="survey.findings_digital_rectal_exam.label" default="Findingsdigitalrectalexam" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'findings_digital_rectal_exam', 'errors')}">
                                    <g:textField name="findings_digital_rectal_exam" value="${surveyInstance?.findings_digital_rectal_exam}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="findings_pevic_exam"><g:message code="survey.findings_pevic_exam.label" default="Findingspevicexam" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'findings_pevic_exam', 'errors')}">
                                    <g:textField name="findings_pevic_exam" value="${surveyInstance?.findings_pevic_exam}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="findings_rectal_exam"><g:message code="survey.findings_rectal_exam.label" default="Findingsrectalexam" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'findings_rectal_exam', 'errors')}">
                                    <g:textField name="findings_rectal_exam" value="${surveyInstance?.findings_rectal_exam}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="frequency_of_visit_gynecologist"><g:message code="survey.frequency_of_visit_gynecologist.label" default="Frequencyofvisitgynecologist" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'frequency_of_visit_gynecologist', 'errors')}">
                                    <g:textField name="frequency_of_visit_gynecologist" value="${surveyInstance?.frequency_of_visit_gynecologist}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="gQ90e_year"><g:message code="survey.gQ90e_year.label" default="GQ 90eyear" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'gQ90e_year', 'errors')}">
                                    <g:textField name="gQ90e_year" value="${surveyInstance?.gQ90e_year}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="height_feet"><g:message code="survey.height_feet.label" default="Heightfeet" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'height_feet', 'errors')}">
                                    <g:textField name="height_feet" value="${surveyInstance?.height_feet}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="height_inches"><g:message code="survey.height_inches.label" default="Heightinches" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'height_inches', 'errors')}">
                                    <g:textField name="height_inches" value="${surveyInstance?.height_inches}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="hemoglobin_levels"><g:message code="survey.hemoglobin_levels.label" default="Hemoglobinlevels" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'hemoglobin_levels', 'errors')}">
                                    <g:textField name="hemoglobin_levels" value="${surveyInstance?.hemoglobin_levels}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="howDoYouFeelRightNow"><g:message code="survey.howDoYouFeelRightNow.label" default="How Do You Feel Right Now" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'howDoYouFeelRightNow', 'errors')}">
                                    <g:textField name="howDoYouFeelRightNow" value="${surveyInstance?.howDoYouFeelRightNow}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="howHaveYouFeltForPast4Weeks"><g:message code="survey.howHaveYouFeltForPast4Weeks.label" default="How Have You Felt For Past4 Weeks" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'howHaveYouFeltForPast4Weeks', 'errors')}">
                                    <g:textField name="howHaveYouFeltForPast4Weeks" value="${surveyInstance?.howHaveYouFeltForPast4Weeks}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="howIsYourHealth"><g:message code="survey.howIsYourHealth.label" default="How Is Your Health" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'howIsYourHealth', 'errors')}">
                                    <g:textField name="howIsYourHealth" value="${surveyInstance?.howIsYourHealth}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="howManyChildrensYouHad"><g:message code="survey.howManyChildrensYouHad.label" default="How Many Childrens You Had" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'howManyChildrensYouHad', 'errors')}">
                                    <g:textField name="howManyChildrensYouHad" value="${fieldValue(bean: surveyInstance, field: 'howManyChildrensYouHad')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="howManyCigarettesSmokePerDay"><g:message code="survey.howManyCigarettesSmokePerDay.label" default="How Many Cigarettes Smoke Per Day" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'howManyCigarettesSmokePerDay', 'errors')}">
                                    <g:textField name="howManyCigarettesSmokePerDay" value="${surveyInstance?.howManyCigarettesSmokePerDay}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="howManyDaysBleedingMenstrual"><g:message code="survey.howManyDaysBleedingMenstrual.label" default="How Many Days Bleeding Menstrual" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'howManyDaysBleedingMenstrual', 'errors')}">
                                    <g:textField name="howManyDaysBleedingMenstrual" value="${surveyInstance?.howManyDaysBleedingMenstrual}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="howManyYearsSmoked"><g:message code="survey.howManyYearsSmoked.label" default="How Many Years Smoked" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'howManyYearsSmoked', 'errors')}">
                                    <g:textField name="howManyYearsSmoked" value="${surveyInstance?.howManyYearsSmoked}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="howOldWereYouWhenYouBeganSmoke"><g:message code="survey.howOldWereYouWhenYouBeganSmoke.label" default="How Old Were You When You Began Smoke" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'howOldWereYouWhenYouBeganSmoke', 'errors')}">
                                    <g:textField name="howOldWereYouWhenYouBeganSmoke" value="${surveyInstance?.howOldWereYouWhenYouBeganSmoke}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="how_long_use_fertility_medication"><g:message code="survey.how_long_use_fertility_medication.label" default="Howlongusefertilitymedication" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'how_long_use_fertility_medication', 'errors')}">
                                    <g:textField name="how_long_use_fertility_medication" value="${surveyInstance?.how_long_use_fertility_medication}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="levelOfActivity"><g:message code="survey.levelOfActivity.label" default="Level Of Activity" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'levelOfActivity', 'errors')}">
                                    <g:textField name="levelOfActivity" value="${surveyInstance?.levelOfActivity}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="marital_Status"><g:message code="survey.marital_Status.label" default="Marital Status" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'marital_Status', 'errors')}">
                                    <g:textField name="marital_Status" value="${surveyInstance?.marital_Status}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="medication_fertility"><g:message code="survey.medication_fertility.label" default="Medicationfertility" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'medication_fertility', 'errors')}">
                                    <g:textField name="medication_fertility" value="${surveyInstance?.medication_fertility}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="other_sat_fat"><g:message code="survey.other_sat_fat.label" default="Othersatfat" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'other_sat_fat', 'errors')}">
                                    <g:textField name="other_sat_fat" value="${surveyInstance?.other_sat_fat}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="other_vegetable"><g:message code="survey.other_vegetable.label" default="Othervegetable" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'other_vegetable', 'errors')}">
                                    <g:textField name="other_vegetable" value="${surveyInstance?.other_vegetable}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="phone"><g:message code="survey.phone.label" default="Phone" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'phone', 'errors')}">
                                    <g:textField name="phone" value="${surveyInstance?.phone}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="prior_job"><g:message code="survey.prior_job.label" default="Priorjob" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'prior_job', 'errors')}">
                                    <g:textField name="prior_job" value="${surveyInstance?.prior_job}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="prior_job_time"><g:message code="survey.prior_job_time.label" default="Priorjobtime" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'prior_job_time', 'errors')}">
                                    <g:textField name="prior_job_time" value="${surveyInstance?.prior_job_time}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q11"><g:message code="survey.q11.label" default="Q11" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q11', 'errors')}">
                                    <g:checkBox name="q11" value="${surveyInstance?.q11}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q16"><g:message code="survey.q16.label" default="Q16" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q16', 'errors')}">
                                    <g:checkBox name="q16" value="${surveyInstance?.q16}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q20"><g:message code="survey.q20.label" default="Q20" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q20', 'errors')}">
                                    <g:checkBox name="q20" value="${surveyInstance?.q20}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q26"><g:message code="survey.q26.label" default="Q26" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q26', 'errors')}">
                                    <g:checkBox name="q26" value="${surveyInstance?.q26}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q27"><g:message code="survey.q27.label" default="Q27" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q27', 'errors')}">
                                    <g:checkBox name="q27" value="${surveyInstance?.q27}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q30a"><g:message code="survey.q30a.label" default="Q30a" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q30a', 'errors')}">
                                    <g:checkBox name="q30a" value="${surveyInstance?.q30a}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q30b"><g:message code="survey.q30b.label" default="Q30b" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q30b', 'errors')}">
                                    <g:checkBox name="q30b" value="${surveyInstance?.q30b}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q30c"><g:message code="survey.q30c.label" default="Q30c" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q30c', 'errors')}">
                                    <g:checkBox name="q30c" value="${surveyInstance?.q30c}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q30d"><g:message code="survey.q30d.label" default="Q30d" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q30d', 'errors')}">
                                    <g:checkBox name="q30d" value="${surveyInstance?.q30d}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q30e"><g:message code="survey.q30e.label" default="Q30e" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q30e', 'errors')}">
                                    <g:checkBox name="q30e" value="${surveyInstance?.q30e}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q30f"><g:message code="survey.q30f.label" default="Q30f" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q30f', 'errors')}">
                                    <g:checkBox name="q30f" value="${surveyInstance?.q30f}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q31a"><g:message code="survey.q31a.label" default="Q31a" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q31a', 'errors')}">
                                    <g:checkBox name="q31a" value="${surveyInstance?.q31a}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q31b"><g:message code="survey.q31b.label" default="Q31b" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q31b', 'errors')}">
                                    <g:checkBox name="q31b" value="${surveyInstance?.q31b}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q31c"><g:message code="survey.q31c.label" default="Q31c" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q31c', 'errors')}">
                                    <g:checkBox name="q31c" value="${surveyInstance?.q31c}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q32"><g:message code="survey.q32.label" default="Q32" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q32', 'errors')}">
                                    <g:checkBox name="q32" value="${surveyInstance?.q32}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q33"><g:message code="survey.q33.label" default="Q33" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q33', 'errors')}">
                                    <g:checkBox name="q33" value="${surveyInstance?.q33}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q34"><g:message code="survey.q34.label" default="Q34" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q34', 'errors')}">
                                    <g:checkBox name="q34" value="${surveyInstance?.q34}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q35"><g:message code="survey.q35.label" default="Q35" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q35', 'errors')}">
                                    <g:checkBox name="q35" value="${surveyInstance?.q35}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q36a"><g:message code="survey.q36a.label" default="Q36a" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q36a', 'errors')}">
                                    <g:checkBox name="q36a" value="${surveyInstance?.q36a}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q36b"><g:message code="survey.q36b.label" default="Q36b" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q36b', 'errors')}">
                                    <g:checkBox name="q36b" value="${surveyInstance?.q36b}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q36c"><g:message code="survey.q36c.label" default="Q36c" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q36c', 'errors')}">
                                    <g:checkBox name="q36c" value="${surveyInstance?.q36c}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q36d"><g:message code="survey.q36d.label" default="Q36d" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q36d', 'errors')}">
                                    <g:checkBox name="q36d" value="${surveyInstance?.q36d}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q36e"><g:message code="survey.q36e.label" default="Q36e" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q36e', 'errors')}">
                                    <g:checkBox name="q36e" value="${surveyInstance?.q36e}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q36f"><g:message code="survey.q36f.label" default="Q36f" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q36f', 'errors')}">
                                    <g:checkBox name="q36f" value="${surveyInstance?.q36f}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q37a"><g:message code="survey.q37a.label" default="Q37a" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q37a', 'errors')}">
                                    <g:checkBox name="q37a" value="${surveyInstance?.q37a}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q37b"><g:message code="survey.q37b.label" default="Q37b" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q37b', 'errors')}">
                                    <g:checkBox name="q37b" value="${surveyInstance?.q37b}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q38"><g:message code="survey.q38.label" default="Q38" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q38', 'errors')}">
                                    <g:checkBox name="q38" value="${surveyInstance?.q38}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q39"><g:message code="survey.q39.label" default="Q39" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q39', 'errors')}">
                                    <g:checkBox name="q39" value="${surveyInstance?.q39}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q40a"><g:message code="survey.q40a.label" default="Q40a" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q40a', 'errors')}">
                                    <g:checkBox name="q40a" value="${surveyInstance?.q40a}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q40b"><g:message code="survey.q40b.label" default="Q40b" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q40b', 'errors')}">
                                    <g:checkBox name="q40b" value="${surveyInstance?.q40b}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q41"><g:message code="survey.q41.label" default="Q41" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q41', 'errors')}">
                                    <g:checkBox name="q41" value="${surveyInstance?.q41}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q42"><g:message code="survey.q42.label" default="Q42" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q42', 'errors')}">
                                    <g:checkBox name="q42" value="${surveyInstance?.q42}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q42a"><g:message code="survey.q42a.label" default="Q42a" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q42a', 'errors')}">
                                    <g:checkBox name="q42a" value="${surveyInstance?.q42a}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q42b"><g:message code="survey.q42b.label" default="Q42b" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q42b', 'errors')}">
                                    <g:checkBox name="q42b" value="${surveyInstance?.q42b}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q42c"><g:message code="survey.q42c.label" default="Q42c" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q42c', 'errors')}">
                                    <g:checkBox name="q42c" value="${surveyInstance?.q42c}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q42d"><g:message code="survey.q42d.label" default="Q42d" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q42d', 'errors')}">
                                    <g:checkBox name="q42d" value="${surveyInstance?.q42d}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q42e"><g:message code="survey.q42e.label" default="Q42e" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q42e', 'errors')}">
                                    <g:checkBox name="q42e" value="${surveyInstance?.q42e}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q42f"><g:message code="survey.q42f.label" default="Q42f" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q42f', 'errors')}">
                                    <g:checkBox name="q42f" value="${surveyInstance?.q42f}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q42g"><g:message code="survey.q42g.label" default="Q42g" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q42g', 'errors')}">
                                    <g:checkBox name="q42g" value="${surveyInstance?.q42g}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q42h"><g:message code="survey.q42h.label" default="Q42h" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q42h', 'errors')}">
                                    <g:checkBox name="q42h" value="${surveyInstance?.q42h}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q43"><g:message code="survey.q43.label" default="Q43" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q43', 'errors')}">
                                    <g:checkBox name="q43" value="${surveyInstance?.q43}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q44"><g:message code="survey.q44.label" default="Q44" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q44', 'errors')}">
                                    <g:checkBox name="q44" value="${surveyInstance?.q44}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q45a"><g:message code="survey.q45a.label" default="Q45a" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q45a', 'errors')}">
                                    <g:checkBox name="q45a" value="${surveyInstance?.q45a}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q45b"><g:message code="survey.q45b.label" default="Q45b" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q45b', 'errors')}">
                                    <g:checkBox name="q45b" value="${surveyInstance?.q45b}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q45c"><g:message code="survey.q45c.label" default="Q45c" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q45c', 'errors')}">
                                    <g:checkBox name="q45c" value="${surveyInstance?.q45c}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q45d"><g:message code="survey.q45d.label" default="Q45d" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q45d', 'errors')}">
                                    <g:checkBox name="q45d" value="${surveyInstance?.q45d}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q45e"><g:message code="survey.q45e.label" default="Q45e" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q45e', 'errors')}">
                                    <g:checkBox name="q45e" value="${surveyInstance?.q45e}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q45f"><g:message code="survey.q45f.label" default="Q45f" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q45f', 'errors')}">
                                    <g:checkBox name="q45f" value="${surveyInstance?.q45f}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q45g"><g:message code="survey.q45g.label" default="Q45g" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q45g', 'errors')}">
                                    <g:checkBox name="q45g" value="${surveyInstance?.q45g}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q46a"><g:message code="survey.q46a.label" default="Q46a" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q46a', 'errors')}">
                                    <g:checkBox name="q46a" value="${surveyInstance?.q46a}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q46b"><g:message code="survey.q46b.label" default="Q46b" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q46b', 'errors')}">
                                    <g:checkBox name="q46b" value="${surveyInstance?.q46b}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q46c"><g:message code="survey.q46c.label" default="Q46c" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q46c', 'errors')}">
                                    <g:checkBox name="q46c" value="${surveyInstance?.q46c}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q46d"><g:message code="survey.q46d.label" default="Q46d" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q46d', 'errors')}">
                                    <g:checkBox name="q46d" value="${surveyInstance?.q46d}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q46e"><g:message code="survey.q46e.label" default="Q46e" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q46e', 'errors')}">
                                    <g:checkBox name="q46e" value="${surveyInstance?.q46e}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q46f"><g:message code="survey.q46f.label" default="Q46f" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q46f', 'errors')}">
                                    <g:checkBox name="q46f" value="${surveyInstance?.q46f}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q49_pevic_exam"><g:message code="survey.q49_pevic_exam.label" default="Q49pevicexam" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q49_pevic_exam', 'errors')}">
                                    <g:checkBox name="q49_pevic_exam" value="${surveyInstance?.q49_pevic_exam}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q50"><g:message code="survey.q50.label" default="Q50" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q50', 'errors')}">
                                    <g:checkBox name="q50" value="${surveyInstance?.q50}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q51a"><g:message code="survey.q51a.label" default="Q51a" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q51a', 'errors')}">
                                    <g:checkBox name="q51a" value="${surveyInstance?.q51a}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q51b"><g:message code="survey.q51b.label" default="Q51b" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q51b', 'errors')}">
                                    <g:checkBox name="q51b" value="${surveyInstance?.q51b}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q51c"><g:message code="survey.q51c.label" default="Q51c" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q51c', 'errors')}">
                                    <g:checkBox name="q51c" value="${surveyInstance?.q51c}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q51d"><g:message code="survey.q51d.label" default="Q51d" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q51d', 'errors')}">
                                    <g:checkBox name="q51d" value="${surveyInstance?.q51d}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q51e"><g:message code="survey.q51e.label" default="Q51e" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q51e', 'errors')}">
                                    <g:checkBox name="q51e" value="${surveyInstance?.q51e}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q51f"><g:message code="survey.q51f.label" default="Q51f" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q51f', 'errors')}">
                                    <g:checkBox name="q51f" value="${surveyInstance?.q51f}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q52"><g:message code="survey.q52.label" default="Q52" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q52', 'errors')}">
                                    <g:checkBox name="q52" value="${surveyInstance?.q52}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q53"><g:message code="survey.q53.label" default="Q53" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q53', 'errors')}">
                                    <g:checkBox name="q53" value="${surveyInstance?.q53}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q57"><g:message code="survey.q57.label" default="Q57" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q57', 'errors')}">
                                    <g:checkBox name="q57" value="${surveyInstance?.q57}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q58"><g:message code="survey.q58.label" default="Q58" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q58', 'errors')}">
                                    <g:checkBox name="q58" value="${surveyInstance?.q58}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q59"><g:message code="survey.q59.label" default="Q59" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q59', 'errors')}">
                                    <g:checkBox name="q59" value="${surveyInstance?.q59}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q59_whatAge"><g:message code="survey.q59_whatAge.label" default="Q59what Age" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q59_whatAge', 'errors')}">
                                    <g:textField name="q59_whatAge" value="${surveyInstance?.q59_whatAge}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q59_why"><g:message code="survey.q59_why.label" default="Q59why" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q59_why', 'errors')}">
                                    <g:textField name="q59_why" value="${surveyInstance?.q59_why}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q60"><g:message code="survey.q60.label" default="Q60" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q60', 'errors')}">
                                    <g:checkBox name="q60" value="${surveyInstance?.q60}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q61"><g:message code="survey.q61.label" default="Q61" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q61', 'errors')}">
                                    <g:checkBox name="q61" value="${surveyInstance?.q61}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q61_wahtAge"><g:message code="survey.q61_wahtAge.label" default="Q61waht Age" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q61_wahtAge', 'errors')}">
                                    <g:textField name="q61_wahtAge" value="${surveyInstance?.q61_wahtAge}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q62"><g:message code="survey.q62.label" default="Q62" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q62', 'errors')}">
                                    <g:checkBox name="q62" value="${surveyInstance?.q62}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q62_Q63_reasonWhyOvariesRemoved"><g:message code="survey.q62_Q63_reasonWhyOvariesRemoved.label" default="Q62 Q63reason Why Ovaries Removed" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q62_Q63_reasonWhyOvariesRemoved', 'errors')}">
                                    <g:textField name="q62_Q63_reasonWhyOvariesRemoved" value="${surveyInstance?.q62_Q63_reasonWhyOvariesRemoved}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q62_Q63_whatAgeOvariesRemoved"><g:message code="survey.q62_Q63_whatAgeOvariesRemoved.label" default="Q62 Q63what Age Ovaries Removed" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q62_Q63_whatAgeOvariesRemoved', 'errors')}">
                                    <g:textField name="q62_Q63_whatAgeOvariesRemoved" value="${surveyInstance?.q62_Q63_whatAgeOvariesRemoved}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q63"><g:message code="survey.q63.label" default="Q63" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q63', 'errors')}">
                                    <g:checkBox name="q63" value="${surveyInstance?.q63}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q66"><g:message code="survey.q66.label" default="Q66" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q66', 'errors')}">
                                    <g:checkBox name="q66" value="${surveyInstance?.q66}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q66_Q67_whatAgeMenopauseStarted"><g:message code="survey.q66_Q67_whatAgeMenopauseStarted.label" default="Q66 Q67what Age Menopause Started" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q66_Q67_whatAgeMenopauseStarted', 'errors')}">
                                    <g:textField name="q66_Q67_whatAgeMenopauseStarted" value="${surveyInstance?.q66_Q67_whatAgeMenopauseStarted}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q67"><g:message code="survey.q67.label" default="Q67" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q67', 'errors')}">
                                    <g:checkBox name="q67" value="${surveyInstance?.q67}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q69"><g:message code="survey.q69.label" default="Q69" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q69', 'errors')}">
                                    <g:checkBox name="q69" value="${surveyInstance?.q69}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q69_forWhat"><g:message code="survey.q69_forWhat.label" default="Q69for What" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q69_forWhat', 'errors')}">
                                    <g:textField name="q69_forWhat" value="${surveyInstance?.q69_forWhat}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q69_whatAgeStartTakingHormones"><g:message code="survey.q69_whatAgeStartTakingHormones.label" default="Q69what Age Start Taking Hormones" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q69_whatAgeStartTakingHormones', 'errors')}">
                                    <g:textField name="q69_whatAgeStartTakingHormones" value="${surveyInstance?.q69_whatAgeStartTakingHormones}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q69_whichHormone"><g:message code="survey.q69_whichHormone.label" default="Q69which Hormone" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q69_whichHormone', 'errors')}">
                                    <g:textField name="q69_whichHormone" value="${surveyInstance?.q69_whichHormone}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q70"><g:message code="survey.q70.label" default="Q70" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q70', 'errors')}">
                                    <g:checkBox name="q70" value="${surveyInstance?.q70}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q72"><g:message code="survey.q72.label" default="Q72" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q72', 'errors')}">
                                    <g:checkBox name="q72" value="${surveyInstance?.q72}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q72_howManyTimesBeenPregnant"><g:message code="survey.q72_howManyTimesBeenPregnant.label" default="Q72how Many Times Been Pregnant" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q72_howManyTimesBeenPregnant', 'errors')}">
                                    <g:textField name="q72_howManyTimesBeenPregnant" value="${fieldValue(bean: surveyInstance, field: 'q72_howManyTimesBeenPregnant')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q72_pregnantButDead"><g:message code="survey.q72_pregnantButDead.label" default="Q72pregnant But Dead" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q72_pregnantButDead', 'errors')}">
                                    <g:textField name="q72_pregnantButDead" value="${fieldValue(bean: surveyInstance, field: 'q72_pregnantButDead')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q72_pregnantButMiscarriage"><g:message code="survey.q72_pregnantButMiscarriage.label" default="Q72pregnant But Miscarriage" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q72_pregnantButMiscarriage', 'errors')}">
                                    <g:textField name="q72_pregnantButMiscarriage" value="${fieldValue(bean: surveyInstance, field: 'q72_pregnantButMiscarriage')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q72_prenantThenAlive"><g:message code="survey.q72_prenantThenAlive.label" default="Q72prenant Then Alive" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q72_prenantThenAlive', 'errors')}">
                                    <g:textField name="q72_prenantThenAlive" value="${fieldValue(bean: surveyInstance, field: 'q72_prenantThenAlive')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q77"><g:message code="survey.q77.label" default="Q77" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q77', 'errors')}">
                                    <g:checkBox name="q77" value="${surveyInstance?.q77}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q79"><g:message code="survey.q79.label" default="Q79" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q79', 'errors')}">
                                    <g:checkBox name="q79" value="${surveyInstance?.q79}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q80"><g:message code="survey.q80.label" default="Q80" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q80', 'errors')}">
                                    <g:checkBox name="q80" value="${surveyInstance?.q80}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q80_howLongContraceptiveMethodUsed"><g:message code="survey.q80_howLongContraceptiveMethodUsed.label" default="Q80how Long Contraceptive Method Used" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q80_howLongContraceptiveMethodUsed', 'errors')}">
                                    <g:textField name="q80_howLongContraceptiveMethodUsed" value="${surveyInstance?.q80_howLongContraceptiveMethodUsed}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q80_whatAgeContraceptiveMethodUsed"><g:message code="survey.q80_whatAgeContraceptiveMethodUsed.label" default="Q80what Age Contraceptive Method Used" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q80_whatAgeContraceptiveMethodUsed', 'errors')}">
                                    <g:textField name="q80_whatAgeContraceptiveMethodUsed" value="${surveyInstance?.q80_whatAgeContraceptiveMethodUsed}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q80_whichContraceptiveMethod"><g:message code="survey.q80_whichContraceptiveMethod.label" default="Q80which Contraceptive Method" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q80_whichContraceptiveMethod', 'errors')}">
                                    <g:textField name="q80_whichContraceptiveMethod" value="${surveyInstance?.q80_whichContraceptiveMethod}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q81_whichContraceptiveMethodCurrentlyUse"><g:message code="survey.q81_whichContraceptiveMethodCurrentlyUse.label" default="Q81which Contraceptive Method Currently Use" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q81_whichContraceptiveMethodCurrentlyUse', 'errors')}">
                                    <g:textField name="q81_whichContraceptiveMethodCurrentlyUse" value="${surveyInstance?.q81_whichContraceptiveMethodCurrentlyUse}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q82"><g:message code="survey.q82.label" default="Q82" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q82', 'errors')}">
                                    <g:checkBox name="q82" value="${surveyInstance?.q82}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q83"><g:message code="survey.q83.label" default="Q83" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q83', 'errors')}">
                                    <g:checkBox name="q83" value="${surveyInstance?.q83}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q85"><g:message code="survey.q85.label" default="Q85" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q85', 'errors')}">
                                    <g:checkBox name="q85" value="${surveyInstance?.q85}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q85_whichOne"><g:message code="survey.q85_whichOne.label" default="Q85which One" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q85_whichOne', 'errors')}">
                                    <g:textField name="q85_whichOne" value="${surveyInstance?.q85_whichOne}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q86_vitamin"><g:message code="survey.q86_vitamin.label" default="Q86vitamin" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q86_vitamin', 'errors')}">
                                    <g:checkBox name="q86_vitamin" value="${surveyInstance?.q86_vitamin}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q87_howOften_vitamin"><g:message code="survey.q87_howOften_vitamin.label" default="Q87how Oftenvitamin" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q87_howOften_vitamin', 'errors')}">
                                    <g:textField name="q87_howOften_vitamin" value="${surveyInstance?.q87_howOften_vitamin}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q88"><g:message code="survey.q88.label" default="Q88" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q88', 'errors')}">
                                    <g:checkBox name="q88" value="${surveyInstance?.q88}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q89a"><g:message code="survey.q89a.label" default="Q89a" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q89a', 'errors')}">
                                    <g:checkBox name="q89a" value="${surveyInstance?.q89a}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q89b"><g:message code="survey.q89b.label" default="Q89b" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q89b', 'errors')}">
                                    <g:checkBox name="q89b" value="${surveyInstance?.q89b}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q89c"><g:message code="survey.q89c.label" default="Q89c" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q89c', 'errors')}">
                                    <g:checkBox name="q89c" value="${surveyInstance?.q89c}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q89d"><g:message code="survey.q89d.label" default="Q89d" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q89d', 'errors')}">
                                    <g:checkBox name="q89d" value="${surveyInstance?.q89d}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q89e"><g:message code="survey.q89e.label" default="Q89e" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q89e', 'errors')}">
                                    <g:checkBox name="q89e" value="${surveyInstance?.q89e}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q89f"><g:message code="survey.q89f.label" default="Q89f" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q89f', 'errors')}">
                                    <g:checkBox name="q89f" value="${surveyInstance?.q89f}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q89g"><g:message code="survey.q89g.label" default="Q89g" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q89g', 'errors')}">
                                    <g:checkBox name="q89g" value="${surveyInstance?.q89g}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q89h"><g:message code="survey.q89h.label" default="Q89h" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q89h', 'errors')}">
                                    <g:checkBox name="q89h" value="${surveyInstance?.q89h}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q89h_otherVitamin"><g:message code="survey.q89h_otherVitamin.label" default="Q89hother Vitamin" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q89h_otherVitamin', 'errors')}">
                                    <g:textField name="q89h_otherVitamin" value="${surveyInstance?.q89h_otherVitamin}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q90a"><g:message code="survey.q90a.label" default="Q90a" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q90a', 'errors')}">
                                    <g:checkBox name="q90a" value="${surveyInstance?.q90a}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q90a_age"><g:message code="survey.q90a_age.label" default="Q90aage" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q90a_age', 'errors')}">
                                    <g:textField name="q90a_age" value="${surveyInstance?.q90a_age}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q90a_year"><g:message code="survey.q90a_year.label" default="Q90ayear" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q90a_year', 'errors')}">
                                    <g:textField name="q90a_year" value="${surveyInstance?.q90a_year}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q90b"><g:message code="survey.q90b.label" default="Q90b" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q90b', 'errors')}">
                                    <g:checkBox name="q90b" value="${surveyInstance?.q90b}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q90b_age"><g:message code="survey.q90b_age.label" default="Q90bage" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q90b_age', 'errors')}">
                                    <g:textField name="q90b_age" value="${surveyInstance?.q90b_age}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q90b_year"><g:message code="survey.q90b_year.label" default="Q90byear" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q90b_year', 'errors')}">
                                    <g:textField name="q90b_year" value="${surveyInstance?.q90b_year}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q90c"><g:message code="survey.q90c.label" default="Q90c" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q90c', 'errors')}">
                                    <g:checkBox name="q90c" value="${surveyInstance?.q90c}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q90c_age"><g:message code="survey.q90c_age.label" default="Q90cage" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q90c_age', 'errors')}">
                                    <g:textField name="q90c_age" value="${surveyInstance?.q90c_age}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q90c_year"><g:message code="survey.q90c_year.label" default="Q90cyear" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q90c_year', 'errors')}">
                                    <g:textField name="q90c_year" value="${surveyInstance?.q90c_year}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q90d"><g:message code="survey.q90d.label" default="Q90d" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q90d', 'errors')}">
                                    <g:checkBox name="q90d" value="${surveyInstance?.q90d}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q90d_age"><g:message code="survey.q90d_age.label" default="Q90dage" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q90d_age', 'errors')}">
                                    <g:textField name="q90d_age" value="${surveyInstance?.q90d_age}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q90d_year"><g:message code="survey.q90d_year.label" default="Q90dyear" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q90d_year', 'errors')}">
                                    <g:textField name="q90d_year" value="${surveyInstance?.q90d_year}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q90e"><g:message code="survey.q90e.label" default="Q90e" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q90e', 'errors')}">
                                    <g:checkBox name="q90e" value="${surveyInstance?.q90e}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q90e_age"><g:message code="survey.q90e_age.label" default="Q90eage" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q90e_age', 'errors')}">
                                    <g:textField name="q90e_age" value="${surveyInstance?.q90e_age}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q90f"><g:message code="survey.q90f.label" default="Q90f" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q90f', 'errors')}">
                                    <g:checkBox name="q90f" value="${surveyInstance?.q90f}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q90f_age"><g:message code="survey.q90f_age.label" default="Q90fage" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q90f_age', 'errors')}">
                                    <g:textField name="q90f_age" value="${surveyInstance?.q90f_age}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q90f_year"><g:message code="survey.q90f_year.label" default="Q90fyear" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q90f_year', 'errors')}">
                                    <g:textField name="q90f_year" value="${surveyInstance?.q90f_year}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q92a"><g:message code="survey.q92a.label" default="Q92a" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q92a', 'errors')}">
                                    <g:textField name="q92a" value="${surveyInstance?.q92a}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q92a_years"><g:message code="survey.q92a_years.label" default="Q92ayears" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q92a_years', 'errors')}">
                                    <g:textField name="q92a_years" value="${surveyInstance?.q92a_years}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q92b"><g:message code="survey.q92b.label" default="Q92b" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q92b', 'errors')}">
                                    <g:textField name="q92b" value="${surveyInstance?.q92b}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q92b_years"><g:message code="survey.q92b_years.label" default="Q92byears" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q92b_years', 'errors')}">
                                    <g:textField name="q92b_years" value="${surveyInstance?.q92b_years}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q92c"><g:message code="survey.q92c.label" default="Q92c" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q92c', 'errors')}">
                                    <g:textField name="q92c" value="${surveyInstance?.q92c}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q92c_years"><g:message code="survey.q92c_years.label" default="Q92cyears" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q92c_years', 'errors')}">
                                    <g:textField name="q92c_years" value="${surveyInstance?.q92c_years}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q92d"><g:message code="survey.q92d.label" default="Q92d" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q92d', 'errors')}">
                                    <g:textField name="q92d" value="${surveyInstance?.q92d}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q92d_years"><g:message code="survey.q92d_years.label" default="Q92dyears" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q92d_years', 'errors')}">
                                    <g:textField name="q92d_years" value="${surveyInstance?.q92d_years}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q92e"><g:message code="survey.q92e.label" default="Q92e" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q92e', 'errors')}">
                                    <g:textField name="q92e" value="${surveyInstance?.q92e}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q92e_years"><g:message code="survey.q92e_years.label" default="Q92eyears" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q92e_years', 'errors')}">
                                    <g:textField name="q92e_years" value="${surveyInstance?.q92e_years}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q92f"><g:message code="survey.q92f.label" default="Q92f" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q92f', 'errors')}">
                                    <g:textField name="q92f" value="${surveyInstance?.q92f}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q92f_years"><g:message code="survey.q92f_years.label" default="Q92fyears" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q92f_years', 'errors')}">
                                    <g:textField name="q92f_years" value="${surveyInstance?.q92f_years}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q92g"><g:message code="survey.q92g.label" default="Q92g" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q92g', 'errors')}">
                                    <g:textField name="q92g" value="${surveyInstance?.q92g}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q92g_years"><g:message code="survey.q92g_years.label" default="Q92gyears" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q92g_years', 'errors')}">
                                    <g:textField name="q92g_years" value="${surveyInstance?.q92g_years}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q92h"><g:message code="survey.q92h.label" default="Q92h" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q92h', 'errors')}">
                                    <g:textField name="q92h" value="${surveyInstance?.q92h}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q92h_years"><g:message code="survey.q92h_years.label" default="Q92hyears" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q92h_years', 'errors')}">
                                    <g:textField name="q92h_years" value="${surveyInstance?.q92h_years}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q92i"><g:message code="survey.q92i.label" default="Q92i" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q92i', 'errors')}">
                                    <g:textField name="q92i" value="${surveyInstance?.q92i}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q92i_years"><g:message code="survey.q92i_years.label" default="Q92iyears" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q92i_years', 'errors')}">
                                    <g:textField name="q92i_years" value="${surveyInstance?.q92i_years}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q93"><g:message code="survey.q93.label" default="Q93" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q93', 'errors')}">
                                    <g:checkBox name="q93" value="${surveyInstance?.q93}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q93a"><g:message code="survey.q93a.label" default="Q93a" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q93a', 'errors')}">
                                    <g:textField name="q93a" value="${surveyInstance?.q93a}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q93a_months"><g:message code="survey.q93a_months.label" default="Q93amonths" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q93a_months', 'errors')}">
                                    <g:textField name="q93a_months" value="${surveyInstance?.q93a_months}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q93b"><g:message code="survey.q93b.label" default="Q93b" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q93b', 'errors')}">
                                    <g:textField name="q93b" value="${surveyInstance?.q93b}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q93b_months"><g:message code="survey.q93b_months.label" default="Q93bmonths" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q93b_months', 'errors')}">
                                    <g:textField name="q93b_months" value="${surveyInstance?.q93b_months}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q93c"><g:message code="survey.q93c.label" default="Q93c" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q93c', 'errors')}">
                                    <g:textField name="q93c" value="${surveyInstance?.q93c}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q93c_months"><g:message code="survey.q93c_months.label" default="Q93cmonths" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q93c_months', 'errors')}">
                                    <g:textField name="q93c_months" value="${surveyInstance?.q93c_months}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q93d"><g:message code="survey.q93d.label" default="Q93d" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q93d', 'errors')}">
                                    <g:textField name="q93d" value="${surveyInstance?.q93d}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q93d_months"><g:message code="survey.q93d_months.label" default="Q93dmonths" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q93d_months', 'errors')}">
                                    <g:textField name="q93d_months" value="${surveyInstance?.q93d_months}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q93e"><g:message code="survey.q93e.label" default="Q93e" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q93e', 'errors')}">
                                    <g:textField name="q93e" value="${surveyInstance?.q93e}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="q93e_months"><g:message code="survey.q93e_months.label" default="Q93emonths" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'q93e_months', 'errors')}">
                                    <g:textField name="q93e_months" value="${surveyInstance?.q93e_months}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="results_PSA_test"><g:message code="survey.results_PSA_test.label" default="Results PSA test" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'results_PSA_test', 'errors')}">
                                    <g:textField name="results_PSA_test" value="${surveyInstance?.results_PSA_test}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="results_pap_smear"><g:message code="survey.results_pap_smear.label" default="Resultspapsmear" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'results_pap_smear', 'errors')}">
                                    <g:textField name="results_pap_smear" value="${surveyInstance?.results_pap_smear}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="second_hand_smoke_home"><g:message code="survey.second_hand_smoke_home.label" default="Secondhandsmokehome" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'second_hand_smoke_home', 'errors')}">
                                    <g:textField name="second_hand_smoke_home" value="${surveyInstance?.second_hand_smoke_home}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="second_hand_smoke_home_years"><g:message code="survey.second_hand_smoke_home_years.label" default="Secondhandsmokehomeyears" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'second_hand_smoke_home_years', 'errors')}">
                                    <g:textField name="second_hand_smoke_home_years" value="${surveyInstance?.second_hand_smoke_home_years}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="second_hand_smoke_leisure"><g:message code="survey.second_hand_smoke_leisure.label" default="Secondhandsmokeleisure" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'second_hand_smoke_leisure', 'errors')}">
                                    <g:textField name="second_hand_smoke_leisure" value="${surveyInstance?.second_hand_smoke_leisure}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="second_hand_smoke_leisure_years"><g:message code="survey.second_hand_smoke_leisure_years.label" default="Secondhandsmokeleisureyears" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'second_hand_smoke_leisure_years', 'errors')}">
                                    <g:textField name="second_hand_smoke_leisure_years" value="${surveyInstance?.second_hand_smoke_leisure_years}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="second_hand_smoke_work"><g:message code="survey.second_hand_smoke_work.label" default="Secondhandsmokework" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'second_hand_smoke_work', 'errors')}">
                                    <g:textField name="second_hand_smoke_work" value="${surveyInstance?.second_hand_smoke_work}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="second_hand_smoke_work_years"><g:message code="survey.second_hand_smoke_work_years.label" default="Secondhandsmokeworkyears" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'second_hand_smoke_work_years', 'errors')}">
                                    <g:textField name="second_hand_smoke_work_years" value="${surveyInstance?.second_hand_smoke_work_years}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="sex"><g:message code="survey.sex.label" default="Sex" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'sex', 'errors')}">
                                    <g:textField name="sex" value="${surveyInstance?.sex}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="weight"><g:message code="survey.weight.label" default="Weight" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'weight', 'errors')}">
                                    <g:textField name="weight" value="${surveyInstance?.weight}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="whatAgeFirstChild"><g:message code="survey.whatAgeFirstChild.label" default="What Age First Child" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'whatAgeFirstChild', 'errors')}">
                                    <g:textField name="whatAgeFirstChild" value="${surveyInstance?.whatAgeFirstChild}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="whatAgeFirstMenstrual"><g:message code="survey.whatAgeFirstMenstrual.label" default="What Age First Menstrual" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'whatAgeFirstMenstrual', 'errors')}">
                                    <g:textField name="whatAgeFirstMenstrual" value="${surveyInstance?.whatAgeFirstMenstrual}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="whatAgeFirstPregnant"><g:message code="survey.whatAgeFirstPregnant.label" default="What Age First Pregnant" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'whatAgeFirstPregnant', 'errors')}">
                                    <g:textField name="whatAgeFirstPregnant" value="${surveyInstance?.whatAgeFirstPregnant}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="whatIsProblem_Q26"><g:message code="survey.whatIsProblem_Q26.label" default="What Is Problem Q26" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'whatIsProblem_Q26', 'errors')}">
                                    <g:textField name="whatIsProblem_Q26" value="${surveyInstance?.whatIsProblem_Q26}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="whenStopSmoking_months"><g:message code="survey.whenStopSmoking_months.label" default="When Stop Smokingmonths" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'whenStopSmoking_months', 'errors')}">
                                    <g:textField name="whenStopSmoking_months" value="${surveyInstance?.whenStopSmoking_months}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="whenStopSmoking_years"><g:message code="survey.whenStopSmoking_years.label" default="When Stop Smokingyears" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'whenStopSmoking_years', 'errors')}">
                                    <g:textField name="whenStopSmoking_years" value="${surveyInstance?.whenStopSmoking_years}" />
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
