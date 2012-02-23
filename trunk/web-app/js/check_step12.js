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
			if (!fv.isEmpty($('#q84_1_whatAge').val()) && !fv.isValidNumber($('#q84_1_whatAge').val(), 1, ageCalculated))
				fv.raiseError(i18nmessages.step12Err4);
		}
		if (fv.isRadioChecked(document.getElementsByName('q84_2')) && getRadioValue(document.getElementsByName('q84_2'))=='yes' )
		{
			//if ($('#q84_2_rad_date_month').val()=='' || $('#q84_2_rad_date_day').val()=='' || $('#q84_2_rad_date_year').val()=='' || $('#q82_2_whatAge').val()=='')
				//fv.raiseError(i18nmessages.step12Err3 +"(#2)");
			if (!fv.isEmpty($('#q84_2_whatAge').val()) && !fv.isValidNumber($('#q84_2_whatAge').val(), 1, ageCalculated))
				fv.raiseError(i18nmessages.step12Err4);
		}		
		if (fv.isRadioChecked(document.getElementsByName('q84_3')) && getRadioValue(document.getElementsByName('q84_3'))=='yes' )
		{
			//if ($('#q84_3_rad_date_month').val()=='' || $('#q84_3_rad_date_day').val()=='' || $('#q84_3_rad_date_year').val()=='' || $('#q82_3_whatAge').val()=='')
				//fv.raiseError(i18nmessages.step12Err3 +"(#3)");
			if (!fv.isEmpty($('#q84_3_whatAge').val()) && !fv.isValidNumber($('#q84_3_whatAge').val(), 1, ageCalculated))
				fv.raiseError(i18nmessages.step12Err4);
		}	
		if (fv.isRadioChecked(document.getElementsByName('q84_4')) && getRadioValue(document.getElementsByName('q84_4'))=='yes' )
		{
			//if ($('#q84_4_rad_date_month').val()=='' || $('#q84_4_rad_date_day').val()=='' || $('#q84_4_rad_date_year').val()=='' || $('#q82_4_whatAge').val()=='')
				//fv.raiseError(i18nmessages.step12Err3 +"(#4)");
			if (!fv.isEmpty($('#q84_4_whatAge').val()) && !fv.isValidNumber($('#q84_4_whatAge').val(), 1, ageCalculated))
				fv.raiseError(i18nmessages.step12Err4);
		}	
		if (fv.isRadioChecked(document.getElementsByName('q84_5')) && getRadioValue(document.getElementsByName('q84_5'))=='yes' )
		{
			//if ($('#q84_5_rad_date_month').val()=='' || $('#q84_5_rad_date_day').val()=='' || $('#q84_5_rad_date_year').val()=='' || $('#q82_5_whatAge').val()=='')
				//fv.raiseError(i18nmessages.step12Err3 +"(#5)");
			if (!fv.isEmpty($('#q84_5_whatAge').val()) && !fv.isValidNumber($('#q84_5_whatAge').val(), 1, ageCalculated))
				fv.raiseError(i18nmessages.step12Err4);
		}	
		if (fv.isRadioChecked(document.getElementsByName('q84_6')) && getRadioValue(document.getElementsByName('q84_6'))=='yes' )
		{
			//if ($('#q84_6_rad_date_month').val()=='' || $('#q84_6_rad_date_day').val()=='' || $('#q84_6_rad_date_year').val()=='' || $('#q82_6_whatAge').val()=='')
				//fv.raiseError(i18nmessages.step12Err3 +"(#6)");
			if (!fv.isEmpty($('#q84_6_whatAge').val()) && !fv.isValidNumber($('#q84_6_whatAge').val(), 1, ageCalculated))
				fv.raiseError(i18nmessages.step12Err4);
		}	
		if (fv.isRadioChecked(document.getElementsByName('q84_7')) && getRadioValue(document.getElementsByName('q84_7'))=='yes' )
		{
			//if ($('#q84_7_rad_date_month').val()=='' || $('#q84_7_rad_date_day').val()=='' || $('#q84_7_rad_date_year').val()=='' || $('#q82_7_whatAge').val()=='')
				//fv.raiseError(i18nmessages.step12Err3 +"(#7)");
			if (!fv.isEmpty($('#q84_7_whatAge').val()) && !fv.isValidNumber($('#q84_7_whatAge').val(), 1, ageCalculated))
				fv.raiseError(i18nmessages.step12Err4);
		}	
		if (fv.isRadioChecked(document.getElementsByName('q84_8')) && getRadioValue(document.getElementsByName('q84_8'))=='yes' )
		{
			//if ($('#q84_8_rad_date_month').val()=='' || $('#q84_8_rad_date_day').val()=='' || $('#q84_8_rad_date_year').val()=='' || $('#q82_8_whatAge').val()=='')
				//fv.raiseError(i18nmessages.step12Err3 +"(#8)");
			if (!fv.isEmpty($('#q84_8_whatAge').val()) && !fv.isValidNumber($('#q84_8_whatAge').val(), 1, ageCalculated))
				fv.raiseError(i18nmessages.step12Err4);
		}	
		if (fv.isRadioChecked(document.getElementsByName('q84_9')) && getRadioValue(document.getElementsByName('q84_9'))=='yes' )
		{
			//if ($('#q84_9_rad_date_month').val()=='' || $('#q84_9_rad_date_day').val()=='' || $('#q84_9_rad_date_year').val()=='' || $('#q82_9_whatAge').val()=='')
				//fv.raiseError(i18nmessages.step12Err3 +"(#9)");
			if (!fv.isEmpty($('#q84_9_whatAge').val()) && !fv.isValidNumber($('#q84_9_whatAge').val(), 1, ageCalculated))
				fv.raiseError(i18nmessages.step12Err4);
		}	
		if (fv.isRadioChecked(document.getElementsByName('q84_10')) && getRadioValue(document.getElementsByName('q84_10'))=='yes' )
		{
			//if (fv.isEmpty($('#q84_another').val()) || $('#q84_10_rad_date_month').val()=='' || $('#q84_10_rad_date_day').val()=='' || $('#q84_10_rad_date_year').val()=='' || $('#q82_10_whatAge').val()=='')
				//fv.raiseError(i18nmessages.step12Err3 +"(#10)");

			if (fv.isEmpty($('#q84_another').val()) || fv.isEmpty($('#q84_10_whatAge').val()) || !fv.isValidNumber($('#q84_10_whatAge').val(), 1, ageCalculated))
				fv.raiseError(i18nmessages.step12Err3 +"(#10)");
		}
/************
	if (getRadioValue(document.getElementsByName('q84_1'))=='yes')
	{
            if ( !(fv.isEmpty(document.getElementById('q84_1_rad_date_year').value) && fv.isEmpty(document.getElementById('q84_1_rad_date_month').value) && fv.isEmpty(document.getElementById('q84_1_rad_date_day').value)) &&
                    (fv.isEmpty(document.getElementById('q84_1_rad_date_year').value) ||
                    fv.isEmpty(document.getElementById('q84_1_rad_date_month').value) ||
                    fv.isEmpty(document.getElementById('q84_1_rad_date_day').value)) ){
                            fv.raiseError(i18nmessages.step12ErrInvalidDate891);
            } 
	}         
	if (getRadioValue(document.getElementsByName('q84_2'))=='yes')
	{
            if ( !(fv.isEmpty(document.getElementById('q84_2_rad_date_year').value) && fv.isEmpty(document.getElementById('q84_2_rad_date_month').value) && fv.isEmpty(document.getElementById('q84_2_rad_date_day').value)) &&
                    (fv.isEmpty(document.getElementById('q84_2_rad_date_year').value) ||
                    fv.isEmpty(document.getElementById('q84_2_rad_date_month').value) ||
                    fv.isEmpty(document.getElementById('q84_2_rad_date_day').value)) ){
                            fv.raiseError(i18nmessages.step12ErrInvalidDate892);
            } 
	}         
	if (getRadioValue(document.getElementsByName('q84_3'))=='yes')
	{
            if ( !(fv.isEmpty(document.getElementById('q84_3_rad_date_year').value) && fv.isEmpty(document.getElementById('q84_3_rad_date_month').value) && fv.isEmpty(document.getElementById('q84_3_rad_date_day').value)) &&
                    (fv.isEmpty(document.getElementById('q84_3_rad_date_year').value) ||
                    fv.isEmpty(document.getElementById('q84_3_rad_date_month').value) ||
                    fv.isEmpty(document.getElementById('q84_3_rad_date_day').value)) ){
                            fv.raiseError(i18nmessages.step12ErrInvalidDate893);
            } 
	}         
	if (getRadioValue(document.getElementsByName('q84_4'))=='yes')
	{
            if ( !(fv.isEmpty(document.getElementById('q84_4_rad_date_year').value) && fv.isEmpty(document.getElementById('q84_4_rad_date_month').value) && fv.isEmpty(document.getElementById('q84_4_rad_date_day').value)) &&
                    (fv.isEmpty(document.getElementById('q84_4_rad_date_year').value) ||
                    fv.isEmpty(document.getElementById('q84_4_rad_date_month').value) ||
                    fv.isEmpty(document.getElementById('q84_4_rad_date_day').value)) ){
                            fv.raiseError(i18nmessages.step12ErrInvalidDate894);
            } 
	}         
	if (getRadioValue(document.getElementsByName('q84_5'))=='yes')
	{
            if ( !(fv.isEmpty(document.getElementById('q84_5_rad_date_year').value) && fv.isEmpty(document.getElementById('q84_5_rad_date_month').value) && fv.isEmpty(document.getElementById('q84_5_rad_date_day').value)) &&
                    (fv.isEmpty(document.getElementById('q84_5_rad_date_year').value) ||
                    fv.isEmpty(document.getElementById('q84_5_rad_date_month').value) ||
                    fv.isEmpty(document.getElementById('q84_5_rad_date_day').value)) ){
                            fv.raiseError(i18nmessages.step12ErrInvalidDate895);
            } 
	}         
	if (getRadioValue(document.getElementsByName('q84_6'))=='yes')
	{
            if ( !(fv.isEmpty(document.getElementById('q84_6_rad_date_year').value) && fv.isEmpty(document.getElementById('q84_6_rad_date_month').value) && fv.isEmpty(document.getElementById('q84_6_rad_date_day').value)) &&
                    (fv.isEmpty(document.getElementById('q84_6_rad_date_year').value) ||
                    fv.isEmpty(document.getElementById('q84_6_rad_date_month').value) ||
                    fv.isEmpty(document.getElementById('q84_6_rad_date_day').value)) ){
                            fv.raiseError(i18nmessages.step12ErrInvalidDate896);
            } 
	}         
	if (getRadioValue(document.getElementsByName('q84_7'))=='yes')
	{
            if ( !(fv.isEmpty(document.getElementById('q84_7_rad_date_year').value) && fv.isEmpty(document.getElementById('q84_7_rad_date_month').value) && fv.isEmpty(document.getElementById('q84_7_rad_date_day').value)) &&
                    (fv.isEmpty(document.getElementById('q84_7_rad_date_year').value) ||
                    fv.isEmpty(document.getElementById('q84_7_rad_date_month').value) ||
                    fv.isEmpty(document.getElementById('q84_7_rad_date_day').value)) ){
                            fv.raiseError(i18nmessages.step12ErrInvalidDate897);
            } 
	}         
	if (getRadioValue(document.getElementsByName('q84_8'))=='yes')
	{
            if ( !(fv.isEmpty(document.getElementById('q84_8_rad_date_year').value) && fv.isEmpty(document.getElementById('q84_8_rad_date_month').value) && fv.isEmpty(document.getElementById('q84_8_rad_date_day').value)) &&
                    (fv.isEmpty(document.getElementById('q84_8_rad_date_year').value) ||
                    fv.isEmpty(document.getElementById('q84_8_rad_date_month').value) ||
                    fv.isEmpty(document.getElementById('q84_8_rad_date_day').value)) ){
                            fv.raiseError(i18nmessages.step12ErrInvalidDate898);
            } 
	}         
	if (getRadioValue(document.getElementsByName('q84_9'))=='yes')
	{
            if ( !(fv.isEmpty(document.getElementById('q84_9_rad_date_year').value) && fv.isEmpty(document.getElementById('q84_9_rad_date_month').value) && fv.isEmpty(document.getElementById('q84_9_rad_date_day').value)) &&
                    (fv.isEmpty(document.getElementById('q84_9_rad_date_year').value) ||
                    fv.isEmpty(document.getElementById('q84_9_rad_date_month').value) ||
                    fv.isEmpty(document.getElementById('q84_9_rad_date_day').value)) ){
                            fv.raiseError(i18nmessages.step12ErrInvalidDate899);
            } 
	}         
	if (getRadioValue(document.getElementsByName('q84_10'))=='yes')
	{
            if ( !(fv.isEmpty(document.getElementById('q84_10_rad_date_year').value) && fv.isEmpty(document.getElementById('q84_10_rad_date_month').value) && fv.isEmpty(document.getElementById('q84_10_rad_date_day').value)) &&
                    (fv.isEmpty(document.getElementById('q84_10_rad_date_year').value) ||
                    fv.isEmpty(document.getElementById('q84_10_rad_date_month').value) ||
                    fv.isEmpty(document.getElementById('q84_10_rad_date_day').value)) ){
                            fv.raiseError(i18nmessages.step12ErrInvalidDate8910);
            } 
	}         
**************/

		if ( ($("#q84_1_rad_date_year").val() == today_year.toString())  &&
				(parseInt($("#q84_1_rad_date_month").val()) > today_month) // java.util.Calendar.MONTH is 0~11
			){
				fv.raiseError("Q89.1: "+i18nmessages.step7ErrInvalidDate);
			}
		else if ( ($("#q84_1_rad_date_year").val() == today_year.toString())  &&
				(parseInt($("#q84_1_rad_date_month").val()) == today_month) && // java.util.Calendar.MONTH is 0~11
				(parseInt($("#q84_1_rad_date_day").val()) > today_date)
		){
			fv.raiseError("Q89.1: "+i18nmessages.step7ErrInvalidDate);			
		} else if (
				getRadioValue(document.getElementsByName('q84_1'))=='yes' &&
				fv.isEmpty($("#q84_1_whatAge").val())
				
				){
			var validDate = CalAge_precise($("#q84_1_rad_date_day").val(), $("#q84_1_rad_date_month").val(), $("#q84_1_rad_date_year").val());
			if (validDate <0 || validDate > ageCalculated){
				fv.raiseError("Q89.1: Invalid date");
			}			
		} 
		if ( ($("#q84_2_rad_date_year").val() == today_year.toString())  &&
				(parseInt($("#q84_2_rad_date_month").val()) > today_month) // java.util.Calendar.MONTH is 0~11
			){
				fv.raiseError("Q89.2: "+i18nmessages.step7ErrInvalidDate);
			}
		else if ( ($("#q84_2_rad_date_year").val() == today_year.toString())  &&
				(parseInt($("#q84_2_rad_date_month").val()) == today_month) && // java.util.Calendar.MONTH is 0~11
				(parseInt($("#q84_2_rad_date_day").val()) > today_date)
		){
			fv.raiseError("Q89.2: "+i18nmessages.step7ErrInvalidDate);			
		} else if (
				getRadioValue(document.getElementsByName('q84_2'))=='yes' &&
				fv.isEmpty($("#q84_2_whatAge").val())
				
				){
			var validDate = CalAge_precise($("#q84_2_rad_date_day").val(), $("#q84_2_rad_date_month").val(), $("#q84_2_rad_date_year").val());
			if (validDate <0 || validDate > ageCalculated){
				fv.raiseError("Q89.2: Invalid date");
			}			
			
		}
		if ( ($("#q84_3_rad_date_year").val() == today_year.toString())  &&
				(parseInt($("#q84_3_rad_date_month").val()) > today_month) // java.util.Calendar.MONTH is 0~11
			){
				fv.raiseError("Q89.3: "+i18nmessages.step7ErrInvalidDate);
			}
		else if ( ($("#q84_3_rad_date_year").val() == today_year.toString())  &&
				(parseInt($("#q84_3_rad_date_month").val()) == today_month) && // java.util.Calendar.MONTH is 0~11
				(parseInt($("#q84_3_rad_date_day").val()) > today_date)
		){
			fv.raiseError("Q89.3: "+i18nmessages.step7ErrInvalidDate);			
		} else if (
				getRadioValue(document.getElementsByName('q84_3'))=='yes' &&
				fv.isEmpty($("#q84_3_whatAge").val())
				
				){
			var validDate = CalAge_precise($("#q84_3_rad_date_day").val(), $("#q84_3_rad_date_month").val(), $("#q84_3_rad_date_year").val());
			if (validDate <0 || validDate > ageCalculated){
				fv.raiseError("Q89.3: Invalid date");
			}			
			
		}
		if ( ($("#q84_4_rad_date_year").val() == today_year.toString())  &&
				(parseInt($("#q84_4_rad_date_month").val()) > today_month) // java.util.Calendar.MONTH is 0~11
			){
				fv.raiseError("Q89.4: "+i18nmessages.step7ErrInvalidDate);
			}
		else if ( ($("#q84_4_rad_date_year").val() == today_year.toString())  &&
				(parseInt($("#q84_4_rad_date_month").val()) == today_month) && // java.util.Calendar.MONTH is 0~11
				(parseInt($("#q84_4_rad_date_day").val()) > today_date)
		){
			fv.raiseError("Q89.4: "+i18nmessages.step7ErrInvalidDate);			
		} else if (
				getRadioValue(document.getElementsByName('q84_4'))=='yes' &&
				fv.isEmpty($("#q84_4_whatAge").val())
				
				){
			var validDate = CalAge_precise($("#q84_4_rad_date_day").val(), $("#q84_4_rad_date_month").val(), $("#q84_4_rad_date_year").val());
			if (validDate <0 || validDate > ageCalculated){
				fv.raiseError("Q89.4: Invalid date");
			}			
			
		}
		if ( ($("#q84_5_rad_date_year").val() == today_year.toString())  &&
				(parseInt($("#q84_5_rad_date_month").val()) > today_month) // java.util.Calendar.MONTH is 0~11
			){
				fv.raiseError("Q89.5: "+i18nmessages.step7ErrInvalidDate);
			}
		else if ( ($("#q84_5_rad_date_year").val() == today_year.toString())  &&
				(parseInt($("#q84_5_rad_date_month").val()) == today_month) && // java.util.Calendar.MONTH is 0~11
				(parseInt($("#q84_5_rad_date_day").val()) > today_date)
		){
			fv.raiseError("Q89.5: "+i18nmessages.step7ErrInvalidDate);			
		} else if (
				getRadioValue(document.getElementsByName('q84_5'))=='yes' &&
				fv.isEmpty($("#q84_5_whatAge").val())
				
				){
			var validDate = CalAge_precise($("#q84_5_rad_date_day").val(), $("#q84_5_rad_date_month").val(), $("#q84_5_rad_date_year").val());
			if (validDate <0 || validDate > ageCalculated){
				fv.raiseError("Q89.5: Invalid date");
			}			
			
		}
		if ( ($("#q84_6_rad_date_year").val() == today_year.toString())  &&
				(parseInt($("#q84_6_rad_date_month").val()) > today_month) // java.util.Calendar.MONTH is 0~11
			){
				fv.raiseError("Q89.6: "+i18nmessages.step7ErrInvalidDate);
			}
		else if ( ($("#q84_6_rad_date_year").val() == today_year.toString())  &&
				(parseInt($("#q84_6_rad_date_month").val()) == today_month) && // java.util.Calendar.MONTH is 0~11
				(parseInt($("#q84_6_rad_date_day").val()) > today_date)
		){
			fv.raiseError("Q89.6: "+i18nmessages.step7ErrInvalidDate);			
		} else if (
				getRadioValue(document.getElementsByName('q84_6'))=='yes' &&
				fv.isEmpty($("#q84_6_whatAge").val())
				
				){
			var validDate = CalAge_precise($("#q84_6_rad_date_day").val(), $("#q84_6_rad_date_month").val(), $("#q84_6_rad_date_year").val());
			if (validDate <0 || validDate > ageCalculated){
				fv.raiseError("Q89.6: Invalid date");
			}			
			
		}
		if ( ($("#q84_7_rad_date_year").val() == today_year.toString())  &&
				(parseInt($("#q84_7_rad_date_month").val()) > today_month) // java.util.Calendar.MONTH is 0~11
			){
				fv.raiseError("Q89.7: "+i18nmessages.step7ErrInvalidDate);
			}
		else if ( ($("#q84_7_rad_date_year").val() == today_year.toString())  &&
				(parseInt($("#q84_7_rad_date_month").val()) == today_month) && // java.util.Calendar.MONTH is 0~11
				(parseInt($("#q84_7_rad_date_day").val()) > today_date)
		){
			fv.raiseError("Q89.7: "+i18nmessages.step7ErrInvalidDate);			
		} else if (
				getRadioValue(document.getElementsByName('q84_7'))=='yes' &&
				fv.isEmpty($("#q84_7_whatAge").val())
				
				){			var validDate = CalAge_precise($("#q84_7_rad_date_day").val(), $("#q84_7_rad_date_month").val(), $("#q84_7_rad_date_year").val());
			if (validDate <0 || validDate > ageCalculated){
				fv.raiseError("Q89.7: Invalid date");
			}			
			
		}
		if ( ($("#q84_8_rad_date_year").val() == today_year.toString())  &&
				(parseInt($("#q84_8_rad_date_month").val()) > today_month) // java.util.Calendar.MONTH is 0~11
			){
				fv.raiseError("Q89.8: "+i18nmessages.step7ErrInvalidDate);
			}
		else if ( ($("#q84_8_rad_date_year").val() == today_year.toString())  &&
				(parseInt($("#q84_8_rad_date_month").val()) == today_month) && // java.util.Calendar.MONTH is 0~11
				(parseInt($("#q84_8_rad_date_day").val()) > today_date)
		){
			fv.raiseError("Q89.8: "+i18nmessages.step7ErrInvalidDate);			
		} else if (
				getRadioValue(document.getElementsByName('q84_8'))=='yes' &&
				fv.isEmpty($("#q84_8_whatAge").val())
				
				){			var validDate = CalAge_precise($("#q84_8_rad_date_day").val(), $("#q84_8_rad_date_month").val(), $("#q84_8_rad_date_year").val());
			if (validDate <0 || validDate > ageCalculated){
				fv.raiseError("Q89.8: Invalid date");
			}			
			
		}
		if ( ($("#q84_9_rad_date_year").val() == today_year.toString())  &&
				(parseInt($("#q84_9_rad_date_month").val()) > today_month) // java.util.Calendar.MONTH is 0~11
			){
				fv.raiseError("Q89.9: "+i18nmessages.step7ErrInvalidDate);
			}
		else if ( ($("#q84_9_rad_date_year").val() == today_year.toString())  &&
				(parseInt($("#q84_9_rad_date_month").val()) == today_month) && // java.util.Calendar.MONTH is 0~11
				(parseInt($("#q84_9_rad_date_day").val()) > today_date)
		){
			fv.raiseError("Q89.9: "+i18nmessages.step7ErrInvalidDate);			
		} else if (
				getRadioValue(document.getElementsByName('q84_9'))=='yes' &&
				fv.isEmpty($("#q84_9_whatAge").val())
				
				){
			var validDate = CalAge_precise($("#q84_9_rad_date_day").val(), $("#q84_9_rad_date_month").val(), $("#q84_9_rad_date_year").val());
			if (validDate <0 || validDate > ageCalculated){
				fv.raiseError("Q89.9: Invalid date");
			}			
			
		}
		if ( ($("#q84_10_rad_date_year").val() == today_year.toString())  &&
				(parseInt($("#q84_10_rad_date_month").val()) > today_month) // java.util.Calendar.MONTH is 0~11
			){
				fv.raiseError("Q89.10: "+i18nmessages.step7ErrInvalidDate);
			}
		else if ( ($("#q84_10_rad_date_year").val() == today_year.toString())  &&
				(parseInt($("#q84_10_rad_date_month").val()) == today_month) && // java.util.Calendar.MONTH is 0~11
				(parseInt($("#q84_10_rad_date_day").val()) > today_date)
		){
			fv.raiseError("Q89.10: "+i18nmessages.step7ErrInvalidDate);			
		} else if (
				getRadioValue(document.getElementsByName('q84_10'))=='yes' &&
				fv.isEmpty($("#q84_10_whatAge").val())
				
				){
			var validDate = CalAge_precise($("#q84_10_rad_date_day").val(), $("#q84_10_rad_date_month").val(), $("#q84_10_rad_date_year").val());
			if (validDate <0 || validDate > ageCalculated){
				fv.raiseError("Q89.10: Invalid date");
			}			
			
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
