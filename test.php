<?php

if(isset($_GET["on"])) {
$message = funzioneON();
}

if(isset($_GET["off"])) {
$message = funzioneOFF();
}

function funzioneON(){
echo "Tasto ON Premuto!!!";
$message= "Il tasto ON è stato premuto!.";
return($message);
}

function funzioneOFF(){
echo "Tasto OFF Premuto!!!";
$message="Il tasto OFF è stato premuto!.";
return($message);
}

?>

<html>
<body>
<form action="test.php" method="get">
<input type="submit" name="on" value="on">
<input type="submit" name="off" value="off">
<input type="text" name="txt" value="<?php if(isset($message)){ echo $message;}?>" >
</form>
</body>
</html>