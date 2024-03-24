<?php

function Connect()
{

	mysql://hzbyv7u9q3082etp:z1i8hda7orq3sle4@gx97kbnhgjzh3efb.cbetxkdyhwsb.us-east-1.rds.amazonaws.com:3306/uk5557i9dwvpdaok
	$dbhost = "gx97kbnhgjzh3efb.cbetxkdyhwsb.us-east-1.rds.amazonaws.com";
	$dbuser = "hzbyv7u9q3082etp";
	$dbpass = "z1i8hda7orq3sle4";
	$dbname = "uk5557i9dwvpdaok";

	//Create Connection
	$conn = new mysqli($dbhost, $dbuser, $dbpass, $dbname) or die($conn->connect_error);

	return $conn;
}
?>