require 'spec_helper'
require 'pry'

describe Flags do

  before do
    FeatureSettings.configure do |con|
      con.test_value = true
      con.test_value1 = false
      con.test_value2 = 'Test data'
    end
  end

  describe ".config" do

    it "it has a config " do
      expect(Flags.config).to be_a Flags::Configuration
    end

    it "it access config boolean value with question mark at the end " do
      expect(Flags.config.test_value?).to be_truthy
    end

    it "it access config none boolean value withot question mark at the end " do
      expect(Flags.config.test_value2).to eq('Test data')
    end

    it 'it retuns right value' do
      expect(Flags.config.test_value?).to eq(true)
      expect(Flags.config.test_value1?).to eq(false)
      expect(Flags.config.test_value2).to eq('Test data')
    end

  end


end
