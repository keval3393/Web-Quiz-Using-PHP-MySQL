<?php

	//Generate 10 random numbers
	$numbers = range(0, 20);
	shuffle($numbers);
	$randomNumbers =  array_slice($numbers, 0, 10);

    function our_sql_connect($srv, $usr, $pwd, $database){
    	$conn = mysqli_connect($srv,$usr,$pwd, $database);
        return $conn;
    }
	
	function our_sql_connect_no_parameters(){
		$servername = "localhost";
		$username = "root";
		$password = "";
		$db = "QUIZDB";
		$connection = our_sql_connect($servername, $username, $password, $db);
		
		if ($connection -> connect_error) {
			die ("Connection failed: " . $connection -> connect_error);
		}
		
		return $connection;
	}	
	
	function check_user_exist($firstName, $lastName, $email, $phoneNumber, $address){
		$connection = our_sql_connect_no_parameters();
		
		$userQuery = "SELECT * FROM USER WHERE email = '$email'";
		$userResultSet = mysqli_query($connection, $userQuery);
		if(mysqli_num_rows($userResultSet)==0){
			$insertUserQuery = "INSERT INTO user ( FirstName, LastName, Email, Address, PhoneNumber) 
				VALUES ('$firstName', '$lastName', '$email', '$address', '$phoneNumber')";
				
			$isInserted = mysqli_query ($connection, $insertUserQuery);
			return 0;
		}
		else{
			$userRow = mysqli_fetch_array($userResultSet);
			return $userRow["topscore"];
		}
	}
		
	function update_score($score, $user){
		$connection = our_sql_connect_no_parameters();
		$updateScoreQuery = "UPDATE user SET topscore='$score' WHERE firstname='$user'";
		$isUpdated = mysqli_query ($connection, $updateScoreQuery);
		return $isUpdated;
	}
		
			

?>