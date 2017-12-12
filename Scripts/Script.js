$(document).ready(function () {

	$("#startQuiz").click(function () {

		var fName = $("#firstName").val();
		var lName = $("#lastName").val();
		var email = $("#email").val();
		var pNumber = $("#phoneNumber").val();
		var address = $("#address").val();
		var isValid = true;

		// Check first name is not empty
		if (fName == "") {
			$("#firstNameError").text("This field is required");
			isValid = false;
		} else {
			$("#firstNameError").text("");
		}

		// Check lasst name is not empty
		if (lName == "") {
			$("#lastNameError").text("This field is required");
			isValid = false;
		} else {
			$("#lastNameError").text("");
		}

		// Check email address is not empty
		if (email == "") {
			$("#emailError").text("This field is required");
			isValid = false;
		} else {
			$("#emailError").text("");
			// Check if the entered email is valid or not
			var reg = /^([a-zA-Z0-9_.-])+@([a-zA-Z0-9_.-])+\.([a-zA-Z])+([a-zA-Z])+/;
			if (!reg.test(email)) {
				$("#emailError").text("Invalid Email address");
				isValid = false;
			} else {
				$("#emailError").text("");
			}
		}

		// Check phone number is not empty
		if (pNumber == "") {
			$("#phoneNumberError").text("This field is required");
			isValid = false;
		} else {
			$("#phoneNumberError").text("");
		}

		// Check address is not empty
		if (address == "") {
			$("#addressError").text("This field is required");
			isValid = false;
		} else {
			$("#addressError").text("");
		}


		if (typeof (Storage) !== "undefined") {
			localStorage.setItem("FirstName", fName);
		}

		if (isValid) {
			window.location.href = 'Quiz.php?firstName='+fName+'&lastName='+lName+'&email='+email+'&phoneNumber='+pNumber+'&address='+address;			
		}


	}); // End of submit button click function 

});
