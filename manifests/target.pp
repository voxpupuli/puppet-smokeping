# @summary SmokePing target
#
# @param pagetitle
#   Title. If empty, menu will be used as Title
#
# @param menu
#   Menu name.
#
# @param hierarchy_level
#   Level of this target on the menu hierarchy.
#
# @param hierarchy_parent
#   If hierarchy_level > 1, this specifies the parent.
#
# @param probe
#   Which probe to use.
#
# @param host
#   Target host name/IP.
#
# @param alerts
#   Array of Alerts to apply to this target
#
# @param slaves
#   Array of slaves on which to run this target
#
# @param nomasterpoll
#   Disable data-polling from master
#
# @param remark
#   Remark displayed on Website
define smokeping::target (
  Optional[String[1]] $pagetitle        = undef,
  Optional[String[1]] $menu             = undef,
  Optional[String[1]] $hierarchy_parent = undef,
  Optional[String[1]] $probe            = undef,
  Optional[String[1]] $host             = undef,
  Optional[String[1]] $remark           = undef,
  Integer $hierarchy_level = 1,
  Array $alerts            = [],
  Array $slaves            = [],
  Boolean $nomasterpoll    = false,
  Hash $options            = {},
) {
  assert_type(Pattern[/^[-_0-9a-zA-Z]+$/], $name)

  $filename = "${smokeping::targets_dir}/${hierarchy_level}-${name}"
  concat { $filename:
    owner   => root,
    group   => root,
    mode    => '0644',
    require => File[$smokeping::targets_dir],
    notify  => Class['smokeping::service'],
  }
  concat::fragment { "target-definition-${hierarchy_level}-${name}":
    target  => $filename,
    order   => 10,
    content => template('smokeping/target.erb'),
  }

  # Top level
  if $hierarchy_level == 1 {
    concat::fragment { "target-${hierarchy_level}-${name}":
      target  => '/etc/smokeping/config.d/Targets',
      order   => '11',
      content => "@include ${filename}\n",
    }
  } else {
    #all other levels
    unless $hierarchy_parent {
      fail('hierarchy_parent has to be specified for levels > 1')
    }
    $parent_level = $hierarchy_level - 1
    $parent_filename = "${smokeping::targets_dir}/${parent_level}-${hierarchy_parent}"
    concat::fragment { "target-${parent_level}-${hierarchy_parent}-${name}":
      target  => $parent_filename,
      order   => '11',
      content => "@include ${filename}\n",
    }
  }
}
