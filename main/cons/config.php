<?php 
    $dbhost = "localhost";
    $dbuser = "root";
    $dbpass = "";
    $dbname = "shinn_kya_mal";

    $conn = mysqli_connect($dbhost,$dbuser, $dbpass);

    mysqli_select_db($conn, $dbname);

?>