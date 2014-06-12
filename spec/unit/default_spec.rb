require 'unit/spec_helper'

describe 'sprout-android::default' do
  let(:runner) { ChefSpec::Runner.new }

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
