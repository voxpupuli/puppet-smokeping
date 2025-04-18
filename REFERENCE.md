# Reference

<!-- DO NOT EDIT: This document was generated by Puppet Strings -->

## Table of Contents

### Classes

* [`smokeping`](#smokeping): Manage SmokePing
* [`smokeping::apache`](#smokeping--apache): Manage Apache config
* [`smokeping::config`](#smokeping--config): Manage SmokePing configuration
* [`smokeping::install`](#smokeping--install): Manage SmokePing installation
* [`smokeping::service`](#smokeping--service): Manage SmokePing service

### Defined types

* [`smokeping::slave`](#smokeping--slave): SmokePing slave
* [`smokeping::target`](#smokeping--target): SmokePing target

## Classes

### <a name="smokeping"></a>`smokeping`

Manage SmokePing

#### Parameters

The following parameters are available in the `smokeping` class:

* [`mode`](#-smokeping--mode)
* [`master_url`](#-smokeping--master_url)
* [`shared_secret`](#-smokeping--shared_secret)
* [`slave_secrets`](#-smokeping--slave_secrets)
* [`slave_name`](#-smokeping--slave_name)
* [`slave_dir`](#-smokeping--slave_dir)
* [`slave_location`](#-smokeping--slave_location)
* [`slave_display_name`](#-smokeping--slave_display_name)
* [`slave_color`](#-smokeping--slave_color)
* [`master_name`](#-smokeping--master_name)
* [`owner`](#-smokeping--owner)
* [`contact`](#-smokeping--contact)
* [`mailhost`](#-smokeping--mailhost)
* [`cgiurl`](#-smokeping--cgiurl)
* [`syslogfacility`](#-smokeping--syslogfacility)
* [`probes`](#-smokeping--probes)
* [`default_probe`](#-smokeping--default_probe)
* [`alerts_to`](#-smokeping--alerts_to)
* [`alerts_from`](#-smokeping--alerts_from)
* [`alerts`](#-smokeping--alerts)
* [`cgi_remark_top`](#-smokeping--cgi_remark_top)
* [`cgi_title_top`](#-smokeping--cgi_title_top)
* [`targets_dir`](#-smokeping--targets_dir)
* [`targets`](#-smokeping--targets)
* [`daemon_user`](#-smokeping--daemon_user)
* [`daemon_group`](#-smokeping--daemon_group)
* [`path_sendmail`](#-smokeping--path_sendmail)
* [`webserver_user`](#-smokeping--webserver_user)
* [`webserver_group`](#-smokeping--webserver_group)
* [`path_imgcache`](#-smokeping--path_imgcache)
* [`path_imgurl`](#-smokeping--path_imgurl)
* [`path_datadir`](#-smokeping--path_datadir)
* [`path_piddir`](#-smokeping--path_piddir)
* [`path_smokemail`](#-smokeping--path_smokemail)
* [`path_tmail`](#-smokeping--path_tmail)
* [`version`](#-smokeping--version)
* [`enable`](#-smokeping--enable)
* [`start`](#-smokeping--start)
* [`manage_apache`](#-smokeping--manage_apache)
* [`manage_firewall`](#-smokeping--manage_firewall)
* [`manage_selinux`](#-smokeping--manage_selinux)
* [`manage_datadir`](#-smokeping--manage_datadir)
* [`manage_imgcache`](#-smokeping--manage_imgcache)
* [`package_perldoc`](#-smokeping--package_perldoc)
* [`syslogpriority`](#-smokeping--syslogpriority)
* [`default_slaves`](#-smokeping--default_slaves)
* [`servername`](#-smokeping--servername)

##### <a name="-smokeping--mode"></a>`mode`

Data type: `Enum['master', 'slave', 'standalone']`

SmokePing mode: master, slave, or standalone

##### <a name="-smokeping--master_url"></a>`master_url`

Data type: `Stdlib::HTTPUrl`

URL to master cgi for slave mode

##### <a name="-smokeping--shared_secret"></a>`shared_secret`

Data type: `Stdlib::Absolutepath`

Path to slavesecrets file

Default value: `'/etc/smokeping/slavesecrets.conf'`

##### <a name="-smokeping--slave_secrets"></a>`slave_secrets`

Data type: `Stdlib::Absolutepath`

Path to smokeping_secrets file

Default value: `'/etc/smokeping/smokeping_secrets'`

##### <a name="-smokeping--slave_name"></a>`slave_name`

Data type: `String[1]`

Name of slave. Only used in slave mode

Default value: `$facts['networking']['hostname']`

##### <a name="-smokeping--slave_dir"></a>`slave_dir`

Data type: `Stdlib::Absolutepath`

Path to slave definitions on master

Default value: `'/etc/smokeping/config.d/slaves.d'`

##### <a name="-smokeping--slave_location"></a>`slave_location`

Data type: `Optional[String[1]]`

Location of slave

Default value: `undef`

##### <a name="-smokeping--slave_display_name"></a>`slave_display_name`

Data type: `Optional[String[1]]`

Name of slave, displayed on Webpage

Default value: `undef`

##### <a name="-smokeping--slave_color"></a>`slave_color`

Data type: `Optional[Integer[0]]`

Color of slave in the graph, as a RRGGBB hex integer.

Default value: `undef`

##### <a name="-smokeping--master_name"></a>`master_name`

Data type: `String[1]`

Name of the master, in case of more than one SmokePing Master/Slave

Default value: `'default'`

##### <a name="-smokeping--owner"></a>`owner`

Data type: `String[1]`

Owner of this SmokePing instance

Default value: `'Peter Random'`

##### <a name="-smokeping--contact"></a>`contact`

Data type: `Stdlib::Email`

Contact E-Mail of this SmokePing instance

Default value: `'root@localhost'`

##### <a name="-smokeping--mailhost"></a>`mailhost`

Data type: `Optional[Stdlib::Host]`

Where to send mails to

Default value: `undef`

##### <a name="-smokeping--cgiurl"></a>`cgiurl`

Data type: `Stdlib::HTTPUrl`

URL of SmokePing CGI

##### <a name="-smokeping--syslogfacility"></a>`syslogfacility`

Data type: `Stdlib::Syslogfacility`

Syslog Facility

Default value: `'local0'`

##### <a name="-smokeping--probes"></a>`probes`

Data type: `Array[Hash]`

Probe definitions as Array of Hashes

Default value: `[]`

##### <a name="-smokeping--default_probe"></a>`default_probe`

Data type: `String[1]`

Default Probe

Default value: `'FPing'`

##### <a name="-smokeping--alerts_to"></a>`alerts_to`

Data type: `Stdlib::Email`

E-Mail address or tool to send Alerts to

Default value: `'root@localhost'`

##### <a name="-smokeping--alerts_from"></a>`alerts_from`

Data type: `Stdlib::Email`

Sender E-Mail of Alerts

Default value: `'root@localhost'`

##### <a name="-smokeping--alerts"></a>`alerts`

Data type: `Array[Hash]`

Alert definitions as Array of Hashes

Default value:

```puppet
[
    {
      name        => 'someloss',
      alert_type  => 'loss',
      pattern     => '>0%,*12*,>0%,*12*,>0%',
      edgetrigger => false,
      comment     => 'loss 3 times in a row',
    },
  ]
```

##### <a name="-smokeping--cgi_remark_top"></a>`cgi_remark_top`

Data type: `String[1]`

Remark on Website

Default value: `'Welcome to the SmokePing website of xxx Company. Here you will learn all about the latency of our network.'`

##### <a name="-smokeping--cgi_title_top"></a>`cgi_title_top`

Data type: `String[1]`

Title on Website

Default value: `'Network Latency Grapher'`

##### <a name="-smokeping--targets_dir"></a>`targets_dir`

Data type: `Stdlib::Absolutepath`

Where to save target definitions

Default value: `'/etc/smokeping/config.d/targets.d'`

##### <a name="-smokeping--targets"></a>`targets`

Data type: `Hash`

Target definitions as a Hash of Smokeping::Target

Default value: `{}`

##### <a name="-smokeping--daemon_user"></a>`daemon_user`

Data type: `String[1]`

User to run SmokePing

##### <a name="-smokeping--daemon_group"></a>`daemon_group`

Data type: `String[1]`

Group of SmokePing

##### <a name="-smokeping--path_sendmail"></a>`path_sendmail`

Data type: `Stdlib::Absolutepath`

Path to sendmail binary

Default value: `'/usr/sbin/sendmail'`

##### <a name="-smokeping--webserver_user"></a>`webserver_user`

Data type: `String[1]`

User of webserver, owner of image-files

##### <a name="-smokeping--webserver_group"></a>`webserver_group`

Data type: `String[1]`

Group of webserver

##### <a name="-smokeping--path_imgcache"></a>`path_imgcache`

Data type: `Stdlib::Absolutepath`

Path to image cache dir

##### <a name="-smokeping--path_imgurl"></a>`path_imgurl`

Data type: `String[1]`

URL path to images for CGI

##### <a name="-smokeping--path_datadir"></a>`path_datadir`

Data type: `Stdlib::Absolutepath`

Path to smokeping data

##### <a name="-smokeping--path_piddir"></a>`path_piddir`

Data type: `Stdlib::Absolutepath`

Path to PID file

Default value: `'/var/run/smokeping'`

##### <a name="-smokeping--path_smokemail"></a>`path_smokemail`

Data type: `Stdlib::Absolutepath`

Path to smokemail binary

Default value: `'/etc/smokeping/smokemail'`

##### <a name="-smokeping--path_tmail"></a>`path_tmail`

Data type: `Stdlib::Absolutepath`

Path to tmail binary

Default value: `'/etc/smokeping/tmail'`

##### <a name="-smokeping--version"></a>`version`

Data type: `String[1]`

Version which should be installed

Default value: `'present'`

##### <a name="-smokeping--enable"></a>`enable`

Data type: `Boolean`

Should the service be enabled during boot time?

Default value: `true`

##### <a name="-smokeping--start"></a>`start`

Data type: `Boolean`

Should the service be started by Puppet?

Default value: `true`

##### <a name="-smokeping--manage_apache"></a>`manage_apache`

Data type: `Boolean`

Should we manage the Apache config with puppetlabs/apache?

Default value: `false`

##### <a name="-smokeping--manage_firewall"></a>`manage_firewall`

Data type: `Boolean`

Should we manage a firewall rule for Smokeping with puppetlabs/firewall?

Default value: `false`

##### <a name="-smokeping--manage_selinux"></a>`manage_selinux`

Data type: `Boolean`

Should we load an SELinux policy to allow Smokeping to work on Red Hat distros?

Default value: `false`

##### <a name="-smokeping--manage_datadir"></a>`manage_datadir`

Data type: `Boolean`

Should we manage the data directory?

Default value: `true`

##### <a name="-smokeping--manage_imgcache"></a>`manage_imgcache`

Data type: `Boolean`

Should we manage the permissions on the imgcache directory?

Default value: `true`

##### <a name="-smokeping--package_perldoc"></a>`package_perldoc`

Data type: `String[1]`



##### <a name="-smokeping--syslogpriority"></a>`syslogpriority`

Data type: `String[1]`



Default value: `'info'`

##### <a name="-smokeping--default_slaves"></a>`default_slaves`

Data type: `Array[String[1]]`



Default value: `[]`

##### <a name="-smokeping--servername"></a>`servername`

Data type: `Stdlib::Fqdn`



Default value: `$facts['networking']['fqdn']`

### <a name="smokeping--apache"></a>`smokeping::apache`

Manage Apache config

### <a name="smokeping--config"></a>`smokeping::config`

Manage SmokePing configuration

### <a name="smokeping--install"></a>`smokeping::install`

Manage SmokePing installation

### <a name="smokeping--service"></a>`smokeping::service`

Manage SmokePing service

## Defined types

### <a name="smokeping--slave"></a>`smokeping::slave`

SmokePing slave

#### Parameters

The following parameters are available in the `smokeping::slave` defined type:

* [`location`](#-smokeping--slave--location)
* [`display_name`](#-smokeping--slave--display_name)
* [`color`](#-smokeping--slave--color)
* [`master`](#-smokeping--slave--master)

##### <a name="-smokeping--slave--location"></a>`location`

Data type: `Optional[String[1]]`

Location of slave

Default value: `undef`

##### <a name="-smokeping--slave--display_name"></a>`display_name`

Data type: `String[1]`

Name of the slave

##### <a name="-smokeping--slave--color"></a>`color`

Data type: `Integer[0]`

Color of this slave

##### <a name="-smokeping--slave--master"></a>`master`

Data type: `Any`

Name of the smokeping master, in case there are more than one.

Default value: `'default'`

### <a name="smokeping--target"></a>`smokeping::target`

SmokePing target

#### Parameters

The following parameters are available in the `smokeping::target` defined type:

* [`pagetitle`](#-smokeping--target--pagetitle)
* [`menu`](#-smokeping--target--menu)
* [`hierarchy_level`](#-smokeping--target--hierarchy_level)
* [`hierarchy_parent`](#-smokeping--target--hierarchy_parent)
* [`probe`](#-smokeping--target--probe)
* [`host`](#-smokeping--target--host)
* [`alerts`](#-smokeping--target--alerts)
* [`slaves`](#-smokeping--target--slaves)
* [`nomasterpoll`](#-smokeping--target--nomasterpoll)
* [`remark`](#-smokeping--target--remark)
* [`options`](#-smokeping--target--options)

##### <a name="-smokeping--target--pagetitle"></a>`pagetitle`

Data type: `Optional[String[1]]`

Title. If empty, menu will be used as Title

Default value: `undef`

##### <a name="-smokeping--target--menu"></a>`menu`

Data type: `Optional[String[1]]`

Menu name.

Default value: `undef`

##### <a name="-smokeping--target--hierarchy_level"></a>`hierarchy_level`

Data type: `Integer`

Level of this target on the menu hierarchy.

Default value: `1`

##### <a name="-smokeping--target--hierarchy_parent"></a>`hierarchy_parent`

Data type: `Optional[String[1]]`

If hierarchy_level > 1, this specifies the parent.

Default value: `undef`

##### <a name="-smokeping--target--probe"></a>`probe`

Data type: `Optional[String[1]]`

Which probe to use.

Default value: `undef`

##### <a name="-smokeping--target--host"></a>`host`

Data type: `Optional[String[1]]`

Target host name/IP.

Default value: `undef`

##### <a name="-smokeping--target--alerts"></a>`alerts`

Data type: `Array`

Array of Alerts to apply to this target

Default value: `[]`

##### <a name="-smokeping--target--slaves"></a>`slaves`

Data type: `Array`

Array of slaves on which to run this target

Default value: `[]`

##### <a name="-smokeping--target--nomasterpoll"></a>`nomasterpoll`

Data type: `Boolean`

Disable data-polling from master

Default value: `false`

##### <a name="-smokeping--target--remark"></a>`remark`

Data type: `Optional[String[1]]`

Remark displayed on Website

Default value: `undef`

##### <a name="-smokeping--target--options"></a>`options`

Data type: `Hash`



Default value: `{}`

