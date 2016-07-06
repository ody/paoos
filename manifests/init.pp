application db_host (

) {
  paoos::mysql_host{ $name:
    export => Sql_host[$name],
  }
}

application database (
  $user,
  $password,
  $db_host
) {
  paoos::database { $name:
    user     => $user,
    password => $password,
    consume  => Sql_host[$sql_host],
    export   => Database[$name]
  }
}

