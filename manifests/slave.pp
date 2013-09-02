# === Parameters
#
# [*slave*]
#   Location of slave
#
# [*display_name*]
#   Name of the slave
#
# [*color*]
#   Color of this slave
#
define smokeping::slave(
    $location,
    $display_name,
    $color,
) {

  File {
    owner   => root,
    group   => root,
    mode    => '0644',
  }

  $random_value = fqdn_rand(1000000)
  file { $smokeping::shared_secret:
      mode    => '0600',
      owner   => smokeping,
      group   => smokeping,
      content => $random_value,
  }
  @@concat::fragment { "${::hostname}-secret":
      target  => $smokeping::slave_secrets,
      order   => 10,
      content => "${smokeping::slave_name}:${random_value}\n",
      tag     => 'smokeping-slave-secret',
  }

  $filename = "${smokeping::slave_dir}/${::hostname}"
  @@file { $filename:
      content => template('smokeping/slave.erb'),
      tag     => 'smokeping-slave',
  }

  @@concat::fragment { $name:
      order   => 20,
      target  => '/etc/smokeping/config.d/Slaves',
      content => "@include ${filename}\n",
      tag     => 'smokeping-slave',
  }

}
