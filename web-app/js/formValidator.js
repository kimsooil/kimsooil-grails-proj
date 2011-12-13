// Got it from http://www.devshed.com/c/a/JavaScript/Form-Validation-with-JavaScript/8/
// create object
function formValidator()
{
		// set up array to hold error messages
		this.errorList = new Array;
		// set up object methods
		this.isRadioChecked = isRadioChecked;
		this.isEmpty = isEmpty; 
		this.isNumber = isNumber; 
		this.isAlphabetic = isAlphabetic; 
		this.isAlphaNumeric = isAlphaNumeric; 
		this.isWithinRange = isWithinRange; 
		this.isEmailAddress = isEmailAddress; 
		this.isChecked = isChecked; 
		this.raiseError = raiseError; 
		this.numErrors = numErrors; 
		this.displayErrors = displayErrors; 
		this.displayErrorsIE = displayErrorsIE;
		this.needSpecify = needSpecify;
		this.isValidZipcode = isValidZipcode;
		this.isValidNumber = isValidNumber;
}
function isValidNumber(val, min, max)
{
	if (isNaN(val))
	{
		return false;
	}
	else // if number
	{
		if (val < min || val > max){
			return false;
		}
		else {
			return true;
		}
        		
	}
	return false;
}
function isValidZipcode(zipcode)
{

    var regPostcode = /^\d{5}$|^\d{5}-\d{4}$/;

    if (regPostcode.test(zipcode))
    {

        return true;

    }
    else
    {
    	return false;
    }

}
function needSpecify(radioobj, tobj, ifselected){
	myoption=-1;
	len = radioobj.length;
	for (i=len-1; i > -1; i--) {
		if (radioobj[i].checked){
			myoption=i;
		}
	}
	if (myoption==-1){
		return false;
	}
	if (radioobj[myoption].value==ifselected && (tobj.value==null || tobj.value=='null' || tobj.value=='')){
		return true;
	}
	else if (radioobj[myoption].value!=ifselected && (tobj.value!=null && tobj.value!='null' && tobj.value!='')){
		return true;
	}
	else {
		return false;
	}
}
function isRadioChecked(radioobj)
{
	myoption=-1;
	len = radioobj.length;
	for (i=len-1; i > -1; i--) {
		if (radioobj[i].checked){
			myoption=i;
		}
	}
	if (myoption==-1){
		return false;
	}
	else{
		return true;
	}
}

// check to see if input is whitespace only or empty
function isEmpty(val)
{
		if (val.match(/^s+$/) || val == "")
		{
			return true;
		}
		else
		{
			return false;
		} 
}
// check to see if input is number
function isNumber(val)
{
		if (isNaN(val))
		{
			return false;
		}
		else
		{
			return true;
		} 
}
// check to see if input is alphabetic
function isAlphabetic(val)
{
		if (val.match(/^[a-zA-Z]+$/))
		{
		return true;
		}
		else
		{
		return false;
		} 
}
// check to see if input is alphanumeric
function isAlphaNumeric(val)
{
		if (val.match(/^[a-zA-Z0-9]+$/))
		{
		return true;
		}
		else
		{
		return false;
		} 
}
// check to see if value is within range
function isWithinRange(val, min, max)
{
		if (val >= min && val <= max)
		{
		return true;
		}
		else
		{
		return false;
		} 
}
// check to see if input is a valid email address
function isEmailAddress(val)
{
		if (val.match(/^([a-zA-Z0-9])+([.a-zA-Z0-9_-])*@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-]+)+/))
		{
		return true;
		}
		else
		{
		return false;
		} 
}
// check to see if form value is checked
function isChecked(obj)
{
		if (obj.checked)
		{
		return true;
		}
		else
		{
		return false;
		} 
}
// display all errors
// iterate through error array and print each item
function displayErrors_ver1()
{		errMsgs ='';
		for (x=0; x<this.errorList.length; x++)
		{
		//errMsgs = errMsgs + "- "+this.errorList[x]+"\r\n";
		errMsgs = errMsgs + this.errorList[x]+"<br/>";
		}
		numberOferrors = this.errorList.Length+1;

		//alert(x +" error(s) found:\r\n"+errMsgs); // will be overridden by jquery ui diaglog later 
		//jAlert(errMsgs, x +" error(s) found");
		//$.jqDialog.alert(x +" error(s) found:<br/>"+errMsgs); // with OK button
		$.jqDialog.alert("<font color='red'>"+x +" error(s) found:</font><br/>"+errMsgs);
		//$.jqDialog.notify("<font color='red'>"+x +" error(s) found:</font><br/>"+errMsgs);
		//displayAlertMessage(errMsgs);
}
function displayErrors()
{		errMsgs ='';
tooManyErrs='';
//for (x=0; x<this.errorList.length; x++)
var errlimit=this.errorList.length > 20 ? 20 : this.errorList.length;


for (x=0; x<errlimit; x++)
{
//errMsgs = errMsgs + "- "+this.errorList[x]+"\r\n";
errMsgs = errMsgs + this.errorList[x]+"<br/>";
}
numberOferrors = this.errorList.length;

//alert(x +" error(s) found:\r\n"+errMsgs); // will be overridden by jquery ui diaglog later 
//jAlert(errMsgs, x +" error(s) found");
//$.jqDialog.alert(x +" error(s) found:<br/>"+errMsgs); // with OK button

if (numberOferrors > 20)
	tooManyErrs="<br/>... and more.<br/>";

$.jqDialog.alert("<font color='red'>"+numberOferrors +" error(s) found:</font><br/>"+errMsgs+tooManyErrs);


//$.jqDialog.notify("<font color='red'>"+x +" error(s) found:</font><br/>"+errMsgs);
//displayAlertMessage(errMsgs);
}
function displayErrorsIE()
{		errMsgs ='';
		for (x=0; x<this.errorList.length; x++)
		{
		errMsgs = errMsgs+this.errorList[x]+"\r\n";
		}
		numberOferrors = this.errorList.Length+1;

		alert(x +" error(s) found:\r\n"+errMsgs);
		//jAlert(x +" error(s) found:\r\n"+errMsgs);
		//displayAlertMessage(errMsgs);
}
// display as inline for a limited time (5 sec)
function displayAlertMessage(message) {
    var timeOut = 5
    jQuery('#messageBox').text(message).fadeIn()
    jQuery('#messageBox').css("display", "block")
    setTimeout(function() {
    jQuery('#messageBox').fadeOut()
    jQuery('#messageBox').css("display", "none")
    }, timeOut * 1000);
}
// add an error to error list
function raiseError(msg)
{
		this.errorList[this.errorList.length] = msg;
}
// return number of errors in error array
function numErrors()
{
		return this.errorList.length;
}



//------------------------------------------- end object  
