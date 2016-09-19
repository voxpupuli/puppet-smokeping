# SmokePing Puppet module

Puppet module to completely manage a SmokePing installation.
Includes managing of Master/Slave installation and the menu hierarchy.

Some background information can be found here: [Puppet module to manage SmokePing](http://tobrunet.ch/2013/02/puppet-module-to-manage-smokeping/)

## Features

* Master/Slave/Standalone SmokePing configuration possible
* Menu hierarchy implemented
* Define Probes and Alert patterns
* Config files managed with templates
* Uses exported resources to configure Slaves on the Master (tag: smokeping-slave)
* Automatically generates a shared secret for Master/Slave configuration (tag: smokeping-slave-secret)


## Supported Platforms

Fully supported:
* Ubuntu (Tested on 12.04, 14.04)

Standalone Only (no master/slave support yet):
* Fedora 22+
* CentOS 7+ (Note: requires third party repository to provide smokeping package).


## Dependencies
  - [puppetlabs-concat](https://github.com/puppetlabs/puppet-concat)
  - [puppetlabs-stdlib](https://github.com/puppetlabs/puppet-stdlib)

## Example

### Standalone SmokePing instance
```puppet
# install a standalone instance on a server with default values (see init.pp for 
# parameter documentation
class { '::smokeping':
    mode => 'standalone',
}
```

### Master SmokePing instance
```puppet
# install a master instance on a server with default values (see init.pp for 
# parameter documentation. You must have a slave, or this will not work!
class { '::smokeping':
    mode => 'master',
}
```

### Slave SmokePing instance
```puppet
class { '::smokeping':
    mode           => 'slave',
    slave_name     => $::hostname,
    master_url     => 'http://myserver.tld/smokeping/smokeping.cgi',
    slave_location => 'zurich',
}
```
This configures the server as slaves and adds the slave definition automatically to the
master using exported resources.

### Probes
```puppet
$probes = [
    { name => 'FPing', binary => '/usr/bin/fping' },
    { name => 'FPing6', binary => '/usr/bin/fping6' },
]
Class['::smokeping'] {
  probes => $probes
}
```

### Alerts
```puppet
$alerts = [ {
  { name      => 'bigloss',
  alert_type  => 'loss',
  pattern     => '==0%,==0%,==0%,==0%,>0%,>0%,>0%',
  comment     => 'suddenly there is packet loss' },

  { name      => 'startloss',
  alert_type  => 'loss',
  pattern     => '==S,>0%,>0%,>0%',
  comment     => 'loss at startup' },

  { name      => 'noloss',
  alert_type  => 'loss',
  pattern     => '>0%,>0%,>0%,==0%,==0%,==0%,==0%',
  edgetrigger => true
  comment     => 'there was loss and now its reachable again' },
] }
Class['::smokeping'] {
  alerts => $alerts
}
```

### Targets
```puppet
# Top Level
smokeping::target { 'World':
    menu      => 'World',
    pagetitle => 'Connection to the World',
    alerts    => [ 'bigloss', 'noloss' ]
}

smokeping::target { 'GoogleCH':
    hierarchy_parent => 'World',
    hierarchy_level  => 2,
    menu             => 'google.ch',
    pagetitle        => 'Google',
}
smokeping::target { 'GoogleCHIPv4':
    hierarchy_parent => 'GoogleCH',
    hierarchy_level  => 3,
    menu             => 'google.ch IPv4',
    host             => 'google.ch',
    slaves           => ['slave1'],
}
smokeping::target { 'GoogleCHIPv6':
    hierarchy_parent => 'GoogleCH',
    hierarchy_level  => 3,
    menu             => 'google.ch IPv6',
    host             => 'google.ch',
    probe            => 'FPing6'
    slaves           => ['slave1'],
}
smokeping::target { 'GoogleCHCurl':
    hierarchy_parent => 'GoogleCH',
    hierarchy_level  => 3,
    menu             => 'google.ch Curl',
    host             => 'google.ch',
    probe            => 'Curl',
    options          => {
      urlformat => 'http://%host%/',
    }
}
```

## License / Author

The module is written by

* Tobias Brunner <tobias@tobru.ch>

Licensed under Apache License, Version 2.0, Copyright 2015 by Tobias Brunner

## Contibutors

See: [Github Contributors](https://github.com/tobru/puppet-smokeping/graphs/contributors)
