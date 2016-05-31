require 'unit/spec_helper'

describe 'sprout-android::default' do
  let(:runner) { ChefSpec::SoloRunner.new }

  before do
    stub_command('which git')
  end

  it 'includes the sdk recipe' do
    runner.converge(described_recipe)
    expect(runner).to include_recipe('sprout-android::sdk')
  end

  it 'includes the bash_it recipe' do
    runner.converge(described_recipe)
    expect(runner).to include_recipe('sprout-android::bash_it')
  end

  it 'includes the haxm recipe' do
    runner.converge(described_recipe)
    expect(runner).to include_recipe('sprout-android::haxm')
  end
end
