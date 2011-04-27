 function checkVerifyForm()
{
	// instantiate object
	fv = new formValidator();
	
	if (!fv.isRadioChecked(document.getElementsByName('being_treated_for_cancer'))){
		fv.raiseError(i18nmessages.step1Err1);
	}
	if (!fv.isRadioChecked(document.getElementsByName('sex'))){
		fv.raiseError(i18nmessages.step1Err2);
	}	
	if (fv.isEmpty(document.getElementById('DOB_day').value) ||
		fv.isEmpty(document.getElementById('DOB_month').value) ||
		fv.isEmpty(document.getElementById('DOB_year').value)){
			fv.raiseError(i18nmessages.step1Err3);
	}
	if ($('#DOB_month option:selected').val()=='2'){
		if ($('#DOB_day option:selected').val()=='30' || $('#DOB_day option:selected').val()=='31')
			fv.raiseError(i18nmessages.step1Err4)
	}
	if (($('#DOB_month option:selected').val()=='4' && $('#DOB_day option:selected').val()=='31') ||
		($('#DOB_month option:selected').val()=='6' && $('#DOB_day option:selected').val()=='31') ||
		($('#DOB_month option:selected').val()=='9' && $('#DOB_day option:selected').val()=='31') ||
		($('#DOB_month option:selected').val()=='11' && $('#DOB_day option:selected').val()=='31'))
	{
		fv.raiseError(i18nmessages.step1Err4)
	}	
	if (!fv.isRadioChecked(document.getElementsByName('race'))){
		fv.raiseError(i18nmessages.step1Err5);
	}	
	if (fv.needSpecify(document.getElementsByName('race'), document.getElementById('other_race'), 'other')){
		fv.raiseError(i18nmessages.step1Err6);
	}
	if (!fv.isRadioChecked(document.getElementsByName('hispanic_or_latino'))){
		fv.raiseError(i18nmessages.step1Err7);
	}
	if (fv.isEmpty(document.getElementById('addr_street1').value) ||
		fv.isEmpty(document.getElementById('addr_city').value) ||
		fv.isEmpty(document.getElementById('addr_state').value) ||
		fv.isEmpty(document.getElementById('addr_zipcode').value)){
			fv.raiseError(i18nmessages.step1Err8);
	}
	if (!fv.isValidZipcode(document.getElementById('addr_zipcode').value)){
		fv.raiseError(i18nmessages.step1Err9);
	}
	if (fv.isEmpty(document.getElementById('country').value) || document.getElementById('country').value=='--'){
		fv.raiseError(i18nmessages.step1Err10);
	}
	if (!fv.isRadioChecked(document.getElementsByName('marital_status'))){
		fv.raiseError(i18nmessages.step1Err11);
	}	
	if (!fv.isRadioChecked(document.getElementsByName('education'))){
		fv.raiseError(i18nmessages.step1Err12);
	}
	if (fv.isEmpty(document.getElementById('current_occupation').value) || fv.isEmpty(document.getElementById('current_occupation_time').value)){
		fv.raiseError(i18nmessages.step1Err13);
	}
	if (!fv.isEmpty(document.getElementById('current_occupation_time').value) && !fv.isNumber(document.getElementById('current_occupation_time').value)){
		fv.raiseError(i18nmessages.step1Err14);
	}
	//if (fv.isEmpty(document.getElementById('prior_job').value) || fv.isEmpty(document.getElementById('prior_job_time').value)){
	//	fv.raiseError("Q9: Enter Prior job & number of years with it.");
	//}
	if (!fv.isEmpty(document.getElementById('prior_job_time').value) && !fv.isNumber(document.getElementById('prior_job_time').value)){
		fv.raiseError(i18nmessages.step1Err15);
	}
	if (fv.needSpecify(document.getElementsByName('q8_1'), document.getElementById('q8_1_which'), 'yes')){
		fv.raiseError(i18nmessages.step1Err16);
	}	
	if (fv.needSpecify(document.getElementsByName('q8_4'), document.getElementById('q8_4_which'), 'yes')){
		fv.raiseError(i18nmessages.step1Err17);
	}	
	if (!fv.isRadioChecked(document.getElementsByName('q8_1')) ||
	    !fv.isRadioChecked(document.getElementsByName('q8_2')) ||
	    !fv.isRadioChecked(document.getElementsByName('q8_3')) ||
	    !fv.isRadioChecked(document.getElementsByName('q8_4')) ||
	    !fv.isRadioChecked(document.getElementsByName('q8_5')) ){
		fv.raiseError(i18nmessages.step1Err18)
	}
	
//////////////////////////////////////////////////////////	
	if (fv.isEmpty(document.getElementById('weight').value)){
		fv.raiseError(i18nmessages.step2Err1);
	}
	else{
		if (!fv.isValidNumber(document.getElementById('weight').value, 10, 1000)){
			fv.raiseError(i18nmessages.step2Err2);
		}
	}	
	if (fv.isEmpty(document.getElementById('height_feet').value)){
		fv.raiseError(i18nmessages.step2Err3);
	}
	else{
		if (!fv.isValidNumber(document.getElementById('height_feet').value, 0, 10)){
			fv.raiseError(i18nmessages.step2Err4);
		}
	}	
	if (fv.isEmpty(document.getElementById('height_inches').value)){
		fv.raiseError(i18nmessages.step2Err5);
	}		
	else{
		if (!fv.isValidNumber(document.getElementById('height_inches').value, 0, 11)){
			fv.raiseError(i18nmessages.step2Err6);
		}
	}
	if  (!$('#q11a_hep_donotknow_type').attr("checked") ){
		if ( !fv.isRadioChecked(document.getElementsByName('q11a_1')) || !fv.isRadioChecked(document.getElementsByName('q11a_2')) || !fv.isRadioChecked(document.getElementsByName('q11a_3')) ){
			fv.raiseError(i18nmessages.step2Err8+" 1");
		}
	}
	if (!fv.isRadioChecked(document.getElementsByName('q11a_4')) ||
		!fv.isRadioChecked(document.getElementsByName('q11a_5')) ||
		!fv.isRadioChecked(document.getElementsByName('q11a_6')) ){
			fv.raiseError(i18nmessages.step2Err8+" 2");	
	}
	if (fv.needSpecify(document.getElementsByName('q11a_1'), document.getElementById('q11a_1Year_year'), 'yes')||
			fv.needSpecify(document.getElementsByName('q11a_2'), document.getElementById('q11a_2Year_year'), 'yes')||
			fv.needSpecify(document.getElementsByName('q11a_3'), document.getElementById('q11a_3Year_year'), 'yes')||
			fv.needSpecify(document.getElementsByName('q11a_4'), document.getElementById('q11a_4Year_year'), 'yes')||
			fv.needSpecify(document.getElementsByName('q11a_5'), document.getElementById('q11a_5Year_year'), 'yes')||
			fv.needSpecify(document.getElementsByName('q11a_6'), document.getElementById('q11a_6Year_year'), 'yes')){
		fv.raiseError(i18nmessages.step2Err9);
	}

	if (!fv.isRadioChecked(document.getElementsByName('haveCancer'))){
		fv.raiseError(i18nmessages.step2Err10);
	}
	var c1=false;
	$(':regex(id,q12_([0-9]|[0-9][0-9])_[1-4])').each( function() {
		if (this.checked) c1=true;
	});
	if (!c1 && getRadioValue(document.getElementsByName('haveCancer'))=='yes'){
		fv.raiseError(i18nmessages.step2Err11);
	}
	for (i=1;i<=24;i++){
		r1=false;
		for (j=1;j<=4;j++){
			if ($("#q12_"+i+"_"+j).is(':checked')) r1=true;
		}
		if (r1 && $("#q12_"+i+"_ageDiagnosed").val()==''){
			fv.raiseError(i18nmessages.step2Err12+" (#"+i+").")
		}
		if ($("#q12_"+i+"_ageDiagnosed").val()!='' && !isValidNumber($("#q12_"+i+"_ageDiagnosed").val(), 1, 125)){
			fv.raiseError(i18nmessages.step2Err13+" (#"+i+").");
		}
	}

	if (!fv.isRadioChecked(document.getElementsByName('spread_cancer'))){
		fv.raiseError(i18nmessages.step2Err14);
	}
	else{ // if answered (yes or no)
		if (getRadioValue(document.getElementsByName('spread_cancer'))=='yes'){
			sp1=false;
			$("[name*='spread_'][type=checkbox]").each( function() {
				if (this.checked) sp1=true;
			});
			if (!sp1)
				fv.raiseError(i18nmessages.step2Err15);
			if ($('#spread_other').is(':checked') && $('#spread_where').val()=='')
				fv.raiseError(i18nmessages.step2Err16);
		}
	}	
/////////////////////////////////////////
	if (!fv.isRadioChecked(document.getElementsByName('familyHaveCancer')))
	{
		fv.raiseError(i18nmessages.step3Err1);
	}

	var c1=false;
	$(':regex(id,q13_([0-9]|[0-9][0-9])_cancerType)').each( function() {
		if (this.value!='') c1=true;
	});
	var c2=false;
	$(':regex(id,q13_([0-9]|[0-9][0-9])_ageDiagnosed)').each( function() {
		if (this.value!='') c2=true;
	});
	if (!c1 && !c2 && getRadioValue(document.getElementsByName('familyHaveCancer'))=='yes'){
		fv.raiseError(i18nmessages.step3Err2);
	}
	for (i=1;i<=15;i++){
		if (($("#q13_"+i+"_cancerType").val()!='' && $("#q13_"+i+"_ageDiagnosed").val()=='') ||
			($("#q13_"+i+"_cancerType").val()=='' && $("#q13_"+i+"_ageDiagnosed").val()!='')){
			fv.raiseError(i18nmessages.step3Err3+" (#"+i+").");
		}
		if ($("#q13_"+i+"_ageDiagnosed").val()!='' && !fv.isValidNumber($("#q13_"+i+"_ageDiagnosed").val(), 1, 125)){
			fv.raiseError(i18nmessages.step3Err4+" (#"+i+").");
		}		
	}	
	///////////////////////////////////////////////////////////
	if (!fv.isRadioChecked(document.getElementsByName('q14_1')) ||
		!fv.isRadioChecked(document.getElementsByName('q14_2')) ||
		!fv.isRadioChecked(document.getElementsByName('q14_3')))
	{
		fv.raiseError(i18nmessages.step4Err1);
	}
	if (getRadioValue(document.getElementsByName('q14_1'))=='drink' &&
		($('#q14_1_howManyPerWeek').val()=='' || !fv.isValidNumber($('#q14_1_howManyPerWeek').val(), 1, 100)) ){
		fv.raiseError(i18nmessages.step4Err2);
	}
	if (getRadioValue(document.getElementsByName('q14_2'))=='drink' &&
		($('#q14_2_howManyPerWeek').val()=='' || !fv.isValidNumber($('#q14_2_howManyPerWeek').val(), 1, 100)) ){
		fv.raiseError(i18nmessages.step4Err3);
	}
	if (getRadioValue(document.getElementsByName('q14_3'))=='drink' &&
		($('#q14_3_howManyPerWeek').val()=='' || !fv.isValidNumber($('#q14_3_howManyPerWeek').val(), 1, 100)) ){
		fv.raiseError(i18nmessages.step4Err4);
	}
	if (!fv.isRadioChecked(document.getElementsByName('q15_1')) ||
		!fv.isRadioChecked(document.getElementsByName('q15_2')) ||
		!fv.isRadioChecked(document.getElementsByName('q15_3')) ||
		!fv.isRadioChecked(document.getElementsByName('q15_4')))
	{
		fv.raiseError(i18nmessages.step4Err5);
	}
	if ((getRadioValue(document.getElementsByName('q15_1'))=='currently' || getRadioValue(document.getElementsByName('q15_1'))=='quit') &&
		(($('#q15_1_howManyTimesPerWeek').val()=='' && $('#q15_1_howManyYears').val()=='') ||
		 (!fv.isValidNumber($('#q15_1_howManyTimesPerWeek').val(), 1, 200)) || !fv.isValidNumber($('#q15_1_howManyYears').val(), 1, 125))
	   ){
		fv.raiseError(i18nmessages.step4Err6);
	}
	if ((getRadioValue(document.getElementsByName('q15_2'))=='currently' || getRadioValue(document.getElementsByName('q15_2'))=='quit') &&
		(($('#q15_2_howManyTimesPerWeek').val()=='' && $('#q15_2_howManyYears').val()=='') ||
		 (!fv.isValidNumber($('#q15_2_howManyTimesPerWeek').val(), 1, 200)) || !fv.isValidNumber($('#q15_2_howManyYears').val(), 1, 125))
	   ){
		fv.raiseError(i18nmessages.step4Err7);
	}
	if ((getRadioValue(document.getElementsByName('q15_3'))=='currently' || getRadioValue(document.getElementsByName('q15_3'))=='quit') &&
		(($('#q15_3_howManyTimesPerWeek').val()=='' && $('#q15_3_howManyYears').val()=='') ||
		 (!fv.isValidNumber($('#q15_3_howManyTimesPerWeek').val(), 1, 200)) || !fv.isValidNumber($('#q15_3_howManyYears').val(), 1, 125))
	   ){
		fv.raiseError(i18nmessages.step4Err8);
	}
	if ((getRadioValue(document.getElementsByName('q15_4'))=='currently' || getRadioValue(document.getElementsByName('q15_4'))=='quit') &&
		(($('#q15_4_howManyTimesPerWeek').val()=='' && $('#q15_4_howManyYears').val()=='') ||
		 (!fv.isValidNumber($('#q15_4_howManyTimesPerWeek').val(), 1, 200)) || !fv.isValidNumber($('#q15_4_howManyYears').val(), 1, 125))
	   ){
		fv.raiseError(i18nmessages.step4Err9);
	}					
	if (!fv.isRadioChecked(document.getElementsByName('q16')))
	{
		fv.raiseError(i18nmessages.step4Err10);
	}

	if (getRadioValue(document.getElementsByName('q16'))=='yes' &&
		(fv.isEmpty(document.getElementById('q17').value) ||
		 fv.isEmpty(document.getElementById('q18').value) ||
		 fv.isEmpty(document.getElementById('q19').value) ||
		 !fv.isRadioChecked(document.getElementsByName('stillSmoke')))
		){
		fv.raiseError(i18nmessages.step4Err11);
	}	
	s1=false;
	$("[name*='q21_']").each( function() {
		if (this.value!='') s1=true;
	});
	if (!s1 && getRadioValue(document.getElementsByName('stillSmoke'))=='no'){
		fv.raiseError(i18nmessages.step4Err12)
	}
/////////////////////////////////////////////////////////	
	if (!fv.isRadioChecked(document.getElementsByName('q22_1')) ||
		!fv.isRadioChecked(document.getElementsByName('q22_2')) ||
		!fv.isRadioChecked(document.getElementsByName('q22_3')) ||
		!fv.isRadioChecked(document.getElementsByName('q22_4')) ||
		!fv.isRadioChecked(document.getElementsByName('q22_5')) ||
		!fv.isRadioChecked(document.getElementsByName('q22_6')) ||
		!fv.isRadioChecked(document.getElementsByName('q22_7')) )
	{
		fv.raiseError(i18nmessages.step5Err1);
	}
	if (getRadioValue(document.getElementsByName('q22_8'))!='never' && fv.isEmpty($('#q22_others').val()) )
	{
		fv.raiseError(i18nmessages.step5Err2);
	}
	
	if (!fv.isRadioChecked(document.getElementsByName('LevelOfActivity')))
	{
		fv.raiseError(i18nmessages.step5Err3);
	}
	////////////////////////////////////////////////////
	if (!fv.isRadioChecked(document.getElementsByName('q24_howDoYouFeelRightNow')))
	{
		fv.raiseError(i18nmessages.step6Err1);
	}
	if (fv.isEmpty(document.getElementById('q25_howHaveYouFeltForPast4Weeks').value))
	{
		fv.raiseError(i18nmessages.step6Err2);
	}
	if (!fv.isRadioChecked(document.getElementsByName('q26')))
	{
		fv.raiseError(i18nmessages.step6Err3);
	}
	if (getRadioValue(document.getElementsByName('q26'))=='yes' && $('#q26_explain').val()=='')
	{
		fv.raiseError(i18nmessages.step6Err4);
	}	
	if (!fv.isRadioChecked(document.getElementsByName('q27')))
	{
		fv.raiseError(i18nmessages.step6Err5);
	}
	if (!fv.isRadioChecked(document.getElementsByName('q28')))
	{
		fv.raiseError(i18nmessages.step6Err6);
	}
	if (!fv.isRadioChecked(document.getElementsByName('q29_1')) ||
		!fv.isRadioChecked(document.getElementsByName('q29_2')) ||
		!fv.isRadioChecked(document.getElementsByName('q29_3')) ||
		!fv.isRadioChecked(document.getElementsByName('q29_4')) ||
		!fv.isRadioChecked(document.getElementsByName('q29_5')) ||
		!fv.isRadioChecked(document.getElementsByName('q29_6')) )
	{
		fv.raiseError(i18nmessages.step6Err7);
	}
	if (getRadioValue(document.getElementsByName('q29_7'))=='yes' && fv.isEmpty($('#q29_other').val()) )
	{
		fv.raiseError(i18nmessages.step6Err8);
	}			
	/////////////////////////////////////////////////////////////
	if (!fv.isRadioChecked(document.getElementsByName('q30_1')) ||
		!fv.isRadioChecked(document.getElementsByName('q30_2')) ||
		!fv.isRadioChecked(document.getElementsByName('q30_3')) ||
		!fv.isRadioChecked(document.getElementsByName('q30_4')) ||
		!fv.isRadioChecked(document.getElementsByName('q30_5')) ||
		!fv.isRadioChecked(document.getElementsByName('q30_6')) )
	{
		fv.raiseError(i18nmessages.step7Err1);
	}
	if (!fv.isRadioChecked(document.getElementsByName('q31_1')) ||
		!fv.isRadioChecked(document.getElementsByName('q31_2')) ||
		!fv.isRadioChecked(document.getElementsByName('q31_3')) )
	{
		fv.raiseError(i18nmessages.step7Err2);
	}	
	if (!fv.isRadioChecked(document.getElementsByName('q32')) )
	{
		fv.raiseError(i18nmessages.step7Err3);
	}
	if (getRadioValue(document.getElementsByName('q32'))=='yes' &&
		(fv.isEmpty($('#date_rectal_exam_month').val()) || fv.isEmpty($('#date_rectal_exam_year').val()) || fv.isEmpty($('#findings_rectal_exam').val()))
	){
		fv.raiseError(i18nmessages.step7Err4);
	}
	if (getRadioValue(document.getElementsByName('q33'))=='yes' &&
		(fv.isEmpty($('#date_most_recent_PSA_test_month').val()) || fv.isEmpty($('#date_most_recent_PSA_test_year').val()) || fv.isEmpty($('#results_PSA_test').val()))
	){
		fv.raiseError(i18nmessages.step7Err5);
	}	
	
	if (!fv.isRadioChecked(document.getElementsByName('q33')) )
	{
		fv.raiseError(i18nmessages.step7Err6);
	}
	if (!fv.isRadioChecked(document.getElementsByName('q34')) )
	{
		fv.raiseError(i18nmessages.step7Err7);
	}
/////////////////////////////////////////////////////	
	
	if (!fv.isRadioChecked(document.getElementsByName('q35')) )
	{
		fv.raiseError(i18nmessages.step8Err1);
	}
	if (!fv.isRadioChecked(document.getElementsByName('q36_1')) ||
		!fv.isRadioChecked(document.getElementsByName('q36_2')) ||
		!fv.isRadioChecked(document.getElementsByName('q36_3')) ||
		!fv.isRadioChecked(document.getElementsByName('q36_4')) ||
		!fv.isRadioChecked(document.getElementsByName('q36_5')) ||
		!fv.isRadioChecked(document.getElementsByName('q36_6')) )
	{
		fv.raiseError(i18nmessages.step8Err2);
	}
	if (!fv.isRadioChecked(document.getElementsByName('q37')) )
	{
		fv.raiseError(i18nmessages.step8Err3);
	}
	if (getRadioValue(document.getElementsByName('q37'))!='none' && !fv.isRadioChecked(document.getElementsByName('q38')) )
	{
		fv.raiseError(i18nmessages.step8Err4);
	}
	if (!fv.isRadioChecked(document.getElementsByName('q39')) )
	{
		fv.raiseError(i18nmessages.step8Err5);
	}
	if (getRadioValue(document.getElementsByName('q39'))=='yes' && !fv.isRadioChecked(document.getElementsByName('q40')) )
	{
		fv.raiseError(i18nmessages.step8Err6);
	}
	if (!fv.isRadioChecked(document.getElementsByName('q41')) )
	{
		fv.raiseError(i18nmessages.step8Err7);
	}
	if (getRadioValue(document.getElementsByName('q41'))!='no' &&
	($('#date_digital_rectal_exam_month').val()=='' ||$('#date_digital_rectal_exam_year').val()=='')
	)
	{
		fv.raiseError(i18nmessages.step8Err8);
	}
	if (!fv.isRadioChecked(document.getElementsByName('q42')) )
	{
		fv.raiseError(i18nmessages.step8Err9);
	}
	if (getRadioValue(document.getElementsByName('q42'))=='yes' &&
	($('#date_sigmoidoscopy_colonoscopy_month').val()=='' ||$('#date_sigmoidoscopy_colonoscopy_year').val()=='')
	)
	{
		fv.raiseError(i18nmessages.step8Err10);
	}
	if (getRadioValue(document.getElementsByName('q42'))=='yes' &&
		(!fv.isRadioChecked(document.getElementsByName('q42_1')) ||
		!fv.isRadioChecked(document.getElementsByName('q42_2')) ||
		!fv.isRadioChecked(document.getElementsByName('q42_3')) ||
		!fv.isRadioChecked(document.getElementsByName('q42_4')) ||
		!fv.isRadioChecked(document.getElementsByName('q42_5')) ||
		!fv.isRadioChecked(document.getElementsByName('q42_6')) ||
		!fv.isRadioChecked(document.getElementsByName('q42_7')) ||
		!fv.isRadioChecked(document.getElementsByName('q42_8'))) 
		)
	{
		fv.raiseError(i18nmessages.step8Err11);
	}
	if (!fv.isRadioChecked(document.getElementsByName('q43')) )
	{
		fv.raiseError(i18nmessages.step8Err12);
	}
	if (getRadioValue(document.getElementsByName('q43'))=='yes' &&
		fv.isEmpty($('#q43_biopsy_results').val())
	)
	{
		fv.raiseError(i18nmessages.step8Err13);
	}	
	if (!fv.isRadioChecked(document.getElementsByName('q44')) )
	{
		fv.raiseError(i18nmessages.step8Err14);
	}	
	if (getRadioValue(document.getElementsByName('q44'))=='yes' &&
		fv.isEmpty($('#q44_hemoglobin_levels').val())
	)
	{
		fv.raiseError(i18nmessages.step8Err15);
	}		
///////////////////////////////////////////////////////
	
	if (!fv.isRadioChecked(document.getElementsByName('q45_1')) ||
			!fv.isRadioChecked(document.getElementsByName('q45_2')) ||
			!fv.isRadioChecked(document.getElementsByName('q45_3')) ||
			!fv.isRadioChecked(document.getElementsByName('q45_4')) ||
			!fv.isRadioChecked(document.getElementsByName('q45_5')) ||
			!fv.isRadioChecked(document.getElementsByName('q45_6')) ||
			!fv.isRadioChecked(document.getElementsByName('q45_7')) )
		{
			fv.raiseError(i18nmessages.step9Err1);
		}
		if (!fv.isRadioChecked(document.getElementsByName('q46_1')) ||
			!fv.isRadioChecked(document.getElementsByName('q46_2')) ||
			!fv.isRadioChecked(document.getElementsByName('q46_3')) ||
			!fv.isRadioChecked(document.getElementsByName('q46_4')) ||
			!fv.isRadioChecked(document.getElementsByName('q46_5')) ||
			!fv.isRadioChecked(document.getElementsByName('q46_6')) )
		{
			fv.raiseError(i18nmessages.step9Err2);
		}
		if (!fv.isRadioChecked(document.getElementsByName('q47')) )
		{
			fv.raiseError(i18nmessages.step9Err3);
		}
		if (getRadioValue(document.getElementsByName('q47'))!='never' && ($('#q48_date_last_visit_gynecologist_momth').val()=='' || $('#q48_date_last_visit_gynecologist_year').val()==''))
		{
			fv.raiseError(i18nmessages.step9Err4);
		}
		if (!fv.isRadioChecked(document.getElementsByName('q49')) )
		{
			fv.raiseError(i18nmessages.step9Err5);
		}
		if (getRadioValue(document.getElementsByName('q49'))=='yes' &&
			fv.isEmpty($('#q49_findings_pelvic_exam').val())
		)
		{
			fv.raiseError(i18nmessages.step9Err6);
		}
		if (!fv.isRadioChecked(document.getElementsByName('q50')) )
		{
			fv.raiseError(i18nmessages.step9Err7);
		}
		if (getRadioValue(document.getElementsByName('q50'))=='yes' &&
			fv.isEmpty($('#q50_findings_digital_rectal_exam').val())
		)
		{
			fv.raiseError(i18nmessages.step9Err8);
		}
		if (!fv.isRadioChecked(document.getElementsByName('q51')) )
		{
			fv.raiseError(i18nmessages.step9Err9_1);
		}	
		if (getRadioValue(document.getElementsByName('q51'))=='yes' &&
			(!fv.isRadioChecked(document.getElementsByName('q51_1')) ||
			!fv.isRadioChecked(document.getElementsByName('q51_2')) ||
			!fv.isRadioChecked(document.getElementsByName('q51_3')) ||
			!fv.isRadioChecked(document.getElementsByName('q51_4')) ||
			!fv.isRadioChecked(document.getElementsByName('q51_5')) ||
			!fv.isRadioChecked(document.getElementsByName('q51_6'))) 
			)
		{
			fv.raiseError(i18nmessages.step9Err9);
		}
		if (getRadioValue(document.getElementsByName('q51_1'))=='yes' &&
			( fv.isEmpty($('#q51_1_date_month').val()) || fv.isEmpty($('#q51_1_date_year').val()) ||fv.isEmpty($('#q51_1_results').val()) )
		)
		{
			fv.raiseError(i18nmessages.step9Err10);
		}
		if (getRadioValue(document.getElementsByName('q51_2'))=='yes' &&
			( fv.isEmpty($('#q51_2_date_month').val()) || fv.isEmpty($('#q51_2_date_year').val()) ||fv.isEmpty($('#q51_2_results').val()) )
		)
		{
			fv.raiseError(i18nmessages.step9Err11);
		}
		if (getRadioValue(document.getElementsByName('q51_3'))=='yes' &&
			( fv.isEmpty($('#q51_3_date_month').val()) || fv.isEmpty($('#q51_3_date_year').val()) ||fv.isEmpty($('#q51_3_results').val()) )
		)
		{
			fv.raiseError(i18nmessages.step9Err12);
		}	
		if (getRadioValue(document.getElementsByName('q51_4'))=='yes' &&
			( fv.isEmpty($('#q51_4_date_month').val()) || fv.isEmpty($('#q51_4_date_year').val()) ||fv.isEmpty($('#q51_4_results').val()) )
		)
		{
			fv.raiseError(i18nmessages.step9Err13);
		}	
		if (getRadioValue(document.getElementsByName('q51_5'))=='yes' &&
			( fv.isEmpty($('#q51_5_date_month').val()) || fv.isEmpty($('#q51_5_date_year').val()) ||fv.isEmpty($('#q51_5_results').val()) )
		)
		{
			fv.raiseError(i18nmessages.step9Err14);
		}	
		if (getRadioValue(document.getElementsByName('q51_6'))=='yes' &&
			( fv.isEmpty($('#q51_6_date_month').val()) || fv.isEmpty($('#q51_6_date_year').val()) ||fv.isEmpty($('#q51_6_results').val()) )
		)
		{
			fv.raiseError(i18nmessages.step9Err15);
		}
		if (!fv.isRadioChecked(document.getElementsByName('q52')) )
		{
			fv.raiseError(i18nmessages.step9Err16_1);
		}		
		if (getRadioValue(document.getElementsByName('q52'))=='yes' &&
			( fv.isEmpty($('#q52_date_most_recent_pap_smear_month').val()) || fv.isEmpty($('#q52_date_most_recent_pap_smear_year').val()) ||fv.isEmpty($('#q52_results_pap_smear').val()) )
		)
		{
			fv.raiseError(i18nmessages.step9Err16);
		}	
		if (!fv.isRadioChecked(document.getElementsByName('q53')) )
		{
			fv.raiseError(i18nmessages.step9Err17_1);
		}	
		if (getRadioValue(document.getElementsByName('q53'))=='yes' &&
			( fv.isEmpty($('#q53_medication_fertility').val()) || fv.isEmpty($('#q53_how_long_use_fertility_medication').val()) )
		)
		{
			fv.raiseError(i18nmessages.step9Err17);
		}	
		if (getRadioValue(document.getElementsByName('q53'))=='yes' && !fv.isValidNumber($('#q53_how_long_use_fertility_medication').val(), 1, 360) )

		{
			fv.raiseError(i18nmessages.step9Err18);
		}		
///////////////////////////////////
		if (fv.isEmpty($('#q54').val()) || !fv.isValidNumber($('#q54').val(),1,99))
		{
			fv.raiseError(i18nmessages.step10Err1);
		}
		if (fv.isEmpty($('#q55').val()) || !fv.isValidNumber($('#q55').val(),10,365))
		{
			fv.raiseError(i18nmessages.step10Err2);
		}
		if (fv.isEmpty($('#q56').val()) || !fv.isValidNumber($('#q56').val(),1,100))
		{
			fv.raiseError(i18nmessages.step10Err3);
		}
		if (!fv.isRadioChecked(document.getElementsByName('q57')) )
		{
			fv.raiseError(i18nmessages.step10Err4);
		}
		if (!fv.isRadioChecked(document.getElementsByName('q58')) )
		{
			fv.raiseError(i18nmessages.step10Err5);
		}
		if (getRadioValue(document.getElementsByName('q59'))=='yes')
		{
			if (fv.isEmpty($('#q59_why').val()) || fv.isEmpty($('#q59_whatAge').val()))
				fv.raiseError(i18nmessages.step10Err7);
			if (!fv.isValidNumber($('#q59_whatAge').val(), 1, 99))
				fv.raiseError(i18nmessages.step10Err7);
		}
		if (!fv.isRadioChecked(document.getElementsByName('q60')) )
		{
			fv.raiseError(i18nmessages.step10Err8);
		}
		if (getRadioValue(document.getElementsByName('q60'))=='yes')
		{
			if (!fv.isRadioChecked(document.getElementsByName('q61')) || fv.isEmpty($('#q61_whatAge').val()))
				fv.raiseError(i18nmessages.step10Err9);
			if (!fv.isValidNumber($('#q61_whatAge').val(), 1, 99))
				fv.raiseError(i18nmessages.step10Err10);
		}
		if (!fv.isRadioChecked(document.getElementsByName('q62')) )
		{
			fv.raiseError(i18nmessages.step10Err11);
		}
		if (getRadioValue(document.getElementsByName('q62'))=='yes')
		{
			if (!fv.isRadioChecked(document.getElementsByName('q63')))
				fv.raiseError(i18nmessages.step10Err12);
			if (fv.isEmpty($('#q64').val()))
				fv.raiseError(i18nmessages.step10Err13);
			if (fv.isEmpty($('#q65').val()) || !fv.isValidNumber($('#q65').val(), 1, 99))
				fv.raiseError(i18nmessages.step10Err14);
		}
		if (!fv.isRadioChecked(document.getElementsByName('q66')) )
		{
			fv.raiseError(i18nmessages.step10Err15);
		}
		if (!fv.isRadioChecked(document.getElementsByName('q67')) )
		{
			fv.raiseError(i18nmessages.step10Err16);
		}

		if ((getRadioValue(document.getElementsByName('q66'))=='yes' || getRadioValue(document.getElementsByName('q66'))=='yes') &&
		(fv.isEmpty($('#q68').val()) || !fv.isValidNumber($('#q68').val(), 1, 99))
		)
		{
			fv.raiseError(i18nmessages.step10Err17);
		}
		if (!fv.isRadioChecked(document.getElementsByName('q69')) )
		{
			fv.raiseError(i18nmessages.step10Err18);
		}
		if (getRadioValue(document.getElementsByName('q69'))=='yes')
		{
			if (fv.isEmpty($('#q69_which').val()) || fv.isEmpty($('#q69_forWhat').val()) || !fv.isValidNumber($('#q69_whatAgeStarted').val(), 1, 99))
				fv.raiseError(i18nmessages.step10Err19);
		}
		if (!fv.isRadioChecked(document.getElementsByName('q70')) )
		{
			fv.raiseError(i18nmessages.step10Err20);
		}

///////////////////////////////////
		if (!fv.isRadioChecked(document.getElementsByName('q72')) )
		{
			fv.raiseError(i18nmessages.step11Err1);
		}	
		if (getRadioValue(document.getElementsByName('q72'))=='yes')
		{
			if (fv.isEmpty($('#q73_alive').val()) || fv.isEmpty($('#q73_dead').val()) || fv.isEmpty($('#q73_miscarriage').val()))
				fv.raiseError(i18nmessages.step11Err2)
			if (!fv.isValidNumber($('#q73_alive').val(), 0, 10) || !fv.isValidNumber($('#q73_dead').val(), 0, 10) || !fv.isValidNumber($('#q73_miscarriage').val(), 0, 10))
				fv.raiseError(i18nmessages.step11Err3)
			if (fv.isNumber($('#q73_alive').val()) && fv.isNumber($('#q73_dead').val()) && fv.isNumber($('#q73_miscarriage').val())){
				sum = parseInt($('#q73_alive').val())+ parseInt($('#q73_dead').val())+ parseInt($('#q73_miscarriage').val());
				if (sum > 100)
					fv.raiseError(i18nmessages.step11Err3);
				if (sum==0)
					fv.raiseError(i18nmessages.step11Err4)
			}
			if (fv.isEmpty($('#q74').val()) || !fv.isValidNumber($('#q74').val(), 5, 70))
					fv.raiseError(i18nmessages.step11Err5)
			if (fv.isEmpty($('#q75').val()) || !fv.isValidNumber($('#q75').val(), 5, 70))
					fv.raiseError(i18nmessages.step11Err6)
			if (fv.isEmpty($('#q76').val()) || !fv.isValidNumber($('#q76').val(), 0, 50))
					fv.raiseError(i18nmessages.step11Err7)		
			if (!fv.isRadioChecked(document.getElementsByName('q77')))
					fv.raiseError(i18nmessages.step11Err8);	
					
			if (!fv.isRadioChecked(document.getElementsByName('q79')))
					fv.raiseError(i18nmessages.step11Err9);									
		}
		if (getRadioValue(document.getElementsByName('q77'))=='yes'){
			if ( (!fv.isEmpty($('#q78_1_week').val()) && !fv.isValidNumber($('#q78_1_week').val(), 0, 100)) ||
					 (!fv.isEmpty($('#q78_2_week').val()) && !fv.isValidNumber($('#q78_2_week').val(), 0, 100)) ||
					 (!fv.isEmpty($('#q78_3_week').val()) && !fv.isValidNumber($('#q78_3_week').val(), 0, 100)) ||
					 (!fv.isEmpty($('#q78_4_week').val()) && !fv.isValidNumber($('#q78_4_week').val(), 0, 100)) ||
					 (!fv.isEmpty($('#q78_5_week').val()) && !fv.isValidNumber($('#q78_5_week').val(), 0, 100)) ||
					 (!fv.isEmpty($('#q78_6_week').val()) && !fv.isValidNumber($('#q78_6_week').val(), 0, 100)) ||
					 (!fv.isEmpty($('#q78_7_week').val()) && !fv.isValidNumber($('#q78_7_week').val(), 0, 100)) ||
					 (!fv.isEmpty($('#q78_8_week').val()) && !fv.isValidNumber($('#q78_8_week').val(), 0, 100)) ||
					 (!fv.isEmpty($('#q78_9_week').val()) && !fv.isValidNumber($('#q78_9_week').val(), 0, 100)) ||
					 (!fv.isEmpty($('#q78_10_week').val()) && !fv.isValidNumber($('#q78_10_week').val(), 0, 100)) ||
					 (!fv.isEmpty($('#q78_1_month').val()) && !fv.isValidNumber($('#q78_1_month').val(), 0, 100)) ||
					 (!fv.isEmpty($('#q78_2_month').val()) && !fv.isValidNumber($('#q78_2_month').val(), 0, 100)) ||
					 (!fv.isEmpty($('#q78_3_month').val()) && !fv.isValidNumber($('#q78_3_month').val(), 0, 100)) ||
					 (!fv.isEmpty($('#q78_4_month').val()) && !fv.isValidNumber($('#q78_4_month').val(), 0, 100)) ||
					 (!fv.isEmpty($('#q78_5_month').val()) && !fv.isValidNumber($('#q78_5_month').val(), 0, 100)) ||
					 (!fv.isEmpty($('#q78_6_month').val()) && !fv.isValidNumber($('#q78_6_month').val(), 0, 100)) ||
					 (!fv.isEmpty($('#q78_7_month').val()) && !fv.isValidNumber($('#q78_7_month').val(), 0, 100)) ||
					 (!fv.isEmpty($('#q78_8_month').val()) && !fv.isValidNumber($('#q78_8_month').val(), 0, 100)) ||
					 (!fv.isEmpty($('#q78_9_month').val()) && !fv.isValidNumber($('#q78_9_month').val(), 0, 100)) ||
					 (!fv.isEmpty($('#q78_10_month').val()) && !fv.isValidNumber($('#q78_10_month').val(), 0, 100))	)
					fv.raiseError(i18nmessages.step11Err8_1)			
		}
		if (!fv.isRadioChecked(document.getElementsByName('q80')) )
		{
			fv.raiseError(i18nmessages.step11Err10);
		}	
		if (getRadioValue(document.getElementsByName('q80'))=='yes')
		{
			if (fv.isEmpty($('#q81_which').val()) || fv.isEmpty($('#q81_whatAge').val()) || fv.isEmpty($('#q81_howLong').val()))
				fv.raiseError(i18nmessages.step11Err11);
		}	
		if (!fv.isRadioChecked(document.getElementsByName('q82')) )
		{
			fv.raiseError(i18nmessages.step11Err12);
		}

		if (getRadioValue(document.getElementsByName('q82'))=='yes' &&
		((!fv.isRadioChecked(document.getElementsByName('q82_1')) || getRadioValue(document.getElementsByName('q82_1'))=='no') &&
		(!fv.isRadioChecked(document.getElementsByName('q82_2')) || getRadioValue(document.getElementsByName('q82_2'))=='no') &&
		(!fv.isRadioChecked(document.getElementsByName('q82_3')) || getRadioValue(document.getElementsByName('q82_3'))=='no') &&
		(!fv.isRadioChecked(document.getElementsByName('q82_4')) || getRadioValue(document.getElementsByName('q82_4'))=='no') &&
		(!fv.isRadioChecked(document.getElementsByName('q82_5')) || getRadioValue(document.getElementsByName('q82_5'))=='no') &&
		(!fv.isRadioChecked(document.getElementsByName('q82_6')) || getRadioValue(document.getElementsByName('q82_6'))=='no') &&
		(!fv.isRadioChecked(document.getElementsByName('q82_7')) || getRadioValue(document.getElementsByName('q82_7'))=='no') &&
		(!fv.isRadioChecked(document.getElementsByName('q82_8')) || getRadioValue(document.getElementsByName('q82_8'))=='no') &&
		(!fv.isRadioChecked(document.getElementsByName('q82_9')) || getRadioValue(document.getElementsByName('q82_9'))=='no') &&
		(!fv.isRadioChecked(document.getElementsByName('q82_10')) || getRadioValue(document.getElementsByName('q82_10'))=='no') &&
		(!fv.isRadioChecked(document.getElementsByName('q82_11')) || getRadioValue(document.getElementsByName('q82_11'))=='no') &&
		(!fv.isRadioChecked(document.getElementsByName('q82_12')) || getRadioValue(document.getElementsByName('q82_12'))=='no') &&
		(!fv.isRadioChecked(document.getElementsByName('q82_13')) || getRadioValue(document.getElementsByName('q82_13'))=='no') &&
		(!fv.isRadioChecked(document.getElementsByName('q82_14')) || getRadioValue(document.getElementsByName('q82_14'))=='no') &&
		(!fv.isRadioChecked(document.getElementsByName('q82_15')) || getRadioValue(document.getElementsByName('q82_15'))=='no'))
		){
			fv.raiseError(i18nmessages.step11Err13);
		}	
		if (getRadioValue(document.getElementsByName('q82'))=='yes')
		{
			if (fv.isRadioChecked(document.getElementsByName('q82_1')) && getRadioValue(document.getElementsByName('q82_1'))=='yes' )
			{
				if ($('#q82_1_type').val()=='' || $('#q82_1_whatAge').val()=='' || $('#q82_1_aliveDead').val()=='')
					fv.raiseError(i18nmessages.step11Err14+"(#1)");
				if (!fv.isEmpty($('#q82_1_whatAge').val()) && !fv.isValidNumber($('#q82_1_whatAge').val(), 1, 125))
					fv.raiseError(i18nmessages.step11Err15);
			}
			if (fv.isRadioChecked(document.getElementsByName('q82_2')) && getRadioValue(document.getElementsByName('q82_2'))=='yes' )
			{
				if ($('#q82_2_type').val()=='' || $('#q82_2_whatAge').val()=='' || $('#q82_2_aliveDead').val()=='')
					fv.raiseError(i18nmessages.step11Err14+"(#2)");
				if (!fv.isEmpty($('#q82_2_whatAge').val()) && !fv.isValidNumber($('#q82_2_whatAge').val(), 1, 125))
					fv.raiseError(i18nmessages.step11Err15);
			}		
			if (fv.isRadioChecked(document.getElementsByName('q82_3')) && getRadioValue(document.getElementsByName('q82_3'))=='yes' )
			{
				if ($('#q82_3_type').val()=='' || $('#q82_3_whatAge').val()=='' || $('#q82_3_aliveDead').val()=='')
					fv.raiseError(i18nmessages.step11Err14+"(#3)");
				if (!fv.isEmpty($('#q82_3_whatAge').val()) && !fv.isValidNumber($('#q82_3_whatAge').val(), 1, 125))
					fv.raiseError(i18nmessages.step11Err15);
			}
			if (fv.isRadioChecked(document.getElementsByName('q82_4')) && getRadioValue(document.getElementsByName('q82_4'))=='yes' )
			{
				if ($('#q82_4_type').val()=='' || $('#q82_4_whatAge').val()=='' || $('#q82_4_aliveDead').val()=='')
					fv.raiseError(i18nmessages.step11Err14+"(#4)");
				if (!fv.isEmpty($('#q82_4_whatAge').val()) && !fv.isValidNumber($('#q82_4_whatAge').val(), 1, 125))
					fv.raiseError(i18nmessages.step11Err15);
			}	
			if (fv.isRadioChecked(document.getElementsByName('q82_5')) && getRadioValue(document.getElementsByName('q82_5'))=='yes' )
			{
				if ($('#q82_5_type').val()=='' || $('#q82_5_whatAge').val()=='' || $('#q82_5_aliveDead').val()=='')
					fv.raiseError(i18nmessages.step11Err14+"(#5)");
				if (!fv.isEmpty($('#q82_5_whatAge').val()) && !fv.isValidNumber($('#q82_5_whatAge').val(), 1, 125))
					fv.raiseError(i18nmessages.step11Err15);
			}	
			if (fv.isRadioChecked(document.getElementsByName('q82_6')) && getRadioValue(document.getElementsByName('q82_6'))=='yes' )
			{
				if ($('#q82_6_type').val()=='' || $('#q82_6_whatAge').val()=='' || $('#q82_6_aliveDead').val()=='')
					fv.raiseError(i18nmessages.step11Err14+"(#6)");
				if (!fv.isEmpty($('#q82_6_whatAge').val()) && !fv.isValidNumber($('#q82_6_whatAge').val(), 1, 125))
					fv.raiseError(i18nmessages.step11Err15);
			}	
			if (fv.isRadioChecked(document.getElementsByName('q82_7')) && getRadioValue(document.getElementsByName('q82_7'))=='yes' )
			{
				if ($('#q82_7_type').val()=='' || $('#q82_7_whatAge').val()=='' || $('#q82_7_aliveDead').val()=='')
					fv.raiseError(i18nmessages.step11Err14+"(#7)");
				if (!fv.isEmpty($('#q82_7_whatAge').val()) && !fv.isValidNumber($('#q82_7_whatAge').val(), 1, 125))
					fv.raiseError(i18nmessages.step11Err15);
			}	
			if (fv.isRadioChecked(document.getElementsByName('q82_8')) && getRadioValue(document.getElementsByName('q82_8'))=='yes' )
			{
				if ($('#q82_8_type').val()=='' || $('#q82_8_whatAge').val()=='' || $('#q82_8_aliveDead').val()=='')
					fv.raiseError(i18nmessages.step11Err14+"(#8)");
				if (!fv.isEmpty($('#q82_8_whatAge').val()) && !fv.isValidNumber($('#q82_8_whatAge').val(), 1, 125))
					fv.raiseError(i18nmessages.step11Err15);
			}	
			if (fv.isRadioChecked(document.getElementsByName('q82_9')) && getRadioValue(document.getElementsByName('q82_9'))=='yes' )
			{
				if ($('#q82_9_type').val()=='' || $('#q82_9_whatAge').val()=='' || $('#q82_9_aliveDead').val()=='')
					fv.raiseError(i18nmessages.step11Err14+"(#9)");
				if (!fv.isEmpty($('#q82_9_whatAge').val()) && !fv.isValidNumber($('#q82_9_whatAge').val(), 1, 125))
					fv.raiseError(i18nmessages.step11Err15);
			}	
			if (fv.isRadioChecked(document.getElementsByName('q82_10')) && getRadioValue(document.getElementsByName('q82_10'))=='yes' )
			{
				if ($('#q82_10_type').val()=='' || $('#q82_10_whatAge').val()=='' || $('#q82_10_aliveDead').val()=='')
					fv.raiseError(i18nmessages.step11Err14+"(#10)");
				if (!fv.isEmpty($('#q82_10_whatAge').val()) && !fv.isValidNumber($('#q82_10_whatAge').val(), 1, 125))
					fv.raiseError(i18nmessages.step11Err15);
			}	
			if (fv.isRadioChecked(document.getElementsByName('q82_11')) && getRadioValue(document.getElementsByName('q82_11'))=='yes' )
			{
				if ($('#q82_11_type').val()=='' || $('#q82_11_whatAge').val()=='' || $('#q82_11_aliveDead').val()=='')
					fv.raiseError(i18nmessages.step11Err14+"(#11)");
				if (!fv.isEmpty($('#q82_11_whatAge').val()) && !fv.isValidNumber($('#q82_11_whatAge').val(), 1, 125))
					fv.raiseError(i18nmessages.step11Err15);
			}	
			if (fv.isRadioChecked(document.getElementsByName('q82_12')) && getRadioValue(document.getElementsByName('q82_12'))=='yes' )
			{
				if ($('#q82_12_type').val()=='' || $('#q82_12_whatAge').val()=='' || $('#q82_12_aliveDead').val()=='')
					fv.raiseError(i18nmessages.step11Err14+"(#12)");
				if (!fv.isEmpty($('#q82_12_whatAge').val()) && !fv.isValidNumber($('#q82_12_whatAge').val(), 1, 125))
					fv.raiseError(i18nmessages.step11Err15);
			}	
			if (fv.isRadioChecked(document.getElementsByName('q82_13')) && getRadioValue(document.getElementsByName('q82_13'))=='yes' )
			{
				if ($('#q82_13_type').val()=='' || $('#q82_13_whatAge').val()=='' || $('#q82_13_aliveDead').val()=='')
					fv.raiseError(i18nmessages.step11Err14+"(#13)");
				if (!fv.isEmpty($('#q82_13_whatAge').val()) && !fv.isValidNumber($('#q82_13_whatAge').val(), 1, 125))
					fv.raiseError(i18nmessages.step11Err15);
			}	
			if (fv.isRadioChecked(document.getElementsByName('q82_14')) && getRadioValue(document.getElementsByName('q82_14'))=='yes' )
			{
				if ($('#q82_14_type').val()=='' || $('#q82_14_whatAge').val()=='' || $('#q82_14_aliveDead').val()=='')
					fv.raiseError(i18nmessages.step11Err14+"(#14)");
				if (!fv.isEmpty($('#q82_14_whatAge').val()) && !fv.isValidNumber($('#q82_14_whatAge').val(), 1, 125))
					fv.raiseError(i18nmessages.step11Err15);
			}
			if (fv.isRadioChecked(document.getElementsByName('q82_15')) && getRadioValue(document.getElementsByName('q82_15'))=='yes' )
			{
				if (fv.isEmpty($('#q82_others').val()) || $('#q82_15_type').val()=='' || $('#q82_15_whatAge').val()=='' || $('#q82_15_aliveDead').val()=='')
					fv.raiseError(i18nmessages.step11Err14+"(#15)");
				if (!fv.isEmpty($('#q82_15_whatAge').val()) && !fv.isValidNumber($('#q82_15_whatAge').val(), 1, 125))
					fv.raiseError(i18nmessages.step11Err15);
			}	
				
				
		}
/////////////////////////////////
		if (!fv.isRadioChecked(document.getElementsByName('q83')) )
		{
			fv.raiseError(i18nmessages.step12Err1);
		}
		if (getRadioValue(document.getElementsByName('q83'))=='yes' &&
		((!fv.isRadioChecked(document.getElementsByName('q84_1')) || getRadioValue(document.getElementsByName('q84_1'))=='no') &&
		(!fv.isRadioChecked(document.getElementsByName('q84_2')) || getRadioValue(document.getElementsByName('q84_2'))=='no') &&
		(!fv.isRadioChecked(document.getElementsByName('q84_3')) || getRadioValue(document.getElementsByName('q84_3'))=='no') &&
		(!fv.isRadioChecked(document.getElementsByName('q84_4')) || getRadioValue(document.getElementsByName('q84_4'))=='no') &&
		(!fv.isRadioChecked(document.getElementsByName('q84_5')) || getRadioValue(document.getElementsByName('q84_5'))=='no') &&
		(!fv.isRadioChecked(document.getElementsByName('q84_6')) || getRadioValue(document.getElementsByName('q84_6'))=='no') &&
		(!fv.isRadioChecked(document.getElementsByName('q84_7')) || getRadioValue(document.getElementsByName('q84_7'))=='no') &&
		(!fv.isRadioChecked(document.getElementsByName('q84_8')) || getRadioValue(document.getElementsByName('q84_8'))=='no') &&
		(!fv.isRadioChecked(document.getElementsByName('q84_9')) || getRadioValue(document.getElementsByName('q84_9'))=='no') &&
		(!fv.isRadioChecked(document.getElementsByName('q84_10')) || getRadioValue(document.getElementsByName('q84_10'))=='no') )
		){
			fv.raiseError(i18nmessages.step12Err2);
		}		
		if (getRadioValue(document.getElementsByName('q83'))=='yes')
		{
			if (fv.isRadioChecked(document.getElementsByName('q84_1')) && getRadioValue(document.getElementsByName('q84_1'))=='yes' )
			{
				if ($('#q84_1_rad_date_month').val()=='' || $('#q84_1_rad_date_day').val()=='' || $('#q84_1_rad_date_year').val()=='' || $('#q82_1_whatAge').val()=='')
					fv.raiseError(i18nmessages.step12Err3 +"(#1)");
				if (!fv.isEmpty($('#q84_1_whatAge').val()) && !fv.isValidNumber($('#q84_1_whatAge').val(), 1, 125))
					fv.raiseError(i18nmessages.step12Err4);
			}
			if (fv.isRadioChecked(document.getElementsByName('q84_2')) && getRadioValue(document.getElementsByName('q84_2'))=='yes' )
			{
				if ($('#q84_2_rad_date_month').val()=='' || $('#q84_2_rad_date_day').val()=='' || $('#q84_2_rad_date_year').val()=='' || $('#q82_2_whatAge').val()=='')
					fv.raiseError(i18nmessages.step12Err3 +"(#2)");
				if (!fv.isEmpty($('#q84_2_whatAge').val()) && !fv.isValidNumber($('#q84_2_whatAge').val(), 1, 125))
					fv.raiseError(i18nmessages.step12Err4);
			}		
			if (fv.isRadioChecked(document.getElementsByName('q84_3')) && getRadioValue(document.getElementsByName('q84_3'))=='yes' )
			{
				if ($('#q84_3_rad_date_month').val()=='' || $('#q84_3_rad_date_day').val()=='' || $('#q84_3_rad_date_year').val()=='' || $('#q82_3_whatAge').val()=='')
					fv.raiseError(i18nmessages.step12Err3 +"(#3)");
				if (!fv.isEmpty($('#q84_3_whatAge').val()) && !fv.isValidNumber($('#q84_3_whatAge').val(), 1, 125))
					fv.raiseError(i18nmessages.step12Err4);
			}	
			if (fv.isRadioChecked(document.getElementsByName('q84_4')) && getRadioValue(document.getElementsByName('q84_4'))=='yes' )
			{
				if ($('#q84_4_rad_date_month').val()=='' || $('#q84_4_rad_date_day').val()=='' || $('#q84_4_rad_date_year').val()=='' || $('#q82_4_whatAge').val()=='')
					fv.raiseError(i18nmessages.step12Err3 +"(#4)");
				if (!fv.isEmpty($('#q84_4_whatAge').val()) && !fv.isValidNumber($('#q84_4_whatAge').val(), 1, 125))
					fv.raiseError(i18nmessages.step12Err4);
			}	
			if (fv.isRadioChecked(document.getElementsByName('q84_5')) && getRadioValue(document.getElementsByName('q84_5'))=='yes' )
			{
				if ($('#q84_5_rad_date_month').val()=='' || $('#q84_5_rad_date_day').val()=='' || $('#q84_5_rad_date_year').val()=='' || $('#q82_5_whatAge').val()=='')
					fv.raiseError(i18nmessages.step12Err3 +"(#5)");
				if (!fv.isEmpty($('#q84_5_whatAge').val()) && !fv.isValidNumber($('#q84_5_whatAge').val(), 1, 125))
					fv.raiseError(i18nmessages.step12Err4);
			}	
			if (fv.isRadioChecked(document.getElementsByName('q84_6')) && getRadioValue(document.getElementsByName('q84_6'))=='yes' )
			{
				if ($('#q84_6_rad_date_month').val()=='' || $('#q84_6_rad_date_day').val()=='' || $('#q84_6_rad_date_year').val()=='' || $('#q82_6_whatAge').val()=='')
					fv.raiseError(i18nmessages.step12Err3 +"(#6)");
				if (!fv.isEmpty($('#q84_6_whatAge').val()) && !fv.isValidNumber($('#q84_6_whatAge').val(), 1, 125))
					fv.raiseError(i18nmessages.step12Err4);
			}	
			if (fv.isRadioChecked(document.getElementsByName('q84_7')) && getRadioValue(document.getElementsByName('q84_7'))=='yes' )
			{
				if ($('#q84_7_rad_date_month').val()=='' || $('#q84_7_rad_date_day').val()=='' || $('#q84_7_rad_date_year').val()=='' || $('#q82_7_whatAge').val()=='')
					fv.raiseError(i18nmessages.step12Err3 +"(#7)");
				if (!fv.isEmpty($('#q84_7_whatAge').val()) && !fv.isValidNumber($('#q84_7_whatAge').val(), 1, 125))
					fv.raiseError(i18nmessages.step12Err4);
			}	
			if (fv.isRadioChecked(document.getElementsByName('q84_8')) && getRadioValue(document.getElementsByName('q84_8'))=='yes' )
			{
				if ($('#q84_8_rad_date_month').val()=='' || $('#q84_8_rad_date_day').val()=='' || $('#q84_8_rad_date_year').val()=='' || $('#q82_8_whatAge').val()=='')
					fv.raiseError(i18nmessages.step12Err3 +"(#8)");
				if (!fv.isEmpty($('#q84_8_whatAge').val()) && !fv.isValidNumber($('#q84_8_whatAge').val(), 1, 125))
					fv.raiseError(i18nmessages.step12Err4);
			}	
			if (fv.isRadioChecked(document.getElementsByName('q84_9')) && getRadioValue(document.getElementsByName('q84_9'))=='yes' )
			{
				if ($('#q84_9_rad_date_month').val()=='' || $('#q84_9_rad_date_day').val()=='' || $('#q84_9_rad_date_year').val()=='' || $('#q82_9_whatAge').val()=='')
					fv.raiseError(i18nmessages.step12Err3 +"(#9)");
				if (!fv.isEmpty($('#q84_9_whatAge').val()) && !fv.isValidNumber($('#q84_9_whatAge').val(), 1, 125))
					fv.raiseError(i18nmessages.step12Err4);
			}	
			if (fv.isRadioChecked(document.getElementsByName('q84_10')) && getRadioValue(document.getElementsByName('q84_10'))=='yes' )
			{
				if (fv.isEmpty($('#q84_another').val()) || $('#q84_10_rad_date_month').val()=='' || $('#q84_10_rad_date_day').val()=='' || $('#q84_10_rad_date_year').val()=='' || $('#q82_10_whatAge').val()=='')
					fv.raiseError(i18nmessages.step12Err3 +"(#10)");
				if (!fv.isEmpty($('#q84_10_whatAge').val()) && !fv.isValidNumber($('#q84_10_whatAge').val(), 1, 125))
					fv.raiseError(i18nmessages.step12Err4);
			}	
		}
/////////////////////////////////////
		if (!fv.isRadioChecked(document.getElementsByName('q85')) )
		{
			fv.raiseError(i18nmessages.step13Err1);
		}
		if (getRadioValue(document.getElementsByName('q85'))=='yes' && fv.isEmpty($('#q85_which').val())){
			fv.raiseError(i18nmessages.step13Err2);
		}
		if (!fv.isRadioChecked(document.getElementsByName('q85_sat_fat_1')) ||
			!fv.isRadioChecked(document.getElementsByName('q85_sat_fat_2')) ||
			!fv.isRadioChecked(document.getElementsByName('q85_sat_fat_3')) ||
			!fv.isRadioChecked(document.getElementsByName('q85_sat_fat_4')) ||
			!fv.isRadioChecked(document.getElementsByName('q85_sat_fat_5')) ||
			!fv.isRadioChecked(document.getElementsByName('q85_sat_fat_6')) ||
			!fv.isRadioChecked(document.getElementsByName('q85_sat_fat_7')) ||
			!fv.isRadioChecked(document.getElementsByName('q85_sat_fat_8')) ||
			!fv.isRadioChecked(document.getElementsByName('q85_sat_fat_9')) ||
			!fv.isRadioChecked(document.getElementsByName('q85_sat_fat_10')) ||
			!fv.isRadioChecked(document.getElementsByName('q85_sat_fat_11')) ||
			!fv.isRadioChecked(document.getElementsByName('q85_sat_fat_12')) ||
			!fv.isRadioChecked(document.getElementsByName('q85_sat_fat_13')) ||
			!fv.isRadioChecked(document.getElementsByName('q85_vege_1')) ||
			!fv.isRadioChecked(document.getElementsByName('q85_vege_2')) ||
			!fv.isRadioChecked(document.getElementsByName('q85_vege_3')) ||
			!fv.isRadioChecked(document.getElementsByName('q85_vege_4')) ||
			!fv.isRadioChecked(document.getElementsByName('q85_vege_5')) ||
			!fv.isRadioChecked(document.getElementsByName('q85_vege_6')) ||
			!fv.isRadioChecked(document.getElementsByName('q85_vege_7')) ||
			!fv.isRadioChecked(document.getElementsByName('q85_vege_8')) ||
			!fv.isRadioChecked(document.getElementsByName('q85_vege_9')) ||
			!fv.isRadioChecked(document.getElementsByName('q85_vege_10')) ||
			!fv.isRadioChecked(document.getElementsByName('q85_vege_11')) ||
			!fv.isRadioChecked(document.getElementsByName('q85_vege_12')) ||
			!fv.isRadioChecked(document.getElementsByName('q85_vege_13')) )
		{
			fv.raiseError(i18nmessages.step13Err3);
		}
		if (fv.isRadioChecked(document.getElementsByName('q85_sat_fat_14')) && getRadioValue(document.getElementsByName('q85_sat_fat_14'))!='none' && fv.isEmpty($('#q85_sat_fat_other').val()))
		{
			fv.raiseError(i18nmessages.step13Err4);
		}
		if (fv.isRadioChecked(document.getElementsByName('q85_vege_14')) && getRadioValue(document.getElementsByName('q85_vege_14'))!='none' && fv.isEmpty($('#q85_vege_other').val()))
		{
			fv.raiseError(i18nmessages.step13Err5);
		}
		if (!fv.isRadioChecked(document.getElementsByName('q86')) )
		{
			fv.raiseError(i18nmessages.step13Err6);
		}
		if (!fv.isRadioChecked(document.getElementsByName('q87')) )
		{
			fv.raiseError(i18nmessages.step13Err7);
		}
		if (getRadioValue(document.getElementsByName('q87'))=='yes'){ 
			if (!fv.isRadioChecked(document.getElementsByName('q88')))
				fv.raiseError(i18nmessages.step13Err8);
				
			if (!fv.isRadioChecked(document.getElementsByName('q89_1')) ||
				!fv.isRadioChecked(document.getElementsByName('q89_2')) ||
				!fv.isRadioChecked(document.getElementsByName('q89_3')) ||
				!fv.isRadioChecked(document.getElementsByName('q89_4')) ||
				!fv.isRadioChecked(document.getElementsByName('q89_5')) ||
				!fv.isRadioChecked(document.getElementsByName('q89_6')) ||
				!fv.isRadioChecked(document.getElementsByName('q89_7'))	)
			{
				fv.raiseError(i18nmessages.step13Err9); 
			}
		}			
///////////////////////////////
		if (!fv.isRadioChecked(document.getElementsByName('q90_1')) ||
				!fv.isRadioChecked(document.getElementsByName('q90_2')) ||
				!fv.isRadioChecked(document.getElementsByName('q90_3')) ||
				!fv.isRadioChecked(document.getElementsByName('q90_4')) ||
				!fv.isRadioChecked(document.getElementsByName('q90_5')) ||
				!fv.isRadioChecked(document.getElementsByName('q90_6'))	 )
			{
				fv.raiseError(i18nmessages.step14Err1);
			}	
			if (getRadioValue(document.getElementsByName("q90_1"))=='yes') 
			{
				if (fv.isEmpty($('#q90_1_age').val()) && fv.isEmpty($('#q90_1_year_year').val()) )
					fv.raiseError(i18nmessages.step14Err2+"(#1)");
				if (!fv.isValidNumber($('#q90_1_age').val(), 1, 125))
					fv.raiseError(i18nmessages.step14Err3);
			}
			if (getRadioValue(document.getElementsByName("q90_2"))=='yes')
			{
				if (fv.isEmpty($('#q90_2_age').val()) && fv.isEmpty($('#q90_2_year_year').val()) ) 
					fv.raiseError(i18nmessages.step14Err2+"(#2)");
				if (!fv.isValidNumber($('#q90_2_age').val(), 1, 125))
					fv.raiseError(i18nmessages.step14Err3);
			}
			if (getRadioValue(document.getElementsByName("q90_3"))=='yes')
			{
				if (fv.isEmpty($('#q90_3_age').val()) && fv.isEmpty($('#q90_3_year_year').val()) ) 
					fv.raiseError(i18nmessages.step14Err2+"(#3)");
				if (!fv.isValidNumber($('#q90_3_age').val(), 1, 125))
					fv.raiseError(i18nmessages.step14Err3);
			}
			if (getRadioValue(document.getElementsByName("q90_4"))=='yes')
			{
				if (fv.isEmpty($('#q90_4_age').val()) && fv.isEmpty($('#q90_4_year_year').val()) ) 
					fv.raiseError(i18nmessages.step14Err2+"(#4)");
				if (!fv.isValidNumber($('#q90_4_age').val(), 1, 125))
					fv.raiseError(i18nmessages.step14Err3);
			}
			if (getRadioValue(document.getElementsByName("q90_5"))=='yes')
			{
				if (fv.isEmpty($('#q90_5_age').val()) && fv.isEmpty($('#q90_5_year_year').val()) ) 
					fv.raiseError(i18nmessages.step14Err2+"(#5)");
				if (!fv.isValidNumber($('#q90_5_age').val(), 1, 125))
					fv.raiseError(i18nmessages.step14Err3);
			}
			if (getRadioValue(document.getElementsByName("q90_6"))=='yes')
			{
				if (fv.isEmpty($('#q90_6_age').val()) && fv.isEmpty($('#q90_6_year_year').val()) ) 
					fv.raiseError(i18nmessages.step14Err2+"(#6)");
				if (!fv.isValidNumber($('#q90_6_age').val(), 1, 125))
					fv.raiseError(i18nmessages.step14Err3);
			}
			if (!fv.isRadioChecked(document.getElementsByName('q91_1')) ||
				!fv.isRadioChecked(document.getElementsByName('q91_2')) ||
				!fv.isRadioChecked(document.getElementsByName('q91_3'))	 )
			{
				fv.raiseError(i18nmessages.step14Err4);
			}
			if (getRadioValue(document.getElementsByName('q91_1'))!='never' && !fv.isValidNumber($('#q91_1_howManyYears').val(), 1, 100))
			{
				fv.raiseError(i18nmessages.step14Err5+"(#1)");
			}
			if (getRadioValue(document.getElementsByName('q91_2'))!='never' && !fv.isValidNumber($('#q91_2_howManyYears').val(), 1, 100))
			{
				fv.raiseError(i18nmessages.step14Err5+"(#2)");
			}	
			if (getRadioValue(document.getElementsByName('q91_3'))!='never' && !fv.isValidNumber($('#q91_3_howManyYears').val(), 1, 100))
			{
				fv.raiseError(i18nmessages.step14Err5+"(#3)");
			}	
			if (!fv.isRadioChecked(document.getElementsByName('q92_1')) ||
				!fv.isRadioChecked(document.getElementsByName('q92_2')) ||
				!fv.isRadioChecked(document.getElementsByName('q92_3')) ||
				!fv.isRadioChecked(document.getElementsByName('q92_4')) ||
				!fv.isRadioChecked(document.getElementsByName('q92_5')) ||
				!fv.isRadioChecked(document.getElementsByName('q92_6')) ||
				!fv.isRadioChecked(document.getElementsByName('q92_7')) ||
				!fv.isRadioChecked(document.getElementsByName('q92_8')) ||
				!fv.isRadioChecked(document.getElementsByName('q92_9')) )
			{
				fv.raiseError(i18nmessages.step14Err6);
			}
			if (getRadioValue(document.getElementsByName('q92_1'))!='never' && !fv.isValidNumber($('#q92_1_howManyYears').val(), 1, 100))
			{
				fv.raiseError(i18nmessages.step14Err7+"(#1)");
			}
			if (getRadioValue(document.getElementsByName('q92_2'))!='never' && !fv.isValidNumber($('#q92_2_howManyYears').val(), 1, 100))
			{
				fv.raiseError(i18nmessages.step14Err7+"(#2)");
			}
			if (getRadioValue(document.getElementsByName('q92_3'))!='never' && !fv.isValidNumber($('#q92_3_howManyYears').val(), 1, 100))
			{
				fv.raiseError(i18nmessages.step14Err7+"(#3)");
			}
			if (getRadioValue(document.getElementsByName('q92_4'))!='never' && !fv.isValidNumber($('#q92_4_howManyYears').val(), 1, 100))
			{
				fv.raiseError(i18nmessages.step14Err7+"(#4)");
			}
			if (getRadioValue(document.getElementsByName('q92_5'))!='never' && !fv.isValidNumber($('#q92_5_howManyYears').val(), 1, 100))
			{
				fv.raiseError(i18nmessages.step14Err7+"(#5)");
			}
			if (getRadioValue(document.getElementsByName('q92_6'))!='never' && !fv.isValidNumber($('#q92_6_howManyYears').val(), 1, 100))
			{
				fv.raiseError(i18nmessages.step14Err7+"(#6)");
			}
			if (getRadioValue(document.getElementsByName('q92_7'))!='never' && !fv.isValidNumber($('#q92_7_howManyYears').val(), 1, 100))
			{
				fv.raiseError(i18nmessages.step14Err7+"(#7)");
			}
			if (getRadioValue(document.getElementsByName('q92_8'))!='never' && !fv.isValidNumber($('#q92_8_howManyYears').val(), 1, 100))
			{
				fv.raiseError(i18nmessages.step14Err7+"(#8)");
			}
			if (getRadioValue(document.getElementsByName('q92_9'))!='never' && !fv.isValidNumber($('#q92_9_howManyYears').val(), 1, 100))
			{
				fv.raiseError(i18nmessages.step14Err7+"(#9)");
			}
			if (!fv.isRadioChecked(document.getElementsByName('q93')) )
			{
				fv.raiseError(i18nmessages.step14Err8);
			}
			if 	(getRadioValue(document.getElementsByName('q93'))=='yes')
			{
				if (!fv.isRadioChecked(document.getElementsByName('q93_1')) ||
					!fv.isRadioChecked(document.getElementsByName('q93_2')) ||
					!fv.isRadioChecked(document.getElementsByName('q93_3')) ||
					!fv.isRadioChecked(document.getElementsByName('q93_4')) ||
					!fv.isRadioChecked(document.getElementsByName('q93_5')) )
				{
					fv.raiseError(i18nmessages.step14Err9);
				}	
				if (getRadioValue(document.getElementsByName('q93_1'))!='never' && !fv.isValidNumber($('#q93_1_howManyMonths').val(), 1, 100))
					fv.raiseError(i18nmessages.step14Err10+"(#1)");
				if (getRadioValue(document.getElementsByName('q93_2'))!='never' && !fv.isValidNumber($('#q93_2_howManyMonths').val(), 1, 100))
					fv.raiseError(i18nmessages.step14Err10+"(#2)");
				if (getRadioValue(document.getElementsByName('q93_3'))!='never' && !fv.isValidNumber($('#q93_3_howManyMonths').val(), 1, 100))
					fv.raiseError(i18nmessages.step14Err10+"(#3)");
				if (getRadioValue(document.getElementsByName('q93_4'))!='never' && !fv.isValidNumber($('#q93_4_howManyMonths').val(), 1, 100))
					fv.raiseError(i18nmessages.step14Err10+"(#4)");
				if (getRadioValue(document.getElementsByName('q93_5'))!='never' && !fv.isValidNumber($('#q93_5_howManyMonths').val(), 1, 100))
					fv.raiseError(i18nmessages.step14Err10+"(#5)");
			}
			for (i=1;i<=6;i++){
				if ((!fv.isEmpty($('#q94_'+i+'_ageStart').val()) && !fv.isValidNumber($('#q94_'+i+'_ageStart').val(), 1, 100)) ||
					(!fv.isEmpty($('#q94_'+i+'_ageStop').val()) && !fv.isValidNumber($('#q94_'+i+'_ageStop').val(), 1, 100)) )
				{
					fv.raiseError(i18nmessages.step14Err11+i);
				}
			}
		
	
	// all done
	// if errors, display, else proceed
	if (fv.numErrors() > 0)
	{
		fv.displayErrors();
	
		return false;
	}
	else
	{
		return true;
	}
}
function resetIfnone_hep(){
	if (document.getElementById('q11a_hep_donotknow_type').checked){
		document.getElementById('q11a_hep_a').checked='';
		document.getElementById('q11a_hep_b').checked='';
		document.getElementById('q11a_hep_c').checked='';
	}		  	
}
function resetIfnone(){
	for (i=1;i<=24;i++){
		if (document.getElementById('q12_'+i+'_4').checked){
			for (j=1;j<=3;j++){
				$('#q12_'+i+'_'+j).attr('checked', '');
			}
			$('#q12_'+i+'_ageDiagnosed').val('');
		}
	}
}       
