
var questions = [
	["Which of the following can be operands of arithmetic operators?", "Numeric", "Boolean", "Characters", "Both Numeric & Characters", "D"],
	["Decrement operator, –, decreases value of variable by what number?", "1", "2", "3", "4", "A"],
	["What is the return type of a method that does not returns any value?", "int", "float", "void", "double", "C"],
	["What is the process of defining more than one method in a class differentiated by method signature?", "Function overriding", "Function overloading", "Function doubling", "None of the mentioned", "B"],
	["Which of the following is a method having same name as that of it’s class?", "finalize", "delete", "class", "constructor", "D"],
	["Which method can be defined only once in a program?", "main menthod", "finalize method", "static method", "private method", "A"],
	["String in Java is a?", "class", "object", "variable", "character array", "A"],
	["Which of these method of String class is used to obtain character at specified index?", "char()", "Charat()", "charat()", "charAt()", "D"],
	["Which of these keywords is used to refer to member of base class from a sub class?", "upper", "super", "this", "None of above", "B"],
	["Which of these method of String class can be used to test to strings for equality?", "isequal()", "isequals()", "equal()", "equals()", "A"],
	["Which of the following statements are incorrect?", "String is a class.", "Strings in java are mutable.", "Every string is an object of class String.", "Java defines a peer class of String, called StringBuffer, which allows string to be altered.", "B"],
	["Which of these method of class String is used to check weather a given object starts with a particular string literal?", "startsWith()", "endsWith()", "Starts()", "ends()", "A"],
	["Which of these data type value is returned by equals() method of String class?", "char", "int", "boolean", "All of the mentioned", "C"],
	["Which of these keywords is used to refer to member of base class from a sub class?", "upper", "super", "this", "None of the mentioned", "B"],
	["A class member declared protected becomes member of subclass of which type?", "public member", "private member", "protected member", "static member", "B"],
	["Which of these is correct way of inheriting class A by class B?", "class B + class A {}", "class B inherits class A {}", "class B extends A {}", "class B extends class A {}", "C"],
	["Which of these keywords can be used to prevent Method overriding?", "static", "constant", "protected", "final", "D"],
	["Which of these is correct way of calling a constructor having no parameters, of superclass A by subclass B?", "super(void);", "superclass.();", "super.A();", "super();", "D"],
	["Which of these is supported by method overriding in Java?", "Abstraction", "Encapsulation", "Polymorphism", "None of the mentioned", "C"],
	["Which keyword is used by method to refer to the object that invoked it?", "import", "catch", "abstract", "this", "D"]

];

var pos = 0, selectedQuestion = 0;
var answer_container, test_status, question, choice, choices, chA, chB, chC, correct = 0;
var quizQuestions = [];
var questionHtmlCode, answerHtmlCode;


$(document).ready(function () {
	createRandomNumbers();
	renderQuestion();
	var name = localStorage.getItem("FirstName");
	$("#fname").html("Hello, " + name);
});


function createRandomNumbers() {
	while (quizQuestions.length < 10) {
		var randomnumber = Math.ceil(Math.random() * 19);

		if (quizQuestions.indexOf(randomnumber) > -1)
			continue;

		quizQuestions[quizQuestions.length] = randomnumber;
	}
}

function renderQuestion() {
	answer_container = $("#answer_container");

	//pos++;
	if (pos >= quizQuestions.length) {

		$("#question_container").html("Quiz Completed");

		answerHtmlCode = "<h2>You've got " + correct + " correct answers out of " + quizQuestions.length + ". </h2>";
		if (correct >= 8)
			answerHtmlCode += "<h3>You have successfully passed the test. You are now certified in JAVA <h3>";
		else
			answerHtmlCode += "<h3>Unfortunately you did not pass the test. Please try again later! <h3>";

		pos = 0;
		correct = 0;
		$("#container").effect("fade", "slow");
		answer_container.html(answerHtmlCode);
		return false;
	}

	selectedQuestion = quizQuestions[pos];
	$("#question_container").html("Question " + (pos + 1) + " of 10");
	question = questions[selectedQuestion][0];

	chA = questions[selectedQuestion][1];
	chB = questions[selectedQuestion][2];
	chC = questions[selectedQuestion][3];
	chD = questions[selectedQuestion][4];

	answerHtmlCode = "<h3>" + question + "</h3>";
	answerHtmlCode += "<input type='radio' name='choices' value='A'> " + chA + "<br>";
	answerHtmlCode += "<input type='radio' name='choices' value='B'> " + chB + "<br>";
	answerHtmlCode += "<input type='radio' name='choices' value='C'> " + chC + "<br>";
	answerHtmlCode += "<input type='radio' name='choices' value='D'> " + chD + "<br><br>"
	answerHtmlCode += "<button onclick='checkAnswer()' class='button' >Submit Answer</button>"

	answer_container.html(answerHtmlCode);
	$("#container").effect("slide", "fast");
}

function checkAnswer() {
	choices = $('[name =  "choices"]');
	for (var i = 0; i < choices.length; i++) {
		if (choices[i].checked) {
			choice = choices[i].value;
		}
	}
	if (typeof (choice) == "undefined" || choice == "") {
		window.alert("Please select the answer...!!!")
	}
	else {

		if (choice == questions[selectedQuestion][5]) {
			correct++;
			pos++;
		}
		else {
			pos++;
		}
		choice = "";
		renderQuestion();
	}
}