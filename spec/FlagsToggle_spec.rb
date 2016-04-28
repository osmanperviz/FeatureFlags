require "shared_stuff.rb"
require 'spec_helper'
require 'pry'
require 'Rails'

 describe Flags do

  describe ".config" do

    context 'load default development environment' do
      include_context "shared_config_block"

      it "it has a config instance " do
        expect(described_class.config).to be_a Flags::Configuration
      end

      it "it access config boolean value with question mark at the end " do
        expect(described_class.config.test_value?).to be_truthy
      end

      it "it access config none boolean value withot question mark at the end " do
        expect(described_class.config.test_value2).to eq('Test data')
      end

      it 'it retuns right value' do
        expect(described_class.config.test_value?).to eq(true)
        expect(described_class.config.test_value1?).to eq(false)
        expect(described_class.config.test_value2).to eq('Test data')
      end

      it 'override with environment variables' do
        expect(described_class.config.overrided_value).to eq('Some overrided data')
      end

    end

    context "load production environment"  do
      before do
        Flags.config = nil
        allow(Rails).to receive(:env).and_return(ActiveSupport::StringInquirer.new('production'))
        stub_const('ENV', {'OVERRIDED_VALUE' => 'Some overrided data'})
        FeatureSettings.configure do |con|
          con.test_value = true
          con.test_value1 = false
          con.test_value2 = 'Test data'
          con.test_value = false if Rails.env.production?
          con.test_value1 = true if Rails.env.production?
          con.test_value2 = 'Test data for testing' if Rails.env.production?
          con.overrided_value = "Some data"
        end
      end


      it 'it retuns right value' do
        expect(described_class.config.test_value?).to eq(false)
        expect(described_class.config.test_value1?).to eq(true)
        expect(described_class.config.test_value2).to eq('Test data for testing')
      end

      it 'override with environment variables' do
        expect(Flags.config.overrided_value).to eq('Some overrided data')
      end
    end

  end
end
