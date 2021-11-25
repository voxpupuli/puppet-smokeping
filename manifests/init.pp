# @summary Manage SmokePing
#
# @param mode
#   SmokePing mode: master, slave, or standalone
#
# @param master_url
#   URL to master cgi for slave mode
#
# @param shared_secret
#   Path to slavesecrets file
#
# @param slave_secrets
#   Path to smokeping_secrets file
#
# @param slave_name
#   Name of slave. Only used in slave mode
#
# @param slave_dir
#   Path to slave definitions on master
#
# @param slave_location
#   Location of slave
#
# @param slave_display_name
#   Name of slave, displayed on Webpage
#
# @param slave_color
#   Color of slave in the graph
#
# @param master_name
#   Name of the master, in case of more than one SmokePing Master/Slave
#
# @param owner
#   Owner of this SmokePing instance
#
# @param contact
#   Contact E-Mail of this SmokePing instance
#
# @param mailhost
#   Where to send mails to
#
# @param cgiurl
#   URL of SmokePing CGI
#
# @param syslogfacility
#   Syslog Facility
#
# @param probes
#   Probe definitions as Array of Hashes
#
# @param default_probe
#   Default Probe
#
# @param alerts_to
#   E-Mail address or tool to send Alerts to
#
# @param alerts_from
#   Sender E-Mail of Alerts
#
# @param alerts
#   Alert definitions as Array of Hashes
#
# @param cgi_remark_top
#   Remark on Website
#
# @param cgi_title_top
#   Title on Website
#
# @param targets_dir
#   Where to save target definitions
#
# @param targets
#   Target definitions as a Hash of Smokeping::Target
#
# @param daemon_user
#   User to run SmokePing
#
# @param daemon_group
#   Group of SmokePing
#
# @param path_sendmail
#   Path to sendmail binary
#
# @param webserver_user
#   User of webserver, owner of image-files
#
# @param webserver_group
#   Group of webserver
#
# @param path_imgcache
#   Path to image cache dir
#
# @param path_imgurl
#   URL path to images for CGI
#
# @param path_datadir
#   Path to smokeping data
#
# @param path_piddir
#   Path to PID file
#
# @param path_smokemail
#   Path to smokemail binary
#
# @param path_tmail
#   Path to tmail binary
#
# @param version
#   Version which should be installed
#
# @param enable
#   Should the service be enabled during boot time?
#
# @param start
#   Should the service be started by Puppet?
#
# @param manage_apache
#   Should we manage the Apache config with puppetlabs/apache?
#
# @param manage_firewall
#   Should we manage a firewall rule for Smokeping with puppetlabs/firewall?
#
# @param manage_selinux
#   Should we load an SELinux policy to allow Smokeping to work on Red Hat distros?
class smokeping (
  $mode               = $smokeping::params::mode,
  $master_url         = $smokeping::params::master_url,
  $shared_secret      = $smokeping::params::shared_secret,
  $slave_secrets      = $smokeping::params::slave_secrets,
  $slave_name         = $smokeping::params::slave_name,
  $slave_dir          = $smokeping::params::slave_dir,
  $slave_location     = $smokeping::params::slave_location,
  $slave_display_name = $smokeping::params::slave_display_name,
  $slave_color        = $smokeping::params::slave_color,
  $webserver_user     = $smokeping::params::webserver_user,
  $webserver_group    = $smokeping::params::webserver_group,
  $package_perldoc    = $smokeping::params::package_perldoc,
  $master_name        = $smokeping::params::master_name,
  $owner              = $smokeping::params::owner,
  $contact            = $smokeping::params::contact,
  $mailhost           = $smokeping::params::mailhost,
  $cgiurl             = $smokeping::params::cgiurl,
  $syslogfacility     = $smokeping::params::syslogfacility,
  $syslogpriority     = $smokeping::params::syslogpriority,
  $probes             = $smokeping::params::probes,
  $default_probe      = $smokeping::params::default_probe,
  $alerts_to          = $smokeping::params::alerts_to,
  $alerts_from        = $smokeping::params::alerts_from,
  $alerts             = $smokeping::params::alerts,
  $cgi_remark_top     = $smokeping::params::cgi_remark_top,
  $cgi_title_top      = $smokeping::params::cgi_title_top,
  $targets_dir        = $smokeping::params::targets_dir,
  $targets            = $smokeping::params::targets,
  $daemon_user        = $smokeping::params::daemon_user,
  $daemon_group       = $smokeping::params::daemon_group,
  $path_sendmail      = $smokeping::params::path_sendmail,
  $path_imgcache      = $smokeping::params::path_imgcache,
  $path_imgurl        = $smokeping::params::path_imgurl,
  $path_datadir       = $smokeping::params::path_datadir,
  $path_piddir        = $smokeping::params::path_piddir,
  $path_smokemail     = $smokeping::params::path_smokemail,
  $path_tmail         = $smokeping::params::path_tmail,
  $version            = $smokeping::params::version,
  $enable             = $smokeping::params::enable,
  $start              = $smokeping::params::start,
  $manage_apache      = $smokeping::params::manage_apache,
  $manage_firewall    = $smokeping::params::manage_firewall,
  $manage_selinux     = $smokeping::params::manage_selinux,
  $servername         = $smokeping::params::servername,
)  inherits smokeping::params {
  if $manage_apache {
    include smokeping::apache
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
    if $facts['os']['family'] == 'RedHat' {
      selinux::module { 'local_smokeping':
        ensure    => 'present',
        source_te => 'puppet:///modules/smokeping/local_smokeping.te',
      }
    }
  }

  contain smokeping::install
  contain smokeping::config
  contain smokeping::service

  Class['smokeping::install']
  -> Class['smokeping::config']
  ~> Class['smokeping::service']
}
