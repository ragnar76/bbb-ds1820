<?php

	# ein paar definitionen
	$heute = date("d-m-Y");
        $jetzt = date("H:m");

	$dbhost = 'localhost';
        $dbuser = 'db-user';
        $dbpass = 'db-pass';
        $conn = mysql_connect($dbhost, $dbuser, $dbpass);


	# read curr. temp. from inside
	$buffer_in = file_get_contents('/sys/devices/w1_bus_master1/10-000802bc2761/w1_slave');
	$string_to_search = 't=';
	$pos = strpos($buffer_in, $string_to_search);
	$buffer_in = substr($buffer_in, $pos + strlen($string_to_search))/1000;

	# read curr. temp deom outside
	$buffer_out = file_get_contents('/sys/devices/w1_bus_master1/10-000802bc1696/w1_slave');
	$string_to_search = 't=';
	$pos = strpos($buffer_out, $string_to_search);
	$buffer_out = substr($buffer_out, $pos + strlen($string_to_search))/1000;


	$heute = date("d-m-Y");
	$jetzt = date("H:m");

	if(! $conn )
	{
		die('Could not connect: ' . mysql_error());
	}
	$sql = "INSERT INTO werte (datum, uhrzeit, temp_innen, temp_aussen) VALUES ( CURDATE(), CURTIME(), $buffer_in, $buffer_out)";

	mysql_select_db('temperatur');
	$retval = mysql_query( $sql, $conn );
	if(! $retval )
	{
		die('Could not enter data: ' . mysql_error());
	}
	echo "Entered data successfully\n";
	mysql_close($conn);
?>
