//----------------------
function DisableEnableForm(xForm,xHow){
  objElems = xForm.elements;
  for(i=0;i<objElems.length;i++){
    objElems[i].disabled = xHow;
  }
}
jQuery.expr[':'].regex = function(elem, index, match) {
    var matchParams = match[3].split(','),
        validLabels = /^(data|css):/,
        attr = {
            method: matchParams[0].match(validLabels) ? 
                        matchParams[0].split(':')[0] : 'attr',
            property: matchParams.shift().replace(validLabels,'')
        },
        regexFlags = 'ig',
        regex = new RegExp(matchParams.join('').replace(/^\s+|\s+$/g,''), regexFlags);
    return regex.test(jQuery(elem)[attr.method](attr.property));
}

function toggleQ12(){
	myoption=-1;
	//radioobj=document.getElementsByName('haveCancer'); // NOTE: getElementsByName() doesn't work in IE
	radioobj=document.surveyform2.haveCancer;
	len = radioobj.length;
	for (i=len-1; i > -1; i--) {
		if (radioobj[i].checked){
			myoption=i;
		}
		//alert("option: "+myoption);
		
	}
	if (radioobj[myoption].value=='yes'){
		document.getElementById('q12div').style.display = 'block';
	} else {
		document.getElementById('q12div').style.display = 'none';
	}        		
}


function toggleQ13(){
	myoption=-1;
	radioobj=document.surveyform3.familyHaveCancer;
	len = radioobj.length;
	for (i=len-1; i > -1; i--) {
		if (radioobj[i].checked){
			myoption=i;
		}
		//alert("option: "+myoption);
		
	}
	if (radioobj[myoption].value=='yes'){
		document.getElementById('q13div').style.display = 'block';
	} else {
		document.getElementById('q13div').style.display = 'none';
	}        		
}
function postcode_validate(zipcode)
{

    var regPostcode = /^\d{5}$|^\d{5}-\d{4}$/;;

    obj = document.getElementById("status");
    country = document.getElementById('country');
	obj.style.display = 'inline';
	if (zipcode.length > 1 &&
		(country.value=="PR" || country.value=="US")
	){
	    if(regPostcode.test(zipcode) == false)
	    {
	
	        obj.innerHTML = "<font color='red'>Invalid</font>";
	
	    }
	    else
	    {
			obj.style.display = 'none';
	        obj.innerHTML = "<font color='blue'>Valid</font>";
	
	    }
	}

}
function isCountryValid(country)
{

    obj = document.getElementById("country_status");
	obj.style.display = 'inline';
    if(country == "" || country == "--")
    {

        obj.innerHTML = "<font color='red'>Invalid</font>";

    }
    else
    {
		obj.style.display = 'none';
        obj.innerHTML = "<font color='blue'>Valid</font>";

    }

}
function checkIfValidNumber(val, min, max, obj)
{
    //obj = document.getElementById("country_status");
	obj.style.display = 'inline';	
	if (val!='' && val!=null){
		if (isNaN(val))
		{
			obj.innerHTML = "<font color='red'>Invalid</font>";
		}
		else
		{
			if (val < min || val > max){
				obj.innerHTML = "<font color='red'>Invalid</font>";
			}
			else {
				obj.style.display = 'none';
				obj.innerHTML = "<font color='blue'>Valid</font>";
			}
		}
	}
}
function checkIfNumber(val, obj)
{
    //obj = document.getElementById("country_status");
	obj.style.display = 'inline';	
	if (val!='' && val!=null){
		if (isNaN(val))
		{
			obj.innerHTML = "<font color='red'>Invalid</font>";
		}
		else
		{
			obj.style.display = 'none';
			obj.innerHTML = "<font color='blue'>Valid</font>";
		}
	}
}
function checkIfNumberOnly(val, obj)
{
    //obj = document.getElementById("country_status");
	obj.style.display = 'inline';	
	if (val!='' && val!=null){
		if (isNaN(val))
		{
			obj.style.display = 'none';
			obj.innerHTML = "<font color='blue'>Valid</font>";
		}
		else
		{
			
			obj.innerHTML = "<font color='red'>Warning: Not valid input</font>";
		}
	}
}
function sumOfNumbers(n1, n2, n3, obj)
{
		
	if ((n1.value!='' && n1.value!=null) && (n2.value!='' && n2.value!=null) && (n3.value!='' && n3.value!=null)){
		if (!isNaN(n1.value) && !isNaN(n2.value) && !isNaN(n3.value))
		{
				sum = parseInt(n1.value) + parseInt(n2.value) + parseInt(n3.value);
				obj.style.display = 'inline';
				if (sum <= 10)
					obj.innerHTML = "<font color='blue'><b>(Total: "+sum+")</b></font>";
				else
					obj.innerHTML = "<font color='red'><b>(Total: "+sum+")</b></font>";

		}
	}
}
function getRadioValue(radioobj){
	myoption=-1;
	len = radioobj.length;
	for (i=len-1; i > -1; i--) {
		if (radioobj[i].checked){
			myoption=i;
		}
	}
	if (myoption==-1){
		return '';
	}
	return (radioobj[myoption].value);
}
// modified from http://pankajlalwani.wordpress.com/2010/08/02/age-calculation-from-date-of-birth-using-javascriptjquery/
function CalAge(dd,mm, yy) {

    var now = new Date();
    //var mm = document.getElementById('ddlmnths').value;
    //var ddr = document.getElementById('ddldays');
    //var dd = ddr.options[ddr.selectedIndex].value;
    //var yy = document.getElementById('ddlyrs').value;
    bDay = dd + "/" + mm + "/" + yy;
    bD = bDay.split('/');
   	    if (bD.length == 3) {
        	   born = new Date(bD[2], bD[1] * 1 - 1, bD[0]);
                 years = Math.floor((now.getTime() - born.getTime()) / (365.25 * 24 * 60 * 60 * 1000));
                 //years = (now.getTime() - born.getTime()) / (365.25 * 24 * 60 * 60 * 1000);
   //     if (years < 18) {
   //         alert(�You are not eligible�);
   //
   //     }
   //     else if (years = 18 || years > 18) {
   //     	alert(�Welcome�);
   //     }
        return years;
    }
   	    return -1;
}
function CalAge_precise(dd,mm, yy) {

    var now = new Date();
    //var mm = document.getElementById('ddlmnths').value;
    //var ddr = document.getElementById('ddldays');
    //var dd = ddr.options[ddr.selectedIndex].value;
    //var yy = document.getElementById('ddlyrs').value;
    bDay = dd + "/" + mm + "/" + yy;
    bD = bDay.split('/');
   	    if (bD.length == 3) {
        	   born = new Date(bD[2], bD[1] * 1 - 1, bD[0]);
                 //years = Math.floor((now.getTime() - born.getTime()) / (365.25 * 24 * 60 * 60 * 1000));
                 years = (now.getTime() - born.getTime()) / (365.25 * 24 * 60 * 60 * 1000);
   //     if (years < 18) {
   //         alert(�You are not eligible�);
   //
   //     }
   //     else if (years = 18 || years > 18) {
   //     	alert(�Welcome�);
   //     }
        return years;
    }
   	    return -1;
}

function checkIfConsentNumIsNumber(val)
{
	//var agree=confirm(i18nmessages.step1ErrICN);
	var agree=confirm("Do you really want to save your inputs without Input Validation?");
	if (agree){
		
		if (!isValidNumber(val, 1, 9999))
		{
			alert(i18nmessages.step1ErrICN+" (1~9999)");
			
			return false;
		}
		else
		{
			return true;
		} 
	}
	else{
		return false ;
	}
} 

function confirmIfSure()
{
	//var agree=confirm(i18nmessages.step1ErrICN);
	var agree=confirm("Do you really want to save your inputs without Input Validation?");
	if (agree){
		return true;
	}
	else{
		return false ;
	}
} 

function confirm_if_lost_data()
{
        var sure =confirm('You may lose data you entered. At least ICN number is required to keep data.');
    	if (sure){
		return true;
	}
	else{
		return false ;
	}
}