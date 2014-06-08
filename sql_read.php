<?PHP

$user_name = "root";
$password = "EePhe5Ai";
$database = "temperatur";
$server = "127.0.0.1";

$db_handle = mysql_connect($server, $user_name, $password);
$db_found = mysql_select_db($database, $db_handle);

if ($db_found) {

$SQL = "SELECT * FROM werte";
$result = mysql_query($SQL);

while ( $db_field = mysql_fetch_assoc($result) ) {

print $db_field['datum'] . "&nbsp";
print $db_field['uhrzeit'] . "&nbsp";
print $db_field['temp_innen'] . "&nbsp";
print $db_field['temp_aussen'] . "<br>";

}

mysql_close($db_handle);

}
else {

print "Database NOT Found ";
mysql_close($db_handle);

}

?>
