# Manage Apache config
class smokeping::apache {

  $docroot = $::osfamily ? {
    'RedHat' => '/usr/share/smokeping/htdocs',
    'Debian' => '/usr/share/smokeping/www',
  }

  # Construct hash of parameters
  $aliases = $::osfamily ? {
    'RedHat' => [
      {
        'alias' => '/smokeping/images',
        'path'  => '/var/lib/smokeping/images',
      },
      {
        'alias' => '/smokeping',
        'path'  => '/usr/share/smokeping/htdocs',
      },
      {
        'scriptalias' => '/smokeping/sm.cgi',
        'path'        => '/usr/share/smokeping/cgi/smokeping.fcgi',
      },
#      {
#        scriptalias => '/smokeping/sm.cgi',
#        path        => '/usr/share/smokeping/cgi/smokeping_cgi',
#      },
    ],
    'Debian' => [
      {
        'alias' => '/smokeping',
        'path'  => '/usr/share/smokeping/www',
      },
      {
        'scriptalias' => '/smokeping/smokeping.cgi',
        'path'        => '/usr/lib/cgi-bin/smokeping.cgi',
      },
    ],
  }


  $directories = $::osfamily ? {
    'RedHat' => [
      {
        'path'    => '/usr/share/smokeping',
        'require' => 'all granted',
      },
      {
        'path'    => '/var/lib/smokeping',
        'require' => 'all granted',
      },
    ],
    'Debian' => [
      {
        'path'    => '/usr/share/smokeping/www',
        'options' => '+FollowSymLinks',
      },
    ],
  }

  # Configure apache
  include ::apache
  apache::vhost { 'smokeping':
    servername  => $::fqdn,
    docroot     => $docroot,
    directories => $directories,
    aliases     => $aliases,
  }
}
