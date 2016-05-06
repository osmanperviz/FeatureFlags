require 'spec_helper'
require "shared_stuff.rb"

describe FeatureSettings do
  include_context "shared_config_block"

  describe '.get_attributes' do

    it 'it return Hash type' do
      expect(FeatureSettings.get_attributes).to be_a(Hash)
    end

    it 'it assign attributes to class trought method_mising' do
      expect(FeatureSettings.get_attributes).to include(:overrided_value => "Some data",:test_value => true, :test_value1 => false, :test_value2 => 'Test data')
    end

    it 'it return correct value ' do
      expect(FeatureSettings.get_attributes).to include(:overrided_value => "Some data",:test_value => true, :test_value1 => false, :test_value2 => 'Test data')
    end
  end

end
