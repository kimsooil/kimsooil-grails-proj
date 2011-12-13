	function checkForm15()
	{
		// instantiate object
		fv = new formValidator();
		
	//	String q95_doctor_name, q95_doctor_telephone, q95_doctor_other_info
	//	String q95_addr_street1,q95_addr_street2, q95_addr_city, q95_addr_state, q95_addr_zipcode, q95_country	
	/*
		if (fv.isEmpty($('#q95_doctor_name').val())){
			fv.raiseError("Q100: Enter name (Doctor).");
		}
		if (fv.isEmpty($('#q95_doctor_telephone').val())){
			fv.raiseError("Q100: Enter telephone number (Doctor).");
		}
		if (fv.isEmpty($('#q95_addr_street1').val())){
			fv.raiseError("Q100: Enter street (Doctor).");
		}
		if (fv.isEmpty($('#q95_addr_city').val())){
			fv.raiseError("Q100: Enter city (Doctor).");
		}
		if (fv.isEmpty($('#q95_addr_state').val())){
			fv.raiseError("Q100: Enter state (Doctor).");
		}
	
		if (!fv.isValidZipcode($('#q95_addr_zipcode').val())){
			fv.raiseError(i18nmessages.step15Err1);
		}
		
		if (fv.isEmpty($('#q95_country').val())){
			fv.raiseError("Q100: Choose country");
		}
	*/	
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
