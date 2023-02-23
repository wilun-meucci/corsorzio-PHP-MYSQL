<!DOCTYPE html>
<html lang="en">
<?php

$host = "localhost";
$user = "root";
$pass = "";
$db = "consorzio";

$conn= new mysqli ($host, $user, $pass,$db) or die ("<br>Connessione non riuscita " . $conn->connect_error . " " . $conn->connect_errno);
session_start();

$userInput = $_SESSION["nome"];
$queryCaseificio = "SELECT *  FROM caseifici WHERE nome = '$userInput' OR mail = '$userInput'"; 
$resultCaseificio = $conn->query($queryCaseificio) or die("<br>Error: " . $queryCaseificio . "<br>" . $conn->error);
$arrayCaseificio = $resultCaseificio->fetch_assoc();

$nome = $arrayCaseificio["nome"];
$titolare = $arrayCaseificio["titolare"];
$indirizzo = $arrayCaseificio["indirizzo"];
$localita = $arrayCaseificio["località"];
$telefono = $arrayCaseificio["telefono"];
$mail = $arrayCaseificio["mail"];
$latitudine = $arrayCaseificio["latitudine"];
$longitudine = $arrayCaseificio["longitudine"];
$codProvincia = $arrayCaseificio["codprovincia"];
/*
echo "nome: $nome <br>
titolare: $titolare <br>
indirizzo: $indirizzo <br>
localita: $localita <br>
telefono: $telefono <br>
mail: $mail <br>
latitudine: $latitudine <br>
longitudine: $longitudine <br>
codProvincia: $codProvincia <br>"
*/
?>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Caseificio-<?php echo $nome?></title>
</head>
<body>
ciao
</body>
</html>