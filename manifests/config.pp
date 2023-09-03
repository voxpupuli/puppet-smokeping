# @summary Manage SmokePing configuration
class smokeping::config {
  assert_private()

  $mode          = $smokeping::mode
  $master_url    = $smokeping::master_url
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

  file { '/etc/smokeping/config.d':
    ensure  => directory,
    recurse => true,
    purge   => true,
    force   => true,
  }

  -> file {
    '/etc/smokeping/config':
      content => template('smokeping/config.erb');
    '/etc/smokeping/config.d/Alerts':
      content => template('smokeping/alerts.erb');
    '/etc/smokeping/config.d/Database':
      content => template('smokeping/database.erb');
    '/etc/smokeping/config.d/General':
      content => template('smokeping/general.erb');
    '/etc/smokeping/config.d/pathnames':
      content => template('smokeping/pathnames.erb');
    '/etc/smokeping/config.d/Presentation':
      content => template('smokeping/presentation.erb');
    '/etc/smokeping/config.d/Probes':
      content => template('smokeping/probes.erb');
  }

  ## mode specific
  case $mode {
    'slave': {
      smokeping::slave { $facts['networking']['hostname']:
        location     => $smokeping::slave_location,
        display_name => pick($smokeping::slave_display_name, $facts['networking']['hostname']),
        color        => pick($smokeping::slave_color, fqdn_rand(0xffffff)),
      }

      $dropin = @("EOT")
        [Service]
        ExecStart=
        ExecStart=/usr/sbin/smokeping --master-url=${smokeping::master_url} --cache-dir=${smokeping::path_datadir} --shared-secret=${smokeping::shared_secret} --pid-dir=/run/smokeping
        | EOT

      systemd::dropin_file { 'slave.conf':
        unit    => 'smokeping.service',
        content => $dropin,
      }
    }

    ## Master/Standalone configuration
    ## collect slaves if mode is master and create Targets
    ## if mode is standalone, just create targets...
    /^(master|standalone)$/: {
      if $mode == 'master' {
        # collect slaves
        File <<| tag == "smokeping-slave-${master_name}" |>>

        file { $smokeping::slave_dir:
          ensure => directory,
        }

        concat { '/etc/smokeping/config.d/Slaves':
          owner => root,
          group => root,
          mode  => '0644',
        }

        concat::fragment { 'slaves-header':
          target  => '/etc/smokeping/config.d/Slaves',
          order   => 10,
          content => "*** Slaves ***\nsecrets=${smokeping::slave_secrets}\n\n",
        }

        Concat::Fragment <<| tag == "smokeping-slave-${master_name}" |>>

        # collect shared secrets from slaves
        concat { $smokeping::slave_secrets:
          owner => $daemon_user,
          group => $webserver_group,
          mode  => '0640',
        }

        Concat::Fragment <<| tag == "smokeping-slave-secret-${master_name}" |>>
      } else {
        file { $smokeping::slave_secrets:
          ensure => file,
          owner  => $daemon_user,
          group  => $webserver_group,
          mode   => '0640',
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
        content => epp("${module_name}/targets-header.epp"),
      }

      $smokeping::targets.each |$key, $value| {
        smokeping::target { $key:
          * => $value,
        }
      }
    }

    default: {
      fail("mode ${mode} unknown")
    }
  }
}
