# Changelog

All notable changes to this project will be documented in this file.
Each new release typically also includes the latest modulesync defaults.
These should not affect the functionality of the module.

## [v3.1.1](https://github.com/voxpupuli/puppet-smokeping/tree/v3.1.1) (2018-06-17)

[Full Changelog](https://github.com/voxpupuli/puppet-smokeping/compare/v3.1.0...v3.1.1)

**Fixed bugs:**

- Fix: no implicit conversion of Fixnum into String [\#88](https://github.com/voxpupuli/puppet-smokeping/pull/88) ([identw](https://github.com/identw))

**Merged pull requests:**

- Remove docker nodesets [\#90](https://github.com/voxpupuli/puppet-smokeping/pull/90) ([bastelfreak](https://github.com/bastelfreak))
- drop EOL OSs; fix puppet version range [\#89](https://github.com/voxpupuli/puppet-smokeping/pull/89) ([bastelfreak](https://github.com/bastelfreak))

## [v3.1.0](https://github.com/voxpupuli/puppet-smokeping/tree/v3.1.0) (2018-03-30)

[Full Changelog](https://github.com/voxpupuli/puppet-smokeping/compare/v3.0.0...v3.1.0)

**Fixed bugs:**

- use defaults from params.pp [\#80](https://github.com/voxpupuli/puppet-smokeping/pull/80) ([seriv](https://github.com/seriv))

**Merged pull requests:**

- fix project\_page link in metadata.json [\#85](https://github.com/voxpupuli/puppet-smokeping/pull/85) ([bastelfreak](https://github.com/bastelfreak))
- bump puppet to latest supported version 4.10.0 [\#84](https://github.com/voxpupuli/puppet-smokeping/pull/84) ([bastelfreak](https://github.com/bastelfreak))

## [v3.0.0](https://github.com/voxpupuli/puppet-smokeping/tree/v3.0.0) (2017-11-11)

[Full Changelog](https://github.com/voxpupuli/puppet-smokeping/compare/v2.0.0...v3.0.0)

**Merged pull requests:**

- replace validate\_\* with datatypes in target [\#70](https://github.com/voxpupuli/puppet-smokeping/pull/70) ([bastelfreak](https://github.com/bastelfreak))
- Add basic unit testing [\#69](https://github.com/voxpupuli/puppet-smokeping/pull/69) ([bastelfreak](https://github.com/bastelfreak))
- purge trailing whitespace in README.md [\#68](https://github.com/voxpupuli/puppet-smokeping/pull/68) ([bastelfreak](https://github.com/bastelfreak))

## [v2.0.0](https://github.com/voxpupuli/puppet-smokeping/tree/v2.0.0) (2017-02-11)

[Full Changelog](https://github.com/voxpupuli/puppet-smokeping/compare/v1.7.2...v2.0.0)

**Closed issues:**

- Standalone mode complains about missing Slaves file. [\#44](https://github.com/voxpupuli/puppet-smokeping/issues/44)
- Use puppetlabs-concat instead of ripienaar-concat? [\#41](https://github.com/voxpupuli/puppet-smokeping/issues/41)
- /etc/smokeping/config.d/Slaves is declared twice on a master [\#38](https://github.com/voxpupuli/puppet-smokeping/issues/38)
- Slave config? [\#34](https://github.com/voxpupuli/puppet-smokeping/issues/34)
- /etc/smokeping/config seems not to be managed by puppet-smokeping module [\#25](https://github.com/voxpupuli/puppet-smokeping/issues/25)

**Merged pull requests:**

- Bump minimum version dependencies \(for Puppet 4\) [\#57](https://github.com/voxpupuli/puppet-smokeping/pull/57) ([juniorsysadmin](https://github.com/juniorsysadmin))
- Bump puppet minimum version\_requirement to 3.8.7 [\#56](https://github.com/voxpupuli/puppet-smokeping/pull/56) ([juniorsysadmin](https://github.com/juniorsysadmin))
- Fix puppet syntax in README.md [\#55](https://github.com/voxpupuli/puppet-smokeping/pull/55) ([AlessandroLorenzi](https://github.com/AlessandroLorenzi))
- Lint fixes and metadata.json [\#53](https://github.com/voxpupuli/puppet-smokeping/pull/53) ([alexjfisher](https://github.com/alexjfisher))
- Concat resources need to depend on target dir [\#49](https://github.com/voxpupuli/puppet-smokeping/pull/49) ([claytono](https://github.com/claytono))
- Add support to manage an SELinux policy [\#47](https://github.com/voxpupuli/puppet-smokeping/pull/47) ([djjudas21](https://github.com/djjudas21))
- Add edgetrigger option to smokeping alerts. [\#46](https://github.com/voxpupuli/puppet-smokeping/pull/46) ([gfokkema](https://github.com/gfokkema))
- Manage Apache [\#45](https://github.com/voxpupuli/puppet-smokeping/pull/45) ([djjudas21](https://github.com/djjudas21))
- Fix param name [\#43](https://github.com/voxpupuli/puppet-smokeping/pull/43) ([djjudas21](https://github.com/djjudas21))
- Only include /etc/smokeping/conf.d/Slaves when mode is master [\#40](https://github.com/voxpupuli/puppet-smokeping/pull/40) ([davewongillies](https://github.com/davewongillies))

## [v1.7.2](https://github.com/voxpupuli/puppet-smokeping/tree/v1.7.2) (2016-02-18)

[Full Changelog](https://github.com/voxpupuli/puppet-smokeping/compare/v1.7.1...v1.7.2)

**Merged pull requests:**

- \#38: Do not declare /etc/smokeping/config.d/Slaves twice. [\#39](https://github.com/voxpupuli/puppet-smokeping/pull/39) ([Zlo](https://github.com/Zlo))

## [v1.7.1](https://github.com/voxpupuli/puppet-smokeping/tree/v1.7.1) (2015-12-11)

[Full Changelog](https://github.com/voxpupuli/puppet-smokeping/compare/v1.7.0...v1.7.1)

**Merged pull requests:**

- Include params needed [\#37](https://github.com/voxpupuli/puppet-smokeping/pull/37) ([AlexRRR](https://github.com/AlexRRR))
- perldoc namespace incorrect [\#36](https://github.com/voxpupuli/puppet-smokeping/pull/36) ([AlexRRR](https://github.com/AlexRRR))
- Allow to specify targets through hiera [\#35](https://github.com/voxpupuli/puppet-smokeping/pull/35) ([vincentbernat](https://github.com/vincentbernat))
- Initial EL \(RHEL, CentOS, Fedora, Scientific Linux, Amazon Linux, etc\) support [\#32](https://github.com/voxpupuli/puppet-smokeping/pull/32) ([jethrocarr](https://github.com/jethrocarr))
- Small Improvements [\#30](https://github.com/voxpupuli/puppet-smokeping/pull/30) ([jethrocarr](https://github.com/jethrocarr))
- Added minimum framework for tests to enable syntax validation. [\#29](https://github.com/voxpupuli/puppet-smokeping/pull/29) ([jethrocarr](https://github.com/jethrocarr))
- Don't invent email addresses, use example.com/org/net or localhost [\#28](https://github.com/voxpupuli/puppet-smokeping/pull/28) ([jethrocarr](https://github.com/jethrocarr))
- Fixed error while using slave\_display\_name \(was ignored\) [\#27](https://github.com/voxpupuli/puppet-smokeping/pull/27) ([fetzerms](https://github.com/fetzerms))
- Fixed error on slave color not beeing automatically generated. [\#26](https://github.com/voxpupuli/puppet-smokeping/pull/26) ([fetzerms](https://github.com/fetzerms))
- Rename type parameter for future parser compat [\#24](https://github.com/voxpupuli/puppet-smokeping/pull/24) ([claytono](https://github.com/claytono))

## [v1.7.0](https://github.com/voxpupuli/puppet-smokeping/tree/v1.7.0) (2015-02-19)

[Full Changelog](https://github.com/voxpupuli/puppet-smokeping/compare/v1.6.0...v1.7.0)

**Closed issues:**

- Tags would be really very handy. [\#15](https://github.com/voxpupuli/puppet-smokeping/issues/15)

**Merged pull requests:**

- fix\(hostname\): remove hostname from default [\#23](https://github.com/voxpupuli/puppet-smokeping/pull/23) ([alkivi-sas](https://github.com/alkivi-sas))
- fix\(templates\): naming variables for templates [\#22](https://github.com/voxpupuli/puppet-smokeping/pull/22) ([alkivi-sas](https://github.com/alkivi-sas))
- Allow leaving out of alerts parameter \(empty array instead of false by default\) [\#21](https://github.com/voxpupuli/puppet-smokeping/pull/21) ([legooolas](https://github.com/legooolas))

## [v1.6.0](https://github.com/voxpupuli/puppet-smokeping/tree/v1.6.0) (2014-10-21)

[Full Changelog](https://github.com/voxpupuli/puppet-smokeping/compare/31ac51ef6fd8b64824e632bbcbbd5e733a8392d0...v1.6.0)

**Fixed bugs:**

- Master without slaves [\#4](https://github.com/voxpupuli/puppet-smokeping/issues/4)

**Closed issues:**

- Config in hiera [\#20](https://github.com/voxpupuli/puppet-smokeping/issues/20)
- thanks! [\#14](https://github.com/voxpupuli/puppet-smokeping/issues/14)
- Disabling alerts is not possible [\#6](https://github.com/voxpupuli/puppet-smokeping/issues/6)
- Add apache support [\#3](https://github.com/voxpupuli/puppet-smokeping/issues/3)

**Merged pull requests:**

- Require smokeping installed before creating dirs [\#19](https://github.com/voxpupuli/puppet-smokeping/pull/19) ([claytono](https://github.com/claytono))
- Allow arbitrary probe config values [\#16](https://github.com/voxpupuli/puppet-smokeping/pull/16) ([claytono](https://github.com/claytono))
- Allow setting the step for FPing Probes [\#13](https://github.com/voxpupuli/puppet-smokeping/pull/13) ([darkyat](https://github.com/darkyat))
- Use validate\_re to detect whitespace in title [\#11](https://github.com/voxpupuli/puppet-smokeping/pull/11) ([hakamadare](https://github.com/hakamadare))
- added options param to smokeping::target [\#9](https://github.com/voxpupuli/puppet-smokeping/pull/9) ([hakamadare](https://github.com/hakamadare))
- indentation cleanup [\#8](https://github.com/voxpupuli/puppet-smokeping/pull/8) ([rendhalver](https://github.com/rendhalver))
- Add support for empty "alerts =" lines in targets. [\#7](https://github.com/voxpupuli/puppet-smokeping/pull/7) ([cjsoftuk](https://github.com/cjsoftuk))
- Add standalone option, fix webserver user, some alinging [\#5](https://github.com/voxpupuli/puppet-smokeping/pull/5) ([darktim](https://github.com/darktim))
- Fix slave\_color format for colors \< 100000 [\#2](https://github.com/voxpupuli/puppet-smokeping/pull/2) ([x-way](https://github.com/x-way))
- make nomasterpoll configurable in smokeping::target [\#1](https://github.com/voxpupuli/puppet-smokeping/pull/1) ([x-way](https://github.com/x-way))



\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/skywinder/Github-Changelog-Generator)*
