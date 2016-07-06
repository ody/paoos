application api_db (
  $user,
  $password,
  $cluster,
) {
  paoos::mysql_host{ $cluster:
    export => Sql_host[$cluster],
  }
  paoos::database { $name:
    user     => $user,
    password => $password,
    consume  => Sql_host[$cluster],
    export   => Database[$name]
  }
}

