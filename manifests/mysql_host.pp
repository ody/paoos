define paoos::mysql_host
(
  $host = $::hostname,
) {
  notify( "configured ${name} osmar::mysql_host")
}

Paoos::Mysql_host produces Sql_host {
  host => $host,
}

