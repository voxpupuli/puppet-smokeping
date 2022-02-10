require 'spec_helper'

describe 'smokeping' do
  let :node do
    'agent.example.com'
  end

  on_supported_os.each do |os, facts|
    context "on #{os} " do
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
            is_expected.to contain_file('/var/lib/smokeping/rrd').with(
              ensure: 'directory',
              owner: 'root',
              group: 'root',
              recurse: true
            )
          }
        when 'Debian'
          it {
            is_expected.to contain_file('/var/lib/smokeping').with(
              ensure: 'directory',
              owner: 'smokeping',
              group: 'smokeping',
              recurse: true
            )
          }
        end
      end

      context 'change datadir' do
        let :params do
          {
            cgiurl: 'http://some.url/smokeping.cgi',
            master_url: 'http://somewhere/cgi-bin/smokeping.cgi',
            path_datadir: '/smokeping/data'
          }
        end

        it {
          is_expected.to contain_file('/smokeping/data').with(
            ensure: 'directory',
            recurse: true
          )
        }

        context "don't manage datadir" do
          let :params do
            {
              cgiurl: 'http://some.url/smokeping.cgi',
              master_url: 'http://somewhere/cgi-bin/smokeping.cgi',
              path_datadir: '/smokeping/data',
              manage_datadir: false
            }
          end

          it { is_expected.not_to contain_file('/smokeping/data') }
        end
      end
    end
  end
end
