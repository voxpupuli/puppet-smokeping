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
      end

      context 'slave mode' do
        let :params do
          super().merge(
            mode: 'slave',
            slave_color: 0xabcdef
          )
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_smokeping__slave(facts[:hostname]).with_color(0xabcdef) }
        it { is_expected.to contain_systemd__dropin_file('slave.conf').with_unit('smokeping.service') }
      end
    end
  end
end
