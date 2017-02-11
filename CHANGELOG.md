# Change Log
All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

## 2017-02-11 Release 2.0.0

This is the last release with Puppet3 support!
* Only include `/etc/smokeping/conf.d/Slaves` when mode is master
* Add support for managing firewall rules
* Add edgetrigger option to smokeping alerts
* Bump puppet minimum version_requirement to 3.8.7

## [1.7.1] - 2015-11-12
### Fixed
- Future parser compatibility. Thanks to @dvorak
- Slave configuration fixes. Thanks to @fetzerms
- Initial RedHat/CentOS support. Thanks to @jethrocarr
- Better Hiera support. Thanks to @vincentbernat
- Other small fixes

## [1.7.0] - 2015-02-19
### Added
- A proper Change Log file according to http://keepachangelog.com
- Allow leaving out of alerts parameter (empty array instead of false by default).

### Changed
- Replaced the deprecated Modulefile by a metadata.json
- Template variables use scope to be compatible to newer Puppet versions
- Use `fqdn` fact instead of `hostname` fact in config and slave manifest

### Fixed
- Slave parameter scope fixed
