function checkForm10()
{
	// instantiate object
	fv = new formValidator();

	if (!fv.isEmpty($('#q54').val()) ){
		if (!fv.isValidNumber($('#q54').val(),1,99))
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