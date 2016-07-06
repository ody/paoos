application api_db (
  $cluster,
  $databases,
) {
  paoos::mysql_host{ $cluster:
    export => Sql_host[$cluster],
  }
  each($databases) |$d| {
    paoos::database { $d:
      user     => hiera("paoos::database::user::${d}"),
      password => hiera("paoos::database::passwd::${d}"),
      consume  => Sql_host[$cluster],
      export   => Database["${name}::${d}"]
    }
  }
}

