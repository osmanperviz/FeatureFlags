RSpec.shared_context "shared_config_block" do |env|
  before do
    stub_const('ENV', {'OVERRIDED_VALUE' => 'Some overrided data'})

    FeatureSettings.configure do |con|
      con.test_value = true
      con.test_value1 = false
      con.test_value2 = 'Test data'
      con.overrided_value = "Some data"

      con.test_value = false if Rails.env.production?
      con.test_value1 = true if Rails.env.production?
      con.test_value2 = 'Test data for testing' if Rails.env.production?
    end

  end


end
