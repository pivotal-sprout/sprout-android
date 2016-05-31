require 'unit/spec_helper'

describe 'sprout-android::haxm' do
  let(:runner) { ChefSpec::SoloRunner.new }

  it 'depends on the sdk recipe' do
    runner.converge(described_recipe)
    expect(runner).to include_recipe('sprout-android::sdk')
  end
end
