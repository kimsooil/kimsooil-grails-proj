function checkForm9()
{
	// instantiate object
	fv = new formValidator();
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
	if ( ($("#q48dateLastVisitGynecologist_year").val() == today_year.toString())  &&
			(parseInt($("#q48dateLastVisitGynecologist_month").val()) > today_month) // java.util.Calendar.MONTH is 0~11
		){
			fv.raiseError("Q53: "+i18nmessages.step7ErrInvalidDate);
		}	
	if ( ($("#q48dateLastVisitGynecologist_year").val() == dob_year.toString())  &&
			(parseInt($("#q48dateLastVisitGynecologist_month").val()) < dob_month) // java.util.Calendar.MONTH is 0~11
		){
			fv.raiseError("Q53: "+i18nmessages.step7ErrInvalidDate);
		}	

	/*
	if (getRadioValue(document.getElementsByName('q47'))!='never' && ($('#q48_date_last_visit_gynecologist_momth').val()=='' || $('#q48_date_last_visit_gynecologist_year').val()==''))
	{
		fv.raiseError(i18nmessages.step9Err4);
	}
	*/
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
	/*
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
	*/
	if ( ($("#q51date1_year").val() == today_year.toString())  &&
			(parseInt($("#q51date1_month").val()) > today_month) // java.util.Calendar.MONTH is 0~11
		){
			fv.raiseError("Q56.1: "+i18nmessages.step7ErrInvalidDate);
		}	
	if ( ($("#q51date1_year").val() == dob_year.toString())  &&
			(parseInt($("#q51date1_month").val()) < dob_month) // java.util.Calendar.MONTH is 0~11
		){
			fv.raiseError("Q56.1: "+i18nmessages.step7ErrInvalidDate);
		}	
	
	if ( ($("#q51date2_year").val() == today_year.toString())  &&
			(parseInt($("#q51date2_month").val()) > today_month) // java.util.Calendar.MONTH is 0~11
		){
			fv.raiseError("Q56.2: "+i18nmessages.step7ErrInvalidDate);
		}	
	if ( ($("#q51date2_year").val() == dob_year.toString())  &&
			(parseInt($("#q51date2_month").val()) < dob_month) // java.util.Calendar.MONTH is 0~11
		){
			fv.raiseError("Q56.2: "+i18nmessages.step7ErrInvalidDate);
		}	

	if ( ($("#q51date3_year").val() == today_year.toString())  &&
			(parseInt($("#q51date3_month").val()) > today_month) // java.util.Calendar.MONTH is 0~11
		){
			fv.raiseError("Q56.3: "+i18nmessages.step7ErrInvalidDate);
		}	
	if ( ($("#q51date3_year").val() == dob_year.toString())  &&
			(parseInt($("#q51date3_month").val()) < dob_month) // java.util.Calendar.MONTH is 0~11
		){
			fv.raiseError("Q56.3: "+i18nmessages.step7ErrInvalidDate);
		}	

	if ( ($("#q51date4_year").val() == today_year.toString())  &&
			(parseInt($("#q51date4_month").val()) > today_month) // java.util.Calendar.MONTH is 0~11
		){
			fv.raiseError("Q56.4: "+i18nmessages.step7ErrInvalidDate);
		}	
	if ( ($("#q51date4_year").val() == dob_year.toString())  &&
			(parseInt($("#q51date4_month").val()) < dob_month) // java.util.Calendar.MONTH is 0~11
		){
			fv.raiseError("Q56.4: "+i18nmessages.step7ErrInvalidDate);
		}	
	
	if ( ($("#q51date5_year").val() == today_year.toString())  &&
			(parseInt($("#q51date5_month").val()) > today_month) // java.util.Calendar.MONTH is 0~11
		){
			fv.raiseError("Q56.5: "+i18nmessages.step7ErrInvalidDate);
		}	
	if ( ($("#q51date5_year").val() == dob_year.toString())  &&
			(parseInt($("#q51date5_month").val()) < dob_month) // java.util.Calendar.MONTH is 0~11
		){
			fv.raiseError("Q56.5: "+i18nmessages.step7ErrInvalidDate);
		}	

	if ( ($("#q51date6_year").val() == today_year.toString())  &&
			(parseInt($("#q51date6_month").val()) > today_month) // java.util.Calendar.MONTH is 0~11
		){
			fv.raiseError("Q56.6: "+i18nmessages.step7ErrInvalidDate);
		}	
	if ( ($("#q51date6_year").val() == dob_year.toString())  &&
			(parseInt($("#q51date6_month").val()) < dob_month) // java.util.Calendar.MONTH is 0~11
		){
			fv.raiseError("Q56.6: "+i18nmessages.step7ErrInvalidDate);
		}	

	if (!fv.isRadioChecked(document.getElementsByName('q52')) )
	{
		fv.raiseError(i18nmessages.step9Err16_1);
	}
	if ( ($("#q52dateMostRecentPapSmear_year").val() == today_year.toString())  &&
			(parseInt($("#q52dateMostRecentPapSmear_month").val()) > today_month) // java.util.Calendar.MONTH is 0~11
		){
			fv.raiseError("Q57: "+i18nmessages.step7ErrInvalidDate);
		}	
	if ( ($("#q52dateMostRecentPapSmear_year").val() == dob_year.toString())  &&
			(parseInt($("#q52dateMostRecentPapSmear_month").val()) < dob_month) // java.util.Calendar.MONTH is 0~11
		){
			fv.raiseError("Q57: "+i18nmessages.step7ErrInvalidDate);
		}	

	/*
	if (getRadioValue(document.getElementsByName('q52'))=='yes' &&
		( fv.isEmpty($('#q52_date_most_recent_pap_smear_month').val()) || fv.isEmpty($('#q52_date_most_recent_pap_smear_year').val()) ||fv.isEmpty($('#q52_results_pap_smear').val()) )
	)
	{
		fv.raiseError(i18nmessages.step9Err16);
	}
	*/	
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