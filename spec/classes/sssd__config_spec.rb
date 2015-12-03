require 'spec_helper'

describe 'realmd' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "realmd::sssd::config class with default parameters" do
          let(:params) {{ }}

          it { should contain_file('/etc/sssd/sssd.conf').with({
	          :owner => 'root',
	          :group => 'root',
	          :mode  => '0600'
	        }) }

	        it { should contain_file('/etc/sssd/sssd.conf').with_content(/services = nss,pam/) }
        end
      end
    end
  end
end
