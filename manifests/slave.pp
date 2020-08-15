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
define smokeping::slave (
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

  $random_value = fqdn_rand_string(60, 'abcdefghjkelmnopqrstuvwxyaABCDEFGHJKELMNOPQRSTUVWXYA0123456789')
  file { $smokeping::shared_secret:
    mode    => '0600',
    owner   => $smokeping::daemon_user,
    group   => $smokeping::daemon_group,
    content => $random_value,
  }
  @@concat::fragment { "${facts['networking']['fqdn']}-secret":
    target  => $smokeping::slave_secrets,
    order   => 10,
    content => "${facts['networking']['fqdn']}:${random_value}\n",
    tag     => "smokeping-slave-secret-${master}",
  }

  $filename = "${smokeping::slave_dir}/${facts['networking']['fqdn']}"
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
