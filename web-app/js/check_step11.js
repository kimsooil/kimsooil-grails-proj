function checkForm11()
{
	// instantiate object
	fv = new formValidator();

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
