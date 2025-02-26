# @summary SmokePing slave
#
# @param location
#   Location of slave
#
# @param display_name
#   Name of the slave
#
# @param color
#   Color of this slave
#
# @param master
#   Name of the smokeping master, in case there are more than one.
define smokeping::slave (
  String[1] $display_name,
  Integer[0] $color,
  Optional[String[1]] $location = undef,
  $master = 'default',
) {
  File {
    owner => root,
    group => root,
    mode  => '0644',
  }

  $random_value = stdlib::fqdn_rand_string(60)

  file { $smokeping::shared_secret:
    mode    => '0600',
    owner   => $smokeping::daemon_user,
    group   => $smokeping::daemon_group,
    content => $random_value,
  }

  @@concat::fragment { "${facts['networking']['fqdn']}-secret":
    target  => $smokeping::slave_secrets,
    order   => 10,
    content => "${facts['networking']['hostname']}:${random_value}\n",
    tag     => "smokeping-slave-secret-${master}",
  }

  $filename = "${smokeping::slave_dir}/${facts['networking']['fqdn']}"

  @@file { $filename:
    content => epp("${module_name}/slave.epp",
      {
        'slave_name'   => $title,
        'display_name' => $display_name,
        'color'        => $color,
        'location'     => $location,
      }
    ),
    tag     => "smokeping-slave-${master}",
  }

  @@concat::fragment { $name:
    order   => 20,
    target  => '/etc/smokeping/config.d/Slaves',
    content => "@include ${filename}\n",
    tag     => "smokeping-slave-${master}",
  }
}
