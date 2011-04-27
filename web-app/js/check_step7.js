function checkForm7()
{
	// instantiate object
	fv = new formValidator();
	
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