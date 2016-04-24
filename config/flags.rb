FeatureSettings.config do |config|

    #convig.test_value = true

  if Rails.env.production?
    #convig.test_value = false
  end
  if Rails.env.development?

  end
  if Rails.env.test?

  end


end
