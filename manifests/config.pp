class smokeping::config {

    $mode          = $smokeping::mode
    $master_url    = $smokeping::master_url
    $shared_secret = $smokeping::shared_secret
    $slave_name    = $smokeping::slave_name
    $master_name   = $smokeping::master_name

    # General config
    $owner          = $smokeping::owner
    $contact        = $smokeping::contact
    $mailhost       = $smokeping::mailhost
    $cgiurl         = $smokeping::cgiurl
    $syslogfacility = $smokeping::syslogfacility
    $syslogpriority = $smokeping::syslogpriority
    $daemon_user    = $smokeping::daemon_user
    $daemon_group   = $smokeping::daemon_group

    # The owner of the image files (written by the webserver)
    $webserver_user  = $smokeping::webserver_user
    $webserver_group = $smokeping::webserver_group

    # Probes
    $probes = $smokeping::probes

    # Alerts
    $alerts_to   = $smokeping::alerts_to
    $alerts_from = $smokeping::alerts_from
    $alerts      = $smokeping::alerts

    # Targets
    $default_probe  = $smokeping::default_probe
    $cgi_remark_top = $smokeping::cgi_remark_top
    $cgi_title_top  = $smokeping::cgi_title_top

    # Pathnames
    $path_sendmail  = $smokeping::path_sendmail
    $path_imgcache  = $smokeping::path_imgcache
    $path_imgurl    = $smokeping::path_imgurl
    $path_datadir   = $smokeping::path_datadir
    $path_piddir    = $smokeping::path_piddir
    $path_smokemail = $smokeping::path_smokemail
    $path_tmail     = $smokeping::path_tmail

    File {
        owner => root,
        group => root,
        mode  => '0644',
    }

    file {
        '/etc/default/smokeping':
            content => template('smokeping/defaults.erb');
        '/etc/smokeping/config.d/General':
            content => template('smokeping/general.erb');
        '/etc/smokeping/config.d/Probes':
            content => template('smokeping/probes.erb');
        '/etc/smokeping/config.d/Alerts':
            content => template('smokeping/alerts.erb');
        '/etc/smokeping/config.d/pathnames':
            content => template('smokeping/pathnames.erb');
    }

    ## mode specific
    case $mode {
        ## Slave configuration
        'slave': {
            if $smokeping::slave_display_name == '' { $display_name = $::fqdn }
            if $smokeping::slave_color == '' { $slave_color = sprintf('%06d', fqdn_rand('999999')) }
            smokeping::slave { $::fqdn:
                location     => $smokeping::slave_location,
                display_name => $display_name,
                color        => $slave_color,
            }
            # periodic restart to pick-up new config
            #cron {
            #  'smokeping::periodic-restart':
            #    command => 'PATH=$PATH:/sbin /etc/init.d/smokeping stop >/dev/null 2>&1; sleep 2; PATH=$PATH:/sbin /etc/init.d/smokeping start >/dev/null 2>&1',
            #    user    => root,
            #    minute  => '*/15';
            #}
        }
        ## Master/Standalone configuration
        ## collect slaves if mode is master and create Targets
        ## if mode is standalone, just create targets...
        /^(master|standalone)$/: {

            if $mode =~ /^master$/ {
                # collect slaves
                File <<| tag == "smokeping-slave-${master_name}" |>>
                file { $smokeping::slave_dir: ensure => directory; }
                concat { '/etc/smokeping/config.d/Slaves':
                    owner => root,
                    group => root,
                    mode  => '0644',
                }
                concat::fragment { 'slaves-header':
                    target  => '/etc/smokeping/config.d/Slaves',
                    order   => 10,
                    content => "*** Slaves ***\nsecrets=${smokeping::slave_secrets}\n\n"
                }
                Concat::Fragment <<| tag == "smokeping-slave-${master_name}" |>>

                # collect shared secrets from slaves
                concat { $smokeping::slave_secrets:
                    owner => smokeping,
                    group => $webserver_group,
                    mode  => '0640',
                }
                Concat::Fragment <<| tag == "smokeping-slave-secret-${master_name}" |>>
            } else {
                # ensure $smokeping::slave_secret is there
                file {
                    $smokeping::slave_secrets:
                        ensure => present,
                        owner  => smokeping,
                        group  => $webserver_group,
                        mode   => '0640';
                }
            }

            # create target definitions
            file { $smokeping::targets_dir:
                ensure  => directory,
                recurse => true,
                purge   => true,
                force   => true,
            }
            concat { '/etc/smokeping/config.d/Targets':
                owner => root,
                group => root,
                mode  => '0644',
            }
            concat::fragment { 'targets-header':
                target  => '/etc/smokeping/config.d/Targets',
                order   => 10,
                content => template('smokeping/targets-header.erb'),
            }
        }
        default: { fail("mode ${mode} unknown") }
    }

}
