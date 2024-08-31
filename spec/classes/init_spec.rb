# frozen_string_literal: true

require 'spec_helper'

describe 'smokeping' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end

      let :params do
        {
          cgiurl: 'http://some.url/smokeping.cgi',
          master_url: 'http://somewhere/cgi-bin/smokeping.cgi',
        }
      end

      context 'with all defaults' do
        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_class('smokeping') }
        it { is_expected.to contain_class('smokeping::install') }
        it { is_expected.to contain_class('smokeping::service') }
        it { is_expected.to contain_class('smokeping::config') }

        case facts[:osfamily]
        when 'RedHat'
          it {
            is_expected.to contain_file('/var/lib/smokeping/images').with(
              ensure: 'directory',
              owner: 'apache',
              group: 'apache',
              recurse: true
            )
          }

          it {
            is_expected.to contain_file('/var/lib/smokeping/rrd').with(
              ensure: 'directory',
              owner: 'root',
              group: 'apache',
              recurse: true
            )
          }

        when 'Debian'
          it {
            is_expected.to contain_file('/var/cache/smokeping/images').with(
              ensure: 'directory',
              owner: 'www-data',
              group: 'www-data',
              recurse: true
            )
          }

          it {
            is_expected.to contain_file('/var/lib/smokeping').with(
              ensure: 'directory',
              owner: 'smokeping',
              group: 'www-data',
              recurse: true
            )
          }
        end
      end

      context 'change img_cachedir' do
        let :params do
          {
            cgiurl: 'http://some.url/smokeping.cgi',
            master_url: 'http://somewhere/cgi-bin/smokeping.cgi',
            path_imgcache: '/smokeping/images'
          }
        end

        it { is_expected.to compile.with_all_deps }

        it {
          is_expected.to contain_file('/smokeping/images').with(
            ensure: 'directory',
            recurse: true
          )
        }
      end

      context 'change datadir' do
        let :params do
          {
            cgiurl: 'http://some.url/smokeping.cgi',
            master_url: 'http://somewhere/cgi-bin/smokeping.cgi',
            path_datadir: '/smokeping/data'
          }
        end

        it { is_expected.to compile.with_all_deps }

        it {
          is_expected.to contain_file('/smokeping/data').with(
            ensure: 'directory',
            recurse: true
          )
        }
      end

      context "don't manage img_cachedir" do
        let :params do
          {
            cgiurl: 'http://some.url/smokeping.cgi',
            master_url: 'http://somewhere/cgi-bin/smokeping.cgi',
            path_imgcache: '/smokeping/images',
            manage_imgcache: false
          }
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.not_to contain_file('/smokeping/images') }
      end

      context "don't manage datadir" do
        let :params do
          {
            cgiurl: 'http://some.url/smokeping.cgi',
            master_url: 'http://somewhere/cgi-bin/smokeping.cgi',
            path_datadir: '/smokeping/data',
            manage_datadir: false
          }
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.not_to contain_file('/smokeping/data') }
      end

      context 'slave mode' do
        let :params do
          super().merge(
            mode: 'slave',
            slave_color: 0xabcdef
          )
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_smokeping__slave(facts[:networking]['hostname']).with_color(0xabcdef) }
        it { is_expected.to contain_systemd__dropin_file('slave.conf').with_unit('smokeping.service') }
      end

      context 'with default slaves' do
        let :params do
          super().merge(default_slaves: %w[slv1 slv2])
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_concat__fragment('targets-header').with_content(%r{slaves = slv1 slv2}) }
      end
    end
  end
end
