<?php
	require("DBManipulation.php");
	
		session_start();
	
		if(isset($_SERVER['QUERY_STRING']) && !empty($_SERVER['QUERY_STRING'])){
			global $topscore;
			parse_str($_SERVER['QUERY_STRING'],$output);
			$_SESSION['user'] = $output['firstName'];
			$topscore = check_user_exist($output['firstName'], $output['lastName'], $output['email'], $output['phoneNumber'], $output['address']);
			$_SESSION['topscore'] = $topscore;
		}
		
		if(isset($_POST["options"])){
			if(isset($_POST["CorrectAnswer"])){
				if($_POST["options"] == $_POST["CorrectAnswer"]){
					$score = $_SESSION['score'];
					$score++;
					$_SESSION['score'] = $score;
				}
			}
		}
		
		else{
			//Generate 10 random numbers
			$numbers = range(1, 20);
			shuffle($numbers);
			$randomNumbers =  array_slice($numbers, 0, 10);
			if( !isset( $_SESSION['randNumbers']  ) ) {
				$_SESSION['randNumbers'] = $randomNumbers;
				$_SESSION['index'] = 0;
				$_SESSION['score'] = 0;
			}
		}
		
		function display_Question(){
			$correctAnswer;
			
			$htmlString = '';
			
			if(isset($_SESSION['randNumbers'])){
				
				$randomNum = $_SESSION['randNumbers'];
				$index  = $_SESSION['index'];

				$htmlString.='<div style="text-align:right;margin-right:20px">Hello, '.$_SESSION['user'].'</div>';
				if($index<10){
					$servername = "localhost";
					$username = "root";
					$password = "";
					$db = "QUIZDB";
							
					$conn = our_sql_connect($servername, $username, $password, $db);
							
					if ($conn->connect_error) {
						die ("Connection Failed: " . $conn->connect_error);
					}
			
					$questionQuery = "SELECT QUESTION FROM QUESTION WHERE QUESTIONID = $randomNum[$index]";
					$answerQuery = "SELECT * FROM ANSWER WHERE QUESTIONID = $randomNum[$index]";
					$correctAnswerQuery = "SELECT ANSWER FROM ANSWER WHERE QUESTIONID = $randomNum[$index] AND IsCorrect=1";
			
					// execute command	
					$questionResultSet = mysqli_query($conn, $questionQuery);
					$qRow = mysqli_fetch_array($questionResultSet);
			
					$answerResultSet = mysqli_query($conn, $answerQuery);
					
					$cAnsResultSet = mysqli_query($conn, $correctAnswerQuery);
					$cAnsRow = mysqli_fetch_array($cAnsResultSet);
					$correctAnswer = $cAnsRow["ANSWER"];
					$index++;
					$_SESSION['index'] = $index;
					
					$htmlString.='<div id="container">';
					$htmlString.='<h3>'.$index.'. '.$qRow["QUESTION"].'</h3> </br>';
					
					while($row = $answerResultSet->fetch_array(MYSQLI_ASSOC)){
						$htmlString.='<span><input type="radio" name="options" value="'.$row["Answer"].'"/>'.$row["Answer"].'</span><br/>';
					}
					$htmlString.='<input type="hidden" name="CorrectAnswer" value="'.$correctAnswer.'"/>';
					$htmlString.='<button onclick="this.form.submit();" class="button"> Submit Answer </button>';
					$htmlString.='</div>';
				}
				else{
					$topscore = $_SESSION['topscore'];
					$score = $_SESSION['score'];
					$user = $_SESSION['user'];
					if($score > $topscore){
						$isUpdated = update_score($score,$user);
					}
					$htmlString.='<div id="container">';
					$htmlString.= '<h2>You\'ve got ' . $score . ' correct answers out of 10. </h2>';
					if ($score >= 8)
						$htmlString .= '<h3>You have successfully passed the test. You are now certified in JAVA <h3>';
					else
						$htmlString .= '<h3>Unfortunately you did not pass the test. Please try again later! <h3>';
					$htmlString.='</div>';
					session_unset();
					$htmlString.='<a href="/dashboard/Projects/Quiz/index.html"> START AGAIN </a>';
				}
				return $htmlString;
			}		
		}
?>

<!DOCTYPE html>
<html>
	<head>
		<title> Quiz Application </title>
		<link rel="stylesheet" href="CSS/QuizStyles.css" />
		<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
	</head>
	
	<body>
		<form method="POST" action="<?php echo $_SERVER["PHP_SELF"]; ?>">
		<?php
			echo display_Question();
		?>
		</form>
	</body>
</html>