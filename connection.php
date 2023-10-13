<?php

function Connect()
{
	$dbhost = "us-cdbr-east-06.cleardb.net";
	$dbuser = "be2d290de4e5b0";
	$dbpass = "5a51f367";
	$dbname = "heroku_2e0d3617f5a68cb";

	//Create Connection
	$conn = new mysqli($dbhost, $dbuser, $dbpass, $dbname) or die($conn->connect_error);

	return $conn;
}
?>