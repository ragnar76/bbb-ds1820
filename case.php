<?php
define ("DB_USER", "root");
define ("DB_PASS", "EePhe5Ai");
define ("DB_SERV", "localhost");
define ("DB_NAME", "temperatur");


function get_temp()
{
	# read curr. temp. from inside
	# $buffer_in = file_get_contents('/sys/devices/w1_bus_master1/10-000802bc2761/w1_slave');
	$buffer_in = file_get_contents('dummy.txt');
	$string_to_search = 't=';
	$pos = strpos($buffer_in, $string_to_search);
	$buffer_in = substr($buffer_in, $pos + strlen($string_to_search))/1000;


	# read curr. temp from outside
	# $buffer_out = file_get_contents('/sys/devices/w1_bus_master1/10-000802bc1696/w1_slave');
	$buffer_out = file_get_contents('dummy.txt');
	$string_to_search = 't=';
	$pos = strpos($buffer_out, $string_to_search);
	$buffer_out = substr($buffer_out, $pos + strlen($string_to_search))/1000;

	return array($buffer_out, $buffer_in);
}

function sql_read()
{
	$db_handle = mysql_connect(DB_SERV, DB_USER, DB_PASS);
	$db_found = mysql_select_db(DB_NAME, $db_handle);

	if ($db_found) {
		$SQL = "SELECT * FROM werte";
		$result = mysql_query($SQL);

		while ( $db_field = mysql_fetch_assoc($result) ) {
			print $db_field['datum'] . " ";
			print $db_field['uhrzeit'] . " ";
			print $db_field['temp_innen'] . " ";
			print $db_field['temp_aussen'] . "<br>";
		}

		mysql_close($db_handle);
	}
	else {
		print "Database NOT Found ";
		mysql_close($db_handle);

	}
}

function sql_write()
{
	# ein paar definitionen
	$heute = date("d-m-Y");
        $jetzt = date("H:m");

        $conn = mysql_connect(DB_SERV, DB_USER, DB_PASS);

	$heute = date("d-m-Y");
	$jetzt = date("H:m");

	if(! $conn )
	{
		die('Could not connect: ' . mysql_error());
	}
	$buffer_a = get_temp();
	$sql = "INSERT INTO werte (datum, uhrzeit, temp_innen, temp_aussen) VALUES ( CURDATE(), CURTIME(), ".$buffer_a[0].", ".$buffer_a[1].")";

	mysql_select_db('temperatur');
	$retval = mysql_query( $sql, $conn );
	if(! $retval )
	{
		die('Could not enter data: ' . mysql_error());
	}
	echo "$sql Entered into data successfully\n";
	mysql_close($conn);
}

function graph()
{
	echo "show graph";
}

	$page = '';


	if(isset($_REQUEST["page"])) {
		$page = $_REQUEST["page"];
	}

	switch ($page) {
	case "read":
		sql_read();
		break;
	case "write":
		sql_write();
		break;
	case "graph":
		graph();
		break;
	default:
		$buffer_a = get_temp();
		echo "Current Temperature: $buffer_a[0] $buffer_a[1]";
	}
?>
