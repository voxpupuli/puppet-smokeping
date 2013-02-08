# == Class: smokeping
#
# A basic module to manage smokeping
#
# === Parameters
# [*version*]
#   Version which should be installed (Default: present)
#
# [*enable*]
#   Should the service be enabled during boot time? (Default: true)
#
# [*start*]
#   Should the service be started by Puppet? (Default: true)
#
class smokeping(
   $mode               = 'master',
   $master_url         = 'http://somewhere/cgi-bin/smokeping.cgi',
   $shared_secret      = '/etc/smokeping/slavesecrets.conf',
   $slave_secrets      = '/etc/smokeping/smokeping_secrets',
   $slave_name         = 'slave1',
   $slave_dir          = '/etc/smokeping/config.d/slaves.d',
   $slave_location     = '',
   $slave_display_name = '',
   $slave_color        = '',
   $owner              = 'Peter Random',
   $contact            = 'some@address.nowhere',
   $mailhost           = 'my.mail.host',
   $cgiurl             = 'http://some.url/smokeping.cgi',
   $syslogfacility     = 'local0',
   $syslogpriority     = 'info',
   $probes             = [ { name => 'FPing', binary => '/usr/bin/fping' } ],
   $default_probe      = 'FPing',
   $alerts_to          = 'alertee@address.somewhere',
   $alerts_from        = 'smokealert@company.xy',
   $alerts             = [ {
       name    => 'someloss',
       type    => 'loss',
       pattern => '>0%,*12*,>0%,*12*,>0%',
       comment => 'loss 3 times in a row' } ],
   $cgi_remark_top     = 'Welcome to the SmokePing website of xxx Company. Here you will learn all about the latency of our network.',
   $targets_dir        = '/etc/smokeping/config.d/targets.d',
   $daemon_user        = 'smokeping',
   $daemon_group       = 'smokeping',
   $version            = 'present',
   $enable             = true,
   $start              = true,
) {
   class{'smokeping::install': } ->
   class{'smokeping::config': } ~>
   class{'smokeping::service': } ->
   Class['smokeping']
}
