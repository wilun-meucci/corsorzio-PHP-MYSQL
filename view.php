<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>view</title>
</head>
<?php

$host = "localhost";
$user = "root";
$pass = "";
$db = "consorzio";

$conn= new mysqli ($host, $user, $pass,$db) or die ("<br>Connessione non riuscita " . $conn->connect_error . " " . $conn->connect_errno);
?>
<body>
<?php

$querry = "select * from caseifici";
$result = $conn->query($querry) or die("fail");
while ($row = $result->fetch_assoc())
{
    echo $row["nome"] . "<br>";
}

?>
</body>

<?php
	$conn->close() or die ("<br>Chiusura connessione fallita " . $conn->error . " ". $conn->errno);
?>
</html>