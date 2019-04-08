# Manage Apache config
class smokeping::apache {
  $servername = $::smokeping::servername

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
#      {
#        'scriptalias' => '/smokeping/sm.cgi',
#        'path'        => '/usr/share/smokeping/cgi/smokeping.fcgi',
#      },
      {
        'scriptalias' => '/smokeping/sm.cgi',
        'path'        => '/usr/share/smokeping/cgi/smokeping_cgi',
      },
      {
        'scriptalias' => '/smokeping/smokeping.cgi',
        'path'        => '/usr/share/smokeping/cgi/smokeping_cgi',
      },
      {
        'scriptalias' => '/smokeping.cgi',
        'path'        => '/usr/share/smokeping/cgi/smokeping_cgi',
      },
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
        'path'     => '/usr/share/smokeping/htdocs',
        'require'  => 'all granted',
        'options'  => '+FollowSymLinks +Indexes',
        'override' => 'All',
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
  include apache
  include apache::mod::perl
  apache::vhost { 'smokeping':
    servername     => $servername,
    docroot        => $docroot,
    directories    => $directories,
    aliases        => $aliases,
    directoryindex => 'smokeping.cgi',
  }
}
