class smokeping::install {

   package { 'smokeping':
      ensure => $smokeping::version
   }

   if ! defined (Package['fping']) {
     package {'fping': ensure => installed; }
   }
   if ! defined (Package['perl-doc']) {
     package {'perl-doc': ensure => installed; }
   }

   # correct permissions
   file { '/var/lib/smokeping':
       ensure  => directory,
       owner   => $smokeping::daemon_user,
       group   => $smokeping::daemon_group,
       recurse => true,
   }

}
