function checkForm12()
{
	// instantiate object
	fv = new formValidator();

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
			//if ($('#q84_1_rad_date_month').val()=='' || $('#q84_1_rad_date_day').val()=='' || $('#q84_1_rad_date_year').val()=='' || $('#q82_1_whatAge').val()=='')
				//fv.raiseError(i18nmessages.step12Err3 +"(#1)");
			if (!fv.isEmpty($('#q84_1_whatAge').val()) && !fv.isValidNumber($('#q84_1_whatAge').val(), 1, 125))
				fv.raiseError(i18nmessages.step12Err4);
		}
		if (fv.isRadioChecked(document.getElementsByName('q84_2')) && getRadioValue(document.getElementsByName('q84_2'))=='yes' )
		{
			//if ($('#q84_2_rad_date_month').val()=='' || $('#q84_2_rad_date_day').val()=='' || $('#q84_2_rad_date_year').val()=='' || $('#q82_2_whatAge').val()=='')
				//fv.raiseError(i18nmessages.step12Err3 +"(#2)");
			if (!fv.isEmpty($('#q84_2_whatAge').val()) && !fv.isValidNumber($('#q84_2_whatAge').val(), 1, 125))
				fv.raiseError(i18nmessages.step12Err4);
		}		
		if (fv.isRadioChecked(document.getElementsByName('q84_3')) && getRadioValue(document.getElementsByName('q84_3'))=='yes' )
		{
			//if ($('#q84_3_rad_date_month').val()=='' || $('#q84_3_rad_date_day').val()=='' || $('#q84_3_rad_date_year').val()=='' || $('#q82_3_whatAge').val()=='')
				//fv.raiseError(i18nmessages.step12Err3 +"(#3)");
			if (!fv.isEmpty($('#q84_3_whatAge').val()) && !fv.isValidNumber($('#q84_3_whatAge').val(), 1, 125))
				fv.raiseError(i18nmessages.step12Err4);
		}	
		if (fv.isRadioChecked(document.getElementsByName('q84_4')) && getRadioValue(document.getElementsByName('q84_4'))=='yes' )
		{
			//if ($('#q84_4_rad_date_month').val()=='' || $('#q84_4_rad_date_day').val()=='' || $('#q84_4_rad_date_year').val()=='' || $('#q82_4_whatAge').val()=='')
				//fv.raiseError(i18nmessages.step12Err3 +"(#4)");
			if (!fv.isEmpty($('#q84_4_whatAge').val()) && !fv.isValidNumber($('#q84_4_whatAge').val(), 1, 125))
				fv.raiseError(i18nmessages.step12Err4);
		}	
		if (fv.isRadioChecked(document.getElementsByName('q84_5')) && getRadioValue(document.getElementsByName('q84_5'))=='yes' )
		{
			//if ($('#q84_5_rad_date_month').val()=='' || $('#q84_5_rad_date_day').val()=='' || $('#q84_5_rad_date_year').val()=='' || $('#q82_5_whatAge').val()=='')
				//fv.raiseError(i18nmessages.step12Err3 +"(#5)");
			if (!fv.isEmpty($('#q84_5_whatAge').val()) && !fv.isValidNumber($('#q84_5_whatAge').val(), 1, 125))
				fv.raiseError(i18nmessages.step12Err4);
		}	
		if (fv.isRadioChecked(document.getElementsByName('q84_6')) && getRadioValue(document.getElementsByName('q84_6'))=='yes' )
		{
			//if ($('#q84_6_rad_date_month').val()=='' || $('#q84_6_rad_date_day').val()=='' || $('#q84_6_rad_date_year').val()=='' || $('#q82_6_whatAge').val()=='')
				//fv.raiseError(i18nmessages.step12Err3 +"(#6)");
			if (!fv.isEmpty($('#q84_6_whatAge').val()) && !fv.isValidNumber($('#q84_6_whatAge').val(), 1, 125))
				fv.raiseError(i18nmessages.step12Err4);
		}	
		if (fv.isRadioChecked(document.getElementsByName('q84_7')) && getRadioValue(document.getElementsByName('q84_7'))=='yes' )
		{
			//if ($('#q84_7_rad_date_month').val()=='' || $('#q84_7_rad_date_day').val()=='' || $('#q84_7_rad_date_year').val()=='' || $('#q82_7_whatAge').val()=='')
				//fv.raiseError(i18nmessages.step12Err3 +"(#7)");
			if (!fv.isEmpty($('#q84_7_whatAge').val()) && !fv.isValidNumber($('#q84_7_whatAge').val(), 1, 125))
				fv.raiseError(i18nmessages.step12Err4);
		}	
		if (fv.isRadioChecked(document.getElementsByName('q84_8')) && getRadioValue(document.getElementsByName('q84_8'))=='yes' )
		{
			//if ($('#q84_8_rad_date_month').val()=='' || $('#q84_8_rad_date_day').val()=='' || $('#q84_8_rad_date_year').val()=='' || $('#q82_8_whatAge').val()=='')
				//fv.raiseError(i18nmessages.step12Err3 +"(#8)");
			if (!fv.isEmpty($('#q84_8_whatAge').val()) && !fv.isValidNumber($('#q84_8_whatAge').val(), 1, 125))
				fv.raiseError(i18nmessages.step12Err4);
		}	
		if (fv.isRadioChecked(document.getElementsByName('q84_9')) && getRadioValue(document.getElementsByName('q84_9'))=='yes' )
		{
			//if ($('#q84_9_rad_date_month').val()=='' || $('#q84_9_rad_date_day').val()=='' || $('#q84_9_rad_date_year').val()=='' || $('#q82_9_whatAge').val()=='')
				//fv.raiseError(i18nmessages.step12Err3 +"(#9)");
			if (!fv.isEmpty($('#q84_9_whatAge').val()) && !fv.isValidNumber($('#q84_9_whatAge').val(), 1, 125))
				fv.raiseError(i18nmessages.step12Err4);
		}	
		if (fv.isRadioChecked(document.getElementsByName('q84_10')) && getRadioValue(document.getElementsByName('q84_10'))=='yes' )
		{
			//if (fv.isEmpty($('#q84_another').val()) || $('#q84_10_rad_date_month').val()=='' || $('#q84_10_rad_date_day').val()=='' || $('#q84_10_rad_date_year').val()=='' || $('#q82_10_whatAge').val()=='')
				//fv.raiseError(i18nmessages.step12Err3 +"(#10)");

			if (fv.isEmpty($('#q84_another').val()) || fv.isEmpty($('#q84_10_whatAge').val()) || !fv.isValidNumber($('#q84_10_whatAge').val(), 1, 125))
				fv.raiseError(i18nmessages.step12Err3 +"(#10)");
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
