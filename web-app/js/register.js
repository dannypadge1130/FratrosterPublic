//Define the regular expression to check College E-mails on Activate Form
$(function ()
	{
		$.validator.addMethod("loginRegex", function(value, element) {
		return this.optional(element) || /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.+-]+\.edu$/i.test(value);
	}, "The user's E-mail address must be an EDU e-mail address.");
});

$(document).ready(function() {
//Registration Form
		$('#register').validate({
		rules: {
			firstName: {
				required: true
			},
			lastName: {
				required: true
			},
			email: {
				required: true,
				email: true
			},
			termsAndConditions: {
				required: true
			}
		},
		messages: {
			firstName: {
				required: "Please provide your first name"
			},
			lastName: {
				required: "Please provide your last name"
			},
			email: {
				required: "Please provide your email.",
				email: "This is not a valid email."
			},
			termsAndConditions: {
				required: "Please accept our Terms"
			}
		},
		errorPlacement: function(error, element) { 
			if ( element.is(":radio") || element.is(":checkbox")) {
				error.appendTo( element.parent()); 
			} else {
				error.insertAfter(element);
			} 
		}
	});
//Activate Form 
	$('#activate').validate({
		rules: {
			username: {
				required: true,
		        email: true,
		        loginRegex: true
		    },
		 	termsAndConditions: {
				required: true
		 	}
		},
		messages: {
			termsAndConditions: {
				required: "Please accept the Terms of Use and Privacy Statement"
			},
		    username: {
		    	required: "You must enter your college e-mail address",
		        email: "Your e-mail address needs to be valid",
		        loginRegex: "You must enter your college e-mail address"
		    }
		},
		errorPlacement: function(error, element) { 
			if ( element.is(":radio") || element.is(":checkbox")) {
				error.appendTo( element.parent()); 
			} else {
				error.insertAfter(element);
			} 
		} 
	});
	
	$('#loginForm').validate({
		rules: {
			j_username: {
				required: true,
		        email: true
			},
			j_password: {
				required: true,
		        rangelength:[8,16]
			}
		}, 
		messages: {
			j_username: {
				required: "Please supply an e-mail address.",
				email: "This is not a valid email address."
			},
			j_password: {
				required: 'Please type a password',
		        rangelength: 'Password must be between 8 and 16 characters long.'
			}
		},
		errorPlacement: function(error, element) { 
			if ( element.is(":radio") || element.is(":checkbox")) {
				error.appendTo( element.parent()); 
			} else {
				error.insertAfter(element);
			} 
		} 
	});
	
	$('#alumniRegistrationForm').validate({
		rules: {
			state: {
				required: true
			},
			college: {
				required: true
			},
			firstName: {
				required: true
			},
			lastName: {
				required: true
			},
			email: {
				required: true,
				email: true
			},
			gradYear: {
				required: true
			},
			alumniRegistrationMessage: {
				required: true
			},
			termsAndConditions: {
				required: true
			}
		},
		messages: {
			state: {
				required: "Please provide your state"
			},
			college: {
				required: "Please provide your college"
			},
			firstName: {
				required: "Please provide your first name"
			},
			lastName: {
				required: "Please provide your last name"
			},
			email: {
				required: "Please provide your e-mail address.",
				email: "This is not a valid email address."
			},
			gradYear: {
				required: "Please provide your grad year"
			},
			alumniRegistrationMessage: {
				required: "Please provide a personal message"
			},
			termsAndConditions: {
				required: "Please accept the Terms of Use and Privacy Statement"
			}
		},
		errorPlacement: function(error, element) { 
			if ( element.is(":radio") || element.is(":checkbox")) {
				error.appendTo( element.parent()); 
			} else {
				error.insertAfter(element);
			} 
		}
	});
});
/*
registerjs = {
	collegeJSON : new Object(),
	fratJSON: new Object(),
	emailCode : "",
	
	getFratJSON:function(collegeNameVal){
		jQuery.ajax({
		    url: "/fratRoster/getFratJSON",
		    type: "GET",
		    data: {collegeName: collegeNameVal},
		    dataType: "json",
		    beforeSend: function(x) {
		    	if (x && x.overrideMimeType) {
		    		x.overrideMimeType("application/j-son;charset=UTF-8");
		      	}
		    },
		    success: function(result) {
		    	registerjs.setCollegeJSON(result.content);
		      	registerjs.populateFratSelect(result.content);
		    }
		});
	},
	
	setFratJSON:function(json) {
		this.fratJSON = json;
	},
	
	populateFratSelect:function(json){
		var fratListObj = document.getElementById("fratList");
		while(fratListObj.hasChildNodes()) {
			fratListObj.removeChild(fratListObj.firstChild);
		}
		for(i=0; i<json.frats.length; i++){
			fratListObj.options[i]=new Option(json.frats[i].fratName, json.frats[i].fratName);
		}
	},
		
	setCollegeJSON:function(json){
		this.collegeJSON = json;
	},
		
	getCollegeJSON:function(){
		var state = document.getElementById("reg_state");
		var stateValue = state.options[state.selectedIndex].value;
		jQuery.ajax({
		    url: "/fratRoster/collegeInfoJSON",
		    type: "GET",
		    data: {stateAbrv: stateValue},
		    dataType: "json",
		    beforeSend: function(x) {
		    	if (x && x.overrideMimeType) {
		    		x.overrideMimeType("application/j-son;charset=UTF-8");
		      	}
		    },
		    success: function(result) {
		    	registerjs.setCollegeJSON(result.content);
		      	registerjs.populateCollegeSelect(result.content);
		    }
		});
	},
	
	populateCollegeSelect:function(json){
		var collegeListObj = document.getElementById("collegeList");
		while(collegeListObj.hasChildNodes()) {
			collegeListObj.removeChild(collegeListObj.firstChild);
		}
			
		this.emailCode = json.colleges[0].emailCode;
		for(i=0; i<json.colleges.length; i++){
			collegeListObj.options[i]=new Option(json.colleges[i].collegeName, json.colleges[i].collegeName);
		}
	},
	
	setEmailCode:function(collegeSelectObj){
		if(this.collegeJSON!=null){
			var selected = collegeSelectObj.selectedIndex;
			var collegeName = collegeSelectObj.options[selected].value;
			for(j=0; j<this.collegeJSON.colleges.length; j++){
				if(this.collegeJSON.colleges[j].collegeName == collegeName){
					this.emailCode = this.collegeJSON.colleges[j].emailCode;
				}
			}
		}
	},
		
	checkEmailCode:function(){
		registerjs.setEmailCode(document.getElementById('collegeList'));
		var emailValidator = document.getElementById("register_emailValidator");
		var currEmail = document.getElementById("emailcode").value;
		var currEmailCode = String(currEmail).split("@");
		if(currEmailCode.length > 1){
			currEmailCode = currEmailCode[1];
		}else{
			emailValidator.innerHTML = "Please enter a valid college e-mail address";
			return false;			
		}
		
		if((this.emailCode != null) && (String.trim(this.emailCode)!="") && (this.emailCode == currEmailCode)){
			emailValidator.innerHTML = "valid";
			return true;
		}else{
			emailValidator.innerHTML = "Please enter a valid college e-mail address";
			return false;
		}
	},
	
	newaccountvalidation:function(form){
		registerjs.resetErrorQueue();
		var formError = false;
		if((form["username"].value == null) || (form["username"].value.trim() == "")){
			registerjs.addToErrorQueue("Please enter a college email.");
			formError = true;
		}else{
			if(!registerjs.checkEmailCode()){
				registerjs.addToErrorQueue("Please enter a valid college email.");
				formError = true;
			}
		}
		
		if((!form["termsAndConditions"].checked)){
			registerjs.addToErrorQueue("Please accept the terms and conditions.");
			formError = true;
		}
		if((form["college"].value == null) || (form["college"].value.trim() == "")){
			registerjs.addToErrorQueue("Please select a College.");
			formError = true;
		}
		if((form["state"].value == null) || (form["state"].value.trim() == "")){
			registerjs.addToErrorQueue("Please select a State.");
			formError = true;
		}
		
		if(!formError){
			globaljs.submitForm(form);
		}
	},
	
	resetErrorQueue:function(){
		errorForm = document.getElementById("errorForm");
		errorForm.style.display = "none";
		while (errorForm.hasChildNodes()) {
			errorForm.removeChild(errorForm.lastChild);
		}
	},
	
	addToErrorQueue:function(msg){
		errorForm = document.getElementById("errorForm");
		errorForm.style.display = "block";
		var newError = document.createElement("li");
		newError.innerHTML=msg;
		errorForm.insertBefore(newError, errorForm.getElementsByTagName("li")[0]);
	}
}

alumniregistrationjs = {
	collegeJSON : new Object(),
	fratJSON: new Object(),
	
	getFratJSON:function(collegeNameVal){
		jQuery.ajax({
		    url: "/fratRoster/getFratJSON",
		    type: "GET",
		    data: {collegeName: collegeNameVal},
		    dataType: "json",
		    beforeSend: function(x) {
		    	if (x && x.overrideMimeType) {
		    		x.overrideMimeType("application/j-son;charset=UTF-8");
		      	}
		    },
		    success: function(result) {
		    	alumniregistrationjs.setCollegeJSON(result.content);
		      	alumniregistrationjs.populateFratSelect(result.content);
		    }
		});
	},
	
	setFratJSON:function(json) {
		this.fratJSON = json;
	},
	
	populateFratSelect:function(json){
		var fratListObj = document.getElementById("fratList");
		while(fratListObj.hasChildNodes()) {
			fratListObj.removeChild(fratListObj.firstChild);
		}
		for(i=0; i<json.frats.length; i++){
			fratListObj.options[i]=new Option(json.frats[i].fratName, json.frats[i].fratName);
		}
	},
		
	setCollegeJSON:function(json){
		this.collegeJSON = json;
	},
		
	getCollegeJSON:function(){
		var state = document.getElementById("reg_state");
		var stateValue = state.options[state.selectedIndex].value;
		jQuery.ajax({
		    url: "/fratRoster/collegeInfoJSON",
		    type: "GET",
		    data: {stateAbrv: stateValue},
		    dataType: "json",
		    beforeSend: function(x) {
		    	if (x && x.overrideMimeType) {
		    		x.overrideMimeType("application/j-son;charset=UTF-8");
		      	}
		    },
		    success: function(result) {
		    	alumniregistrationjs.setCollegeJSON(result.content);
		      	alumniregistrationjs.populateCollegeSelect(result.content);
		    }
		});
	},
	
	populateCollegeSelect:function(json){
		var collegeListObj = document.getElementById("collegeList");
		while(collegeListObj.hasChildNodes()) {
			collegeListObj.removeChild(collegeListObj.firstChild);
		}
			
		for(i=0; i<json.colleges.length; i++){
			collegeListObj.options[i]=new Option(json.colleges[i].collegeName, json.colleges[i].collegeName);
			if(i==0){
				collegeListObj.options[i].selected = true;
				alumniregistrationjs.getFratJSON(collegeListObj.options[i].value);
			}
		}
	}
}*/