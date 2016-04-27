FeatureSettings.config do |config|
  #config.test_value = true


  if Rails.env.production?
    #config.test_value = false
  end

  if Rails.env.development?

  end

  if Rails.env.test?

  end


end
