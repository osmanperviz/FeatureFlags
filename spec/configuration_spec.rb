require 'spec_helper'

describe Flags::Configuration do
  include_context "shared_config_block"


let(:config){Flags::Configuration.new}

  describe '#initialize ' do
    it 'it will return Configuration instance' do
      expect(described_class.new).to  be_an_instance_of(described_class)
    end

    it 'it will set attribute accessor' do
      expect(described_class.new).to  be_an_instance_of(described_class)
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
        expect(config.test_value2).to eq('Test data')
      end
    end
  end

  describe 'attributes' do

  it 'has configurated attributes' do
    expect(config.test_value?).to be_truthy
    expect(config.test_value1?).to be_falsey
    expect(config.test_value2).to eq('Test data')
  end

end

end
