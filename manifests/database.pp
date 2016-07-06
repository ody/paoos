define paoos::database(
  $user,
  $password,
  $db_host,
  $database = $name,
) {
  notify { "configured ${name} osmar::database with ${db_host}": }
}

Paoos::Database consumes Sql_host {
  db_host => $host,
}

Paoos::Database produces Database {
  user     => $user,
  password => $password,
  host     => $db_host,
  database => $database,
}

