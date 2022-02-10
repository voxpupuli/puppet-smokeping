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
#
# @param manage_datadir
#   Should we manage the permissions on the data directory?
class smokeping (
  Stdlib::HTTPUrl $cgiurl,
  Stdlib::HTTPUrl $master_url,
  String[1] $path_imgurl,
  String[1] $daemon_user,
  String[1] $daemon_group,
  String[1] $webserver_user,
  String[1] $webserver_group,
  String[1] $package_perldoc,
  Enum['master', 'slave', 'standalone'] $mode,
  Stdlib::Absolutepath $shared_secret = '/etc/smokeping/slavesecrets.conf',
  Stdlib::Absolutepath $slave_secrets = '/etc/smokeping/smokeping_secrets',
  String[1] $slave_name = 'slave1',
  Stdlib::Absolutepath $slave_dir = '/etc/smokeping/config.d/slaves.d',
  Optional[String[1]] $slave_location = undef,
  Optional[String[1]] $slave_display_name = undef,
  Optional[String[1]] $slave_color = undef,
  String[1] $master_name = 'default',
  String[1] $owner = 'Peter Random',
  Stdlib::Email $contact = 'root@localhost',
  Optional[Stdlib::Host] $mailhost = undef,
  Stdlib::Syslogfacility $syslogfacility = 'local0',
  String[1] $syslogpriority = 'info',
  Array[Hash] $probes = [],
  String[1] $default_probe = 'FPing',
  Stdlib::Email $alerts_to = 'root@localhost',
  Stdlib::Email $alerts_from = 'root@localhost',
  Array[Hash] $alerts = [
    {
      name        => 'someloss',
      alert_type  => 'loss',
      pattern     => '>0%,*12*,>0%,*12*,>0%',
      edgetrigger => false,
      comment     => 'loss 3 times in a row',
    },
  ],
  String[1] $cgi_remark_top = 'Welcome to the SmokePing website of xxx Company. Here you will learn all about the latency of our network.',
  String[1] $cgi_title_top = 'Network Latency Grapher',
  Stdlib::Absolutepath $targets_dir = '/etc/smokeping/config.d/targets.d',
  Hash $targets = {},
  Stdlib::Absolutepath $path_sendmail = '/usr/sbin/sendmail',
  Stdlib::Absolutepath $path_imgcache,
  Stdlib::Absolutepath $path_datadir,
  Stdlib::Absolutepath $path_piddir = '/var/run/smokeping',
  Stdlib::Absolutepath $path_smokemail = '/etc/smokeping/smokemail',
  Stdlib::Absolutepath $path_tmail = '/etc/smokeping/tmail',
  String[1] $version = 'present',
  Boolean $enable = true,
  Boolean $start = true,
  Boolean $manage_apache = false,
  Boolean $manage_firewall = false,
  Boolean $manage_selinux = false,
  Boolean $manage_datadir = true,
  Stdlib::Fqdn $servername = $facts['networking']['fqdn'],
) {
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
