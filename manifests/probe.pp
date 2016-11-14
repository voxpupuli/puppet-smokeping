# === Parameters
# [*pagetitle*]
#   Title. If empty, menu will be used as Title
#
# [*menu*]
#   Menu name.
#
# [*hierarchy_level*]
#   Level of this target on the menu hierarchy. (Default: 1)
#
# [*hierarchy_parent*]
#   If hierarchy_level > 1, this specifies the parent
#
# [*probe*]
#   Which probe to use.
#
# [*host*]
#   Target host name/IP.
#
# [*alerts*]
#   Array of Alerts to apply to this target
#
# [*slaves*]
#   Array of slaves on which to run this target
#
# [*nomasterpoll*]
#   Disable data-polling from master
#
# [*remark*]
#   Remark displayed on Website
#
define smokeping::probe (
    $parent = '',
    $binary = '',
    $pings = '20',
    $offet = '0%',
    $step = '300',
    $options = {},
) {
    validate_re( $name, '^[-_0-9a-zA-Z]+$', 'There is a very limited syntax permitted for target names (/[-_0-9a-zA-Z]+/)')

    $filename = "${smokeping::probes_dir}/${name}"
    concat { $filename:
        owner   => root,
        group   => root,
        mode    => '0644',
        require => File[$::smokeping::probes_dir],
        notify  => Class['smokeping::service'],
    }
    concat::fragment { "probe-definition-${name}":
        target  => $filename,
        order   => 10,
        content => template('smokeping/probe.erb'),
    }

		## Workaround for subprobes under FPing. A subprobe under 'Fping'
    ## called 'FPing' is required. 
    if $name == 'FPing' {
				  	file { "${smokeping::probes_dir}/FPing__subprobe-workaround":
				  			mode    => '0600',
				  			owner   => $smokeping::daemon_user,
				  			group   => $smokeping::daemon_group,
				  			content => '++ FPing',
						}
						concat::fragment { "probe-subprobe-workaround":
								target  => "${smokeping::probes_dir}/FPing",
								order   => '11',
								content => "@include ${smokeping::probes_dir}/FPing__subprobe-workaround\n",
						}
    }

    # Top level
    if $parent == '' {
        concat::fragment { "probe-${name}":
            target  => '/etc/smokeping/config.d/Probes',
            order   => '11',
            content => "@include ${filename}\n",
        }
        } else {
            #all other levels
            $parent_filename = "${smokeping::probes_dir}/${parent}"
            concat::fragment { "probe-${parent}-${name}":
                target  => $parent_filename,
                order   => '12',
                content => "@include ${filename}\n",
            }
        }
}
