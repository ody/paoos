define paoos::database
(
  $user,
  $password,
  $host = $::hostname,
  $database = $name,
) {
  notify ( "configured ${name} osmar::database")
}

Paoos::Database consumes Sql_host {
  host => $host,
}

Paoos::Database produces Database {
  user     => $user,
  password => $password,
  host     => $host,
  database => $database,
}

