<table border="1">
<?PHP

$user_name = "db-user";
$password = "db-pass";
$database = "temperatur";
$server = "127.0.0.1";

$db_handle = mysql_connect($server, $user_name, $password);
$db_found = mysql_select_db($database, $db_handle);

if ($db_found) {

$SQL = "SELECT * FROM werte";
$result = mysql_query($SQL);

while ( $db_field = mysql_fetch_assoc($result) ) {

print "<tr><td>". $db_field['datum'] . "</td><td>";
print $db_field['uhrzeit'] . "</td><td>";
print $db_field['temp_innen'] . "</td><td>";
print $db_field['temp_aussen'] . "</td></tr>";

}

mysql_close($db_handle);

}
else {

print "Database NOT Found ";
mysql_close($db_handle);

}

?>

</table>
