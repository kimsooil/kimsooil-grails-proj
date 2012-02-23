function checkForm4()
{
	// instantiate object
	fv = new formValidator();

	if (fv.isEmpty(document.getElementById('q21DateStopSmoking_day').value) ||
			fv.isEmpty(document.getElementById('q21DateStopSmoking_month').value) ||
			fv.isEmpty(document.getElementById('q21DateStopSmoking_year').value)){
				//fv.raiseError("Q26: Invalid date");
		}
		else{
			var validDate = CalAge_precise($("#q21DateStopSmoking_day").val(), $("#q21DateStopSmoking_month").val(), $("#q21DateStopSmoking_year").val());
			if (validDate <0 || validDate > ageCalculated){
				fv.raiseError("Q26: Invalid date");
			}
				
		}	
	
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
		 (!fv.isValidNumber($('#q15_1_howManyTimesPerWeek').val(), 1, 200)) || !fv.isValidNumber($('#q15_1_howManyYears').val(), 1, ageCalculated))
	   ){
		fv.raiseError(i18nmessages.step4Err6);
	}
	if ((getRadioValue(document.getElementsByName('q15_2'))=='currently' || getRadioValue(document.getElementsByName('q15_2'))=='quit') &&
		(($('#q15_2_howManyTimesPerWeek').val()=='' && $('#q15_2_howManyYears').val()=='') ||
		 (!fv.isValidNumber($('#q15_2_howManyTimesPerWeek').val(), 1, 200)) || !fv.isValidNumber($('#q15_2_howManyYears').val(), 1, ageCalculated))
	   ){
		fv.raiseError(i18nmessages.step4Err7);
	}
	if ((getRadioValue(document.getElementsByName('q15_3'))=='currently' || getRadioValue(document.getElementsByName('q15_3'))=='quit') &&
		(($('#q15_3_howManyTimesPerWeek').val()=='' && $('#q15_3_howManyYears').val()=='') ||
		 (!fv.isValidNumber($('#q15_3_howManyTimesPerWeek').val(), 1, 200)) || !fv.isValidNumber($('#q15_3_howManyYears').val(), 1, ageCalculated))
	   ){
		fv.raiseError(i18nmessages.step4Err8);
	}
	if ((getRadioValue(document.getElementsByName('q15_4'))=='currently' || getRadioValue(document.getElementsByName('q15_4'))=='quit') &&
		(($('#q15_4_howManyTimesPerWeek').val()=='' && $('#q15_4_howManyYears').val()=='') ||
		 (!fv.isValidNumber($('#q15_4_howManyTimesPerWeek').val(), 1, 200)) || !fv.isValidNumber($('#q15_4_howManyYears').val(), 1, ageCalculated))
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
	$("[name*='q21']").each( function() {
		if (this.value!='') s1=true;
	});
	if (!s1 && getRadioValue(document.getElementsByName('stillSmoke'))=='no'){
		fv.raiseError(i18nmessages.step4Err12)
	} else if (fv.isEmpty(document.getElementById('q21_whenStopSmoking_years').value) &&
                   fv.isEmpty(document.getElementById('q21_whenStopSmoking_months').value) &&
                    getRadioValue(document.getElementsByName('stillSmoke'))=='no'){
            if ( !(fv.isEmpty(document.getElementById('q21DateStopSmoking_day').value) && fv.isEmpty(document.getElementById('q21DateStopSmoking_month').value) && fv.isEmpty(document.getElementById('q21DateStopSmoking_year').value)) &&
                    (fv.isEmpty(document.getElementById('q21DateStopSmoking_day').value) ||
                    fv.isEmpty(document.getElementById('q21DateStopSmoking_month').value) ||
                    fv.isEmpty(document.getElementById('q21DateStopSmoking_year').value)) ){
                            fv.raiseError(i18nmessages.step4Err13);
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