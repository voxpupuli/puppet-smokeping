define smokeping::target (
    $pagetitle = '',
    $menu = '',
    $hierarchy_level = 1,
    $hierarchy_parent = '',
    $probe = '',
    $host = '',
    $alerts = [],
    $slaves = [],
    $remark = '',
) {

  $filename = "${smokeping::targets_dir}/${hierarchy_level}-${name}"
  concat { $filename:
      owner => root,
      group => root,
      mode  => '0644',
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
      if $hierarchy_parent == '' {
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
