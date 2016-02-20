require 'spec_helper'
require 'yaml'

describe MarsExplorer do
  it 'has a version number' do
    expect(MarsExplorer::VERSION).not_to be nil
  end

  describe '.run' do
    Dir[File.join('spec', 'fixtures', '**', 'scenario_*.yml')].each do |file|
      context "with scenario #{file}" do
        let(:scenario) { YAML.load_file(file)[:scenario] }
        let(:input) { StringIO.new(scenario[:input]) }

        specify do
          expect { described_class.run(input) }.to output(scenario[:output]).to_stdout
        end
      end
    end
  end
end
