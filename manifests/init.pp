application paoos::openstack_component(

) {
  paoos::db{$name:
    export => Sql["openstack-${name}"],
  }

  paoos::amqp{$name:
    export => Amqp["openstack-${name}"],
  }

  paoos::app{$name:
    export  => Http["openstack-${name}"],
    consume => Sql["openstack-${name}"],
    # does consume implicit require?
  }
}

define paoos::db (
  $user = 'root',
  $password = 'root',
  $host = $::hostname,
  $database = $name,
  $port = 3306
) {
  notify("Configuring database ${name}")
}

Paoos::Db produces Sql {
  user     => $user,
  password => $password,
  host     => $host,
  database => $database,
  port     => $port,
}

define paoos::amqp (
  $user = $name,
  $password = 'amqp',
  $virtual_host = $name,
  $host = $::hostname,
  $port = 5672,
) {
  notify("Configuring amqp ${name}")
}

Paoos::Amqp produces Amqp {
  user         => $user,
  password     => $password,
  host         => $host,
  virtual_host => $virtual_host,
  port         => $port,
}

define paoos::app(
  $user = $name,
  $port = 80,
) {
  notify("Configuring app ${name}")
}

Paoos::App consumes Amqp {
  user         => $user,
  password     => $password,
  host         => $host,
  virtual_host => $virtual_host,
  port         => $port,
}

Paoos::App consumes Sql {
  user      => $user,
  password  => $password,
  host      => $host,
  port      => $port,
  database  => $database,
}

Paoos::App produces Http {
  user => $user,
  port => $port,
}
