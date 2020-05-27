<?php 
require 'connect.php';

$first_name = $_REQUEST['first_name'];
$last_name = $_REQUEST['last_name'];
$email = $_REQUEST['email'];

$insert_sql = "INSERT INTO testing (first_name, last_name, email)" .
"VALUES('{$first_name}', '{$last_name}', '{$email}');";
mysql_query($insert_sql);
?>
