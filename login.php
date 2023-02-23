<!DOCTYPE html>
<html lang="en">
<head>
  	<meta charset="UTF-8">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1.0">
  	<title>login</title>
</head>
<?php

$host = "localhost";
$user = "root";
$pass = "";
$db = "consorzio";

$conn= new mysqli ($host, $user, $pass,$db) or die ("<br>Connessione non riuscita " . $conn->connect_error . " " . $conn->connect_errno);
$displaySignIn = "none";
$displayLogin = "visible";
if(isset($_POST["signIn"]))
	{
		$displaySignIn = "visible";
		$displayLogin = "none";
	}
	if(!empty($_POST["nome"]) )
	{
		session_start();
		$nome = $_POST["nome"];
		$titolare = $_POST["titolare"];
		$indirizzo = $_POST["indirizzo"];
		$localita = $_POST["localita"];
		$telefono = $_POST["telefono"];
		$mail = $_POST["mail"];
		$latitudine = $_POST["latitudine"];
		$longitudine = $_POST["longitudine"];
		$idProvincia = $_POST["provincia"];
		$password = $_POST["password"];
		$insertInto = "INSERT INTO caseifici (nome,titolare,indirizzo,località,telefono,mail,latitudine,longitudine,codprovincia,psw) VALUES ('$nome', '$titolare', '$indirizzo', '$localita', '$telefono','$mail','$latitudine','$longitudine','$idProvincia','$password');";
		if ($conn->query($insertInto) === TRUE) {

			echo "Registrazione effetuata fai il login per entrare";
			$displaySignIn = "none";
			$displayLogin = "visible";
			
		} else {
			echo "Error: " . $insertInto . "<br>" . $conn->error;
			
		}
	}


?>

<body>

		
		
	<div class="login" style="display:<?php echo $displayLogin ?>">
		<form action="login.php" method="post">
			<label for="username">Nome:</label>
				<input type="text" name="username" id="username" placeholder="Inserisci nome o mail">
				<br>
			<label for="password">Password:</label>
				<input type="password" name="password" id="password" placeholder="Password">
				<br>
			<input type="submit" value="login">
		</form>
		<form action="login.php" method="post">
			<input type="submit" name = "signIn" value="Sign in">
		</form>
		<br>
		<a href="index.php.php">Home </a>
	</div>
	<div class="signIn" style="display:<?php echo $displaySignIn ?>">
		<form action="login.php" method="post">
			<label for="nome">Nome caseificio:</label>
				<input type="text" name="nome" id="nome">
				<br>
			<label for="titolare">titolare:</label>
				<input type="text" name="titolare" id="titolare">
				<br>
			<label for="mail">mail:</label>
				<input type="mail" name="mail" id="mail">
				<br>
			<label for="password">Password:</label>
				<input type="password" name="password" id="password">
				<br>
			<label for="indirizzo">indirizzo:</label>
				<input type="text" name="indirizzo" id="indirizzo">
				<br>
			<label for="localita">localita:</label>
				<input type="text" name="localita" id="localita">
				<br>
			<label for="provincia">Provincia:</label>
				<select name="provincia" id="provincia" required>
					<option value="">Inserisci una provincia</option>
					<?php

						$querry = "select nome, sigla, codice from province";
						$result = $conn->query($querry) or die("fail");
						while ($row = $result->fetch_assoc())
						{
							echo "<option value=" . $row["codice"].  ">" . $row["nome"] ."(".$row["sigla"]. ")".  "</option>";
						}

					?>
				</select>
				<br>
			<label for="telefono">telefono:</label>
				<input type="text" name="telefono" id="telefono">
				<br>
			<label for="latitudine">latitudine:</label>
				<input type="number" name="latitudine" id="latitudine" step=any>
				<br>
			<label for="longitudine">longitudine:</label>
			<input type="number" name="longitudine" id="longitudine" step=any>
				<br>
				<input type="submit" value="sign in">
		</form>

		

	</div>

	<?php
		if(!empty($_POST["username"]) ){
			session_start();
			$userInput = $_POST["username"];
			$password = $_POST["password"];

			$query = "SELECT nome FROM caseifici WHERE (nome = '$userInput' OR mail = '$userInput') AND psw='$password'";
			$result = $conn->query($query) or die("<br>Error: " . $query . "<br>" . $conn->error);

			
			if ($result->num_rows > 0)
			{
				$_SESSION["nome"] = $userInput;
				header("location: caseificioAdmin.php");
			} 
			else
			{
				echo "nome / mail o password errati";
			}
		}

		
    ?>
	

	
	
</body>
<?php
	$conn->close() or die ("<br>Chiusura connessione fallita " . $conn->error . " ". $conn->errno);
?>
</html>