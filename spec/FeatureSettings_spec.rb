require 'spec_helper'
describe FeatureSettings do
  before do
    FeatureSettings.configure do |config|
      config.test_value = true
      config.test_value1 = false
      config.test_value2 = 'Test value'
    end
  end


  describe '.get_attributes' do

    it 'it assign attributes to class trought method_mising' do
      expect(FeatureSettings.get_attributes).to include(:test_value => true, :test_value1 => false, :test_value2 => 'Test value')
    end

    it 'it return Hash type' do
      expect(FeatureSettings.get_attributes).to be_a(Hash)
    end

    it 'it return correct value ' do
      expect(FeatureSettings.get_attributes).to include(:test_value => true, :test_value1 => false, :test_value2 => 'Test value')
    end

  end

end
