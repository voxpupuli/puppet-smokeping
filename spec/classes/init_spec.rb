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
      end
    end
  end
end
