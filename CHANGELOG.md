# Changelog

All notable changes to this project will be documented in this file.
Each new release typically also includes the latest modulesync defaults.
These should not affect the functionality of the module.

## [v8.0.0](https://github.com/voxpupuli/puppet-smokeping/tree/v8.0.0) (2025-04-09)

[Full Changelog](https://github.com/voxpupuli/puppet-smokeping/compare/v7.0.0...v8.0.0)

**Breaking changes:**

- Require stdlib 9.x [\#178](https://github.com/voxpupuli/puppet-smokeping/pull/178) ([kenyon](https://github.com/kenyon))

**Implemented enhancements:**

- metadata.json: Add OpenVox [\#180](https://github.com/voxpupuli/puppet-smokeping/pull/180) ([jstraw](https://github.com/jstraw))
- puppet/systemd: Allow 6.x [\#166](https://github.com/voxpupuli/puppet-smokeping/pull/166) ([zilchms](https://github.com/zilchms))
- puppetlabs/concat: Allow 9.x [\#165](https://github.com/voxpupuli/puppet-smokeping/pull/165) ([zilchms](https://github.com/zilchms))

**Fixed bugs:**

- Fix specifying `slave_name` [\#181](https://github.com/voxpupuli/puppet-smokeping/pull/181) ([sorrison](https://github.com/sorrison))

**Merged pull requests:**

- puppet/systemd: allow 8.x [\#176](https://github.com/voxpupuli/puppet-smokeping/pull/176) ([jay7x](https://github.com/jay7x))
- update puppet-systemd upper bound to 8.0.0 [\#169](https://github.com/voxpupuli/puppet-smokeping/pull/169) ([TheMeier](https://github.com/TheMeier))

## [v7.0.0](https://github.com/voxpupuli/puppet-smokeping/tree/v7.0.0) (2023-09-04)

[Full Changelog](https://github.com/voxpupuli/puppet-smokeping/compare/v6.0.0...v7.0.0)

**Breaking changes:**

- Drop EoL Ubuntu 18.04 [\#160](https://github.com/voxpupuli/puppet-smokeping/pull/160) ([kenyon](https://github.com/kenyon))
- metadata.json: require at least stdlib 7.0.0 [\#158](https://github.com/voxpupuli/puppet-smokeping/pull/158) ([kenyon](https://github.com/kenyon))
- Drop Puppet 6 support [\#155](https://github.com/voxpupuli/puppet-smokeping/pull/155) ([bastelfreak](https://github.com/bastelfreak))
- Configure slaves with systemd [\#142](https://github.com/voxpupuli/puppet-smokeping/pull/142) ([kenyon](https://github.com/kenyon))

**Implemented enhancements:**

- Add Ubuntu 22.04 support [\#161](https://github.com/voxpupuli/puppet-smokeping/pull/161) ([kenyon](https://github.com/kenyon))
- Add option for management of datadir [\#159](https://github.com/voxpupuli/puppet-smokeping/pull/159) ([kenyon](https://github.com/kenyon))
- Add Puppet 8 support [\#157](https://github.com/voxpupuli/puppet-smokeping/pull/157) ([bastelfreak](https://github.com/bastelfreak))
- puppetlabs/stdlib: Allow 9.x [\#156](https://github.com/voxpupuli/puppet-smokeping/pull/156) ([bastelfreak](https://github.com/bastelfreak))
- Add option to manage imgcache directory [\#146](https://github.com/voxpupuli/puppet-smokeping/pull/146) ([yakatz](https://github.com/yakatz))
- Add `default_slaves` parameter for the `Targets` section [\#143](https://github.com/voxpupuli/puppet-smokeping/pull/143) ([kenyon](https://github.com/kenyon))

**Fixed bugs:**

- Wrong version in stdlib dependency [\#154](https://github.com/voxpupuli/puppet-smokeping/issues/154)

**Closed issues:**

- Managing too many files [\#145](https://github.com/voxpupuli/puppet-smokeping/issues/145)
- Module needs rspec puppet tests [\#54](https://github.com/voxpupuli/puppet-smokeping/issues/54)

## [v6.0.0](https://github.com/voxpupuli/puppet-smokeping/tree/v6.0.0) (2022-03-15)

[Full Changelog](https://github.com/voxpupuli/puppet-smokeping/compare/v5.1.1...v6.0.0)

**Breaking changes:**

- Add RHEL/CentOS 8 and remove EOL Puppet 5 [\#147](https://github.com/voxpupuli/puppet-smokeping/pull/147) ([yakatz](https://github.com/yakatz))
- Remove optional module dependencies [\#140](https://github.com/voxpupuli/puppet-smokeping/pull/140) ([kenyon](https://github.com/kenyon))
- Drop support for Ubuntu 14.04, add 18.04 and 20.04; add Debian 10 and 11 [\#139](https://github.com/voxpupuli/puppet-smokeping/pull/139) ([kenyon](https://github.com/kenyon))

**Implemented enhancements:**

- Add Puppet 7 support [\#141](https://github.com/voxpupuli/puppet-smokeping/pull/141) ([kenyon](https://github.com/kenyon))
- Convert from params.pp to defaults and Hiera [\#138](https://github.com/voxpupuli/puppet-smokeping/pull/138) ([kenyon](https://github.com/kenyon))

**Closed issues:**

- Use defaults from params.pp [\#72](https://github.com/voxpupuli/puppet-smokeping/issues/72)

**Merged pull requests:**

- Fix params that are now default undef [\#149](https://github.com/voxpupuli/puppet-smokeping/pull/149) ([waipeng](https://github.com/waipeng))
- README cleanup [\#137](https://github.com/voxpupuli/puppet-smokeping/pull/137) ([kenyon](https://github.com/kenyon))
- Convert docs to Puppet Strings format [\#136](https://github.com/voxpupuli/puppet-smokeping/pull/136) ([kenyon](https://github.com/kenyon))
- assert\_private\(\) in private classes [\#135](https://github.com/voxpupuli/puppet-smokeping/pull/135) ([kenyon](https://github.com/kenyon))
- Allow stdlib 8.0.0 [\#133](https://github.com/voxpupuli/puppet-smokeping/pull/133) ([smortex](https://github.com/smortex))

## [v5.1.1](https://github.com/voxpupuli/puppet-smokeping/tree/v5.1.1) (2020-09-25)

[Full Changelog](https://github.com/voxpupuli/puppet-smokeping/compare/v5.1.0...v5.1.1)

**Closed issues:**

- Support latest puppetlabs-firewall [\#128](https://github.com/voxpupuli/puppet-smokeping/issues/128)

**Merged pull requests:**

- Update dependencies to support latest puppetlabs-firewall [\#129](https://github.com/voxpupuli/puppet-smokeping/pull/129) ([andybotting](https://github.com/andybotting))

## [v5.1.0](https://github.com/voxpupuli/puppet-smokeping/tree/v5.1.0) (2020-09-24)

[Full Changelog](https://github.com/voxpupuli/puppet-smokeping/compare/v5.0.0...v5.1.0)

**Implemented enhancements:**

- add support for Puppet 5 [\#82](https://github.com/voxpupuli/puppet-smokeping/issues/82)

**Fixed bugs:**

- Allow puppetlabs/concat 6.x, puppetlabs/stdlib 6.x [\#110](https://github.com/voxpupuli/puppet-smokeping/pull/110) ([dhoppe](https://github.com/dhoppe))
- Fix selinux::module parameter [\#109](https://github.com/voxpupuli/puppet-smokeping/pull/109) ([sapakt](https://github.com/sapakt))

**Closed issues:**

- Support latest puppetlabs-apache [\#125](https://github.com/voxpupuli/puppet-smokeping/issues/125)

**Merged pull requests:**

- Support puppetlabs-apache 5.x [\#126](https://github.com/voxpupuli/puppet-smokeping/pull/126) ([andybotting](https://github.com/andybotting))
- modulesync 3.0.0 & puppet-lint updates [\#118](https://github.com/voxpupuli/puppet-smokeping/pull/118) ([bastelfreak](https://github.com/bastelfreak))
- update repo links to https [\#116](https://github.com/voxpupuli/puppet-smokeping/pull/116) ([bastelfreak](https://github.com/bastelfreak))
- Allow puppet-selinux 2.x and 3.x [\#111](https://github.com/voxpupuli/puppet-smokeping/pull/111) ([ekohl](https://github.com/ekohl))

## [v5.0.0](https://github.com/voxpupuli/puppet-smokeping/tree/v5.0.0) (2019-05-07)

[Full Changelog](https://github.com/voxpupuli/puppet-smokeping/compare/v4.0.0...v5.0.0)

**Breaking changes:**

- modulesync 2.7.0 and drop puppet 4 [\#106](https://github.com/voxpupuli/puppet-smokeping/pull/106) ([bastelfreak](https://github.com/bastelfreak))

**Merged pull requests:**

- Allow puppetlabs/apache 4.x [\#107](https://github.com/voxpupuli/puppet-smokeping/pull/107) ([dhoppe](https://github.com/dhoppe))
- modulesync 2.2.0 and allow puppet 6.x [\#103](https://github.com/voxpupuli/puppet-smokeping/pull/103) ([bastelfreak](https://github.com/bastelfreak))

## [v4.0.0](https://github.com/voxpupuli/puppet-smokeping/tree/v4.0.0) (2018-09-17)

[Full Changelog](https://github.com/voxpupuli/puppet-smokeping/compare/v3.1.1...v4.0.0)

**Breaking changes:**

- Fix smokeping::target type [\#99](https://github.com/voxpupuli/puppet-smokeping/pull/99) ([alexjfisher](https://github.com/alexjfisher))

**Implemented enhancements:**

- Update module dependencies [\#100](https://github.com/voxpupuli/puppet-smokeping/pull/100) ([alexjfisher](https://github.com/alexjfisher))

**Closed issues:**

- Variables 'remark' and 'hierarchy\_parent' should have defaults matching validation as strings. [\#74](https://github.com/voxpupuli/puppet-smokeping/issues/74)

**Merged pull requests:**

- Add EL7 operating systems to metadata.json [\#101](https://github.com/voxpupuli/puppet-smokeping/pull/101) ([alexjfisher](https://github.com/alexjfisher))
- allow puppetlabs/stdlib 5.x [\#96](https://github.com/voxpupuli/puppet-smokeping/pull/96) ([bastelfreak](https://github.com/bastelfreak))

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



\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)*
