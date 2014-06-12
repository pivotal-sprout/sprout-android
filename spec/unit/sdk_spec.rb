require 'unit/spec_helper'

describe 'sprout-android::sdk' do
  let(:runner) { ChefSpec::Runner.new }

  it 'installs the android-sdk package' do
    runner.converge(described_recipe)
    expect(runner).to install_package('android-sdk')
  end
end
