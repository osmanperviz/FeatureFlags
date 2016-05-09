FeatureSettings.config do |config|
  # Here you put default values.
  # You can override them in envairmant conditions.

  if Rails.env.production?
    #Some production envairmant override
  end

  if Rails.env.development?
    #Some development envairmant override
  end

  if Rails.env.test?
    #Some test envairmant override
  end
  
end
