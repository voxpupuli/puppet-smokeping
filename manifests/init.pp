# == Class: smokeping
#
# A module to manage smokeping
#
# === Parameters
# [*mode*]
#   SmokePing mode: master or slave or standalone (Default: master)
#
# [*master_url*]
#   URL to master cgi for slave mode (Default: http://somewhere/cgi-bin/smokeping.cgi)
#
# [*shared_secret*]
#   Path to slavesecrets file (Default: /etc/smokeping/slavesecrets.conf)
#
# [*slave_secrets*]
#   Path to smokeping_secrets file (Default: /etc/smokeping/smokeping_secrets)
#
# [*slave_name*]
#   Name of slave. Only used in slave mode (Default: slave1)
#
# [*slave_dir*]
#   Path to slave definitions on master (Default: /etc/smokeping/config.d/slaves.d)
#
# [*slave_location*]
#   Location of slave (Default: '')
#
# [*slave_display_name*]
#   Name of slave, displayed on Webpage (Default: '')
#
# [*slave_color*]
#   Color of slave in the graph (Default: '')
#
# [*master_name*]
#   Name of the master, in case of more than one SmokePing Master/Slave (Default: default)
#
# [*owner*]
#   Owner of this SmokePing instance (Default: Peter Random)
#
# [*contact*]
#   Contact E-Mail of this SmokePing instance (Default: some@address.nowhere)
#
# [*mailhost*]
#   Where to send mails to (Default: my.mail.host)
#
# [*cgiurl*]
#   URL of SmokePing CGI (Default: http://some.url/smokeping.cgi)
#
# [*syslogfacility*]
#   Syslog Facility (Default: local0)
#
# [*probes*]
#   Probe definitions as Array of Hashes (Default: { name => 'FPing', binary => '/usr/bin/fping' })
#
# [*default_probe*]
#   Default Probe (Default: FPing)
#
# [*alerts_to*]
#   E-Mail address or tool to send Alerts to (Default: alertee@address.somewhere)
#
# [*alerts_from*]
#   Sender E-Mail of Alerts (Default: smokealert@company.xy)
#
# [*alerts*]
#   Alert definitions as Array of Hashes (Default:
#   { name          => 'someloss',
#     alert_type    => 'loss',
#     pattern       => '>0%,*12*,>0%,*12*,>0%',
#     comment       => 'loss 3 times in a row' } )
#
# [*cgi_remark_top*]
#   Remark on Website (Default: Welcome to the SmokePing website of xxx Company. Here you will learn all about the latency of our network.)
#
# [*cgi_title_top*]
#   Title on Website (Default: Network Latency Grapher)
#
# [*targets_dir*]
#   Where to save target definitions (Default: /etc/smokeping/config.d/targets.d)
#
# [*targets*]
#   Target definitions as a Hash of Smokeping::Target (Default: {})
#
# [*daemon_user*]
#   User to run SmokePing (Default: smokeping)
#
# [*daemon_group*]
#   Group of SmokePing (Default: smokeping)
#
# [*path_sendmail*]
#   Path to sendmail binary (Default: /usr/sbin/sendmail)
#
# [*webserver_user*]
#   User of webserver, owner of image-files  (Default: www-data)
#
# [*webserver_group*]
#   Group of webserver (Default: www-data)
#
# [*path_imgcache*]
#   Path to image cache dir (Default: /var/cache/smokeping/images)
#
# [*path_imgurl*]
#   URL path to images for CGI (Default: ../smokeping/images)
#
# [*path_datadir*]
#   Path to smokeping data (Default: /var/lib/smokeping)
#
# [*path_piddir*]
#   Path to PID file (Default: /var/run/smokeping)
#
# [*path_smokemail*]
#   Path to smokemail binary (Default: /etc/smokeping/smokemail)
#
# [*path_tmail*]
#   Path to tmail binary (Default: /etc/smokeping/tmail)
#
# [*version*]
#   Version which should be installed (Default: present)
#
# [*enable*]
#   Should the service be enabled during boot time? (Default: true)
#
# [*start*]
#   Should the service be started by Puppet? (Default: true)
# [*smanage_apache*]
#   Should we manage the Apache config with puppetlabs/apache? (Default: false)
#
# [*smanage_firewall*]
#   Should we manage a firewall rule for Smokeping with puppetlabs/firewall? (Default: false)
#
# [*smanage_selinux*]
#   Should we load an SELinux policy to allow Smokeping to work on Red Hat distros? (Default: false)
#
# === Author
#
# Tobias Brunner <tobias.brunner@nine.ch>
#
class smokeping(
  $mode               = $::smokeping::params::mode,
  $master_url         = $::smokeping::params::master_url,
  $shared_secret      = $::smokeping::params::shared_secret,
  $slave_secrets      = $::smokeping::params::slave_secrets,
  $slave_name         = $::smokeping::params::slave_name,
  $slave_dir          = $::smokeping::params::slave_dir,
  $slave_location     = $::smokeping::params::slave_location,
  $slave_display_name = $::smokeping::params::slave_display_name,
  $slave_color        = $::smokeping::params::slave_color,
  $webserver_user     = $::smokeping::params::webserver_user,
  $webserver_group    = $::smokeping::params::webserver_group,
  $master_name        = $::smokeping::params::master_name,
  $owner              = $::smokeping::params::owner,
  $contact            = $::smokeping::params::contact,
  $mailhost           = $::smokeping::params::mailhost,
  $cgiurl             = $::smokeping::params::cgiurl,
  $syslogfacility     = $::smokeping::params::syslogfacility,
  $syslogpriority     = $::smokeping::params::syslogpriority,
  $probes             = $::smokeping::params::probes,
  $default_probe      = $::smokeping::params::default_probe,
  $alerts_to          = $::smokeping::params::alerts_to,
  $alerts_from        = $::smokeping::params::alerts_from,
  $alerts             = $::smokeping::params::alerts,
  $cgi_remark_top     = $::smokeping::params::cgi_remark_top,
  $cgi_title_top      = $::smokeping::params::cgi_title_top,
  $targets_dir        = $::smokeping::params::targets_dir,
  $targets            = $::smokeping::params::targets,
  $daemon_user        = $::smokeping::params::daemon_user,
  $daemon_group       = $::smokeping::params::daemon_group,
  $path_sendmail      = $::smokeping::params::path_sendmail,
  $path_imgcache      = $::smokeping::params::path_imgcache,
  $path_imgurl        = $::smokeping::params::path_imgurl,
  $path_datadir       = $::smokeping::params::path_datadir,
  $path_piddir        = $::smokeping::params::path_piddir,
  $path_smokemail     = $::smokeping::params::path_smokemail,
  $path_tmail         = $::smokeping::params::path_tmail,
  $version            = $::smokeping::params::version,
  $enable             = $::smokeping::params::enable,
  $start              = $::smokeping::params::start,
  $manage_apache      = $::smokeping::params::manage_apache,
  $manage_firewall    = $::smokeping::params::manage_firewall,
  $manage_selinux     = $::smokeping::params::manage_selinux,
  $servername         = $::smokeping::params::servername,
)  inherits ::smokeping::params {

  if $manage_apache {
    include ::smokeping::apache
  }

  if $manage_firewall {
    firewall { '100-smokeping-http':
      proto  => 'tcp',
      dport  => '80',
      action => 'accept',
    }
    firewall { '100-smokeping-https':
      proto  => 'tcp',
      dport  => '443',
      action => 'accept',
    }
  }

  if $manage_selinux {
    if $::osfamily == 'RedHat' {
      selinux::module { 'local_smokeping':
        ensure => 'present',
        source => 'puppet:///modules/smokeping/local_smokeping.te',
      }
    }
  }

  contain ::smokeping::install
  contain ::smokeping::config
  contain ::smokeping::service

  Class['smokeping::install']
  -> Class['smokeping::config']
  ~> Class['smokeping::service']
}
