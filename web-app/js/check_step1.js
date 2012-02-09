 function checkForm1()
{
	 $('#age').val(CalAge($("#DOB_day").val(), $("#DOB_month").val(), $("#DOB_year").val())); // set age
	 
	// instantiate object
	fv = new formValidator();
	
	if ($("#consentNum").val()=='' || $("#consentNum").val()=='---ICN---' || $("#lblvalidICNorNot").text()!=""){
		fv.raiseError(i18nmessages.step1ErrICN);
	}
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
	else{
		var calc_age = CalAge($("#DOB_day").val(), $("#DOB_month").val(), $("#DOB_year").val());
		if (calc_age < 18){
			fv.raiseError("Q1: Age must be 18 or older.");
		}
			
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
		fv.isEmpty(document.getElementById('addr_city').value)  ){
			fv.raiseError(i18nmessages.step1Err8);
	}
	if (	(document.getElementById('country').value=='US' || document.getElementById('country').value=='PR') &&
			!fv.isEmpty(document.getElementById('addr_zipcode').value) &&
			!fv.isValidZipcode(document.getElementById('addr_zipcode').value)){
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