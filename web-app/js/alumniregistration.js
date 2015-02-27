alumniregistrationjs = {
	collegeJSON : new Object(),
	fratJSON : new Object(),

	getFratJSON : function(collegeNameVal) {
		jQuery.ajax({
			url : "/getFratJSON",
			type : "GET",
			data : {
				collegeName : collegeNameVal
			},
			dataType : "json",
			beforeSend : function(x) {
				if (x && x.overrideMimeType) {
					x.overrideMimeType("application/j-son;charset=UTF-8");
				}
			},
			success : function(result) {
				alumniregistrationjs.setCollegeJSON(result.content);
				alumniregistrationjs.populateFratSelect(result.content);
			}
		});
	},

	setFratJSON : function(json) {
		this.fratJSON = json;
	},

	populateFratSelect : function(json) {
		var fratListObj = document.getElementById("selectFraternity");
		while (fratListObj.hasChildNodes()) {
			fratListObj.removeChild(fratListObj.firstChild);
		}
		for (i = 0; i < json.frats.length; i++) {
			fratListObj.options[i] = new Option(json.frats[i].fratName,
					json.frats[i].id);
		}
	},

	setCollegeJSON : function(json) {
		this.collegeJSON = json;
	},

	getCollegeJSON : function() {
		var state = document.getElementById("reg_state");
		var stateValue = state.options[state.selectedIndex].value;
		jQuery.ajax({
			url : "/collegeInfoJSON",
			type : "GET",
			data : {
				stateAbrv : stateValue
			},
			dataType : "json",
			beforeSend : function(x) {
				if (x && x.overrideMimeType) {
					x.overrideMimeType("application/j-son;charset=UTF-8");
				}
			},
			success : function(result) {
				alumniregistrationjs.setCollegeJSON(result.content);
				alumniregistrationjs.populateCollegeSelect(result.content);
			}
		});
	},

	populateCollegeSelect : function(json) {
		var collegeListObj = document.getElementById("collegeList");
		while (collegeListObj.hasChildNodes()) {
			collegeListObj.removeChild(collegeListObj.firstChild);
		}

		for (i = 0; i < json.colleges.length; i++) {
			collegeListObj.options[i] = new Option(
					json.colleges[i].collegeName, json.colleges[i].collegeName);
			if (i == 0) {
				collegeListObj.options[i].selected = true;
				alumniregistrationjs
						.getFratJSON(collegeListObj.options[i].value);
			}
		}
	}
}