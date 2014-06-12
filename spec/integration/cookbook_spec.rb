require 'spec_helper'

describe 'sprout-android' do
  before :all do
    expect(File).not_to be_exists("#{ENV['HOME']}/android")
    expect(system('soloist')).to be_true
  end

  it 'is installs the android sdk' do
    expect(system('which android')).to be(true)
  end
end
