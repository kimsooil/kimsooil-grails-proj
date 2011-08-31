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
	if (getRadioValue(document.getElementsByName('q32'))=='yes'
		// && (fv.isEmpty($('#date_rectal_exam_month').val()) || fv.isEmpty($('#findings_rectal_exam').val()))  /// date is optional
	){
		//if (fv.isEmpty($('#findings_rectal_exam').val()))
		//	fv.raiseError(i18nmessages.step7Err4);
	}
	if (getRadioValue(document.getElementsByName('q33'))=='yes'
		// && (fv.isEmpty($('#date_most_recent_PSA_test_month').val()) || fv.isEmpty($('#results_PSA_test').val())) // date is optional
	){
		//if (fv.isEmpty($('#results_PSA_test').val())) fv.raiseError(i18nmessages.step7Err5);
		if (!fv.isEmpty($('#results_PSA_test').val()) && !fv.isValidNumber($('#results_PSA_test').val(), 0, 100))
			fv.raiseError("Q38: 0~100");

	}
	if ( ($("#date_rectal_exam_year").val() == today_year.toString())  &&
			(parseInt($("#date_rectal_exam_month").val()) > today_month)
		){
			fv.raiseError("Q37: "+i18nmessages.step7ErrInvalidDate);
		}
	if ( ($("#date_rectal_exam_year").val() == dob_year.toString())  &&
			(parseInt($("#date_rectal_exam_month").val()) < dob_month)
		){
			fv.raiseError("Q37: "+i18nmessages.step7ErrInvalidDate);
		}
	
	if ( ($("#date_most_recent_PSA_test_year").val() == today_year.toString())  &&
			(parseInt($("#date_most_recent_PSA_test_month").val()) > today_month) // java.util.Calendar.MONTH is 0~11
		){
			fv.raiseError("Q38: "+i18nmessages.step7ErrInvalidDate);
		}
	if ( ($("#date_most_recent_PSA_test_year").val() == dob_year.toString())  &&
			(parseInt($("#date_most_recent_PSA_test_month").val()) < dob_month) // java.util.Calendar.MONTH is 0~11
		){
			fv.raiseError("Q38: "+i18nmessages.step7ErrInvalidDate);
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