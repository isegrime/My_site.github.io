<?php

$host='localhost';
$database='bd_metroland';
$user='admin';
$password='1234';


$link=mysqli_connect($host, $database, $user, $password)
	or die("Ошибка".mysqli_error($link));

$name=$_POST['name'];
$password=$_POST['password'];
$phone=$_POST['phone'];
$email=$_POST['email'];

$sqli="INSERT INTO users (name, password, phone, email) VALUES ('$name', '$password','$phone','$email')";
	if (mysqli_query($link, $sqli)) {
		echo "New record created successfully";
	}
	else {
		echo "Error:".$sqli."<br>".mysqli_error($link);
	}

	mysqli_close($link);

?>
