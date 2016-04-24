require 'spec_helper'

describe Flags::Configuration do

  before do
    FeatureSettings.configure do |config|
      config.test_value = true
      config.test_value1 = false
      config.test_value2 = 'Test value'
    end
  end

let(:config){Flags::Configuration.new}



  describe '#initialize ' do
    it 'it will return Configuration instance' do
      expect(Flags::Configuration.new).to  be_an_instance_of(Flags::Configuration)
    end

    it 'it will set attribute accessor' do
      expect(Flags::Configuration.new).to  be_an_instance_of(Flags::Configuration)
    end

  end

  describe 'alias_method' do
    context 'when accessing boolean value' do
      it 'it add question mark on attribute reader' do
        expect(config.test_value?).to be_truthy
      end
    end
    context 'when accessing not boolean value' do
      it 'it do not have question mark on attribute reader' do
        expect(config.test_value2).to eq('Test value')
      end
    end
  end

  describe 'attributes' do

  it 'allows access for attributes' do
    expect(config.test_value?).to be_truthy
    expect(config.test_value1?).to be_falsey
    expect(config.test_value2).to eq('Test value')
  end

  # it 'allows reading and writing for :amaunt' do
  #
  # end

end

end
