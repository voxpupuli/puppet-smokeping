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
# [*master*]
#   Name of the smokeping master, in case there are more than one. (Default: default)
#
define smokeping::slave(
    $location,
    $display_name,
    $color,
    $master = 'default',
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
  @@concat::fragment { "${::fqdn}-secret":
      target  => $smokeping::slave_secrets,
      order   => 10,
      content => "${smokeping::slave_name}:${random_value}\n",
      tag     => "smokeping-slave-secret-${master}",
  }

  $filename = "${smokeping::slave_dir}/${::fqdn}"
  @@file { $filename:
      content => template('smokeping/slave.erb'),
      tag     => "smokeping-slave-${master}",
  }

  @@concat::fragment { $name:
      order   => 20,
      target  => '/etc/smokeping/config.d/Slaves',
      content => "@include ${filename}\n",
      tag     => "smokeping-slave-${master}",
  }

}
