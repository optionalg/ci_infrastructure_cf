require_relative '../../cookbooks/ci_infrastructure_cf/libraries/provider'

describe CiInfrastructureCf::Provider do
  let(:settings){ YAML.load_file(settings_file).to_hash }
  let(:provider){ described_class.new }

  before{ Fog.mock! }

  describe '#get' do
    describe 'when os settings' do
      let(:settings_file){ 'spec/assets/microbosh_settings.os.yml' }

      before do
        allow(YAML).to receive(:load_file)
          .with('/var/lib/jenkins/.microbosh/settings.yml').and_return(settings)
      end

  # * { protocol: "rdp", ports: (3398..3398), ip_ranges: [ { cidrIp: "196.212.12.34/32" } ] }
      it 'creates a sg' do
        expect_any_instance_of(Cyoi::Providers::Clients::OpenStackProviderClient).to receive(:create_security_group)
          .with('ssh','cf seg group for ssh',
                { ports: ['22'], protocol: 'tcp'})
        provider.create_security_group('ssh','cf seg group for ssh',
                { ports: ['22'], protocol: 'tcp'})

      end
    end
  end
end
