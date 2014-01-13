require 'spec_helper'
describe 'mco_agents', :type => :class do

  describe 'when used' do

    it { should contain_class('pe_mcollective::server') }
    it { should contain_service('pe-mcollective') }

    it do

      should contain_file('/opt/puppet/libexec/mcollective/mcollective/agent/disk.rb').with({
        'ensure' => 'file',
        'owner'  => 'root',
        'group'  => 'root',
        'mode'   => '0644',
      }).that_notifies('Service[pe-mcollective]')

      should contain_file('/opt/puppet/libexec/mcollective/mcollective/agent/disk.ddl').with({
        'ensure' => 'file',
        'owner'  => 'root',
        'group'  => 'root',
        'mode'   => '0644',
      }).that_notifies('Service[pe-mcollective]')
    end
  end
end
