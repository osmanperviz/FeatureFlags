# featureToggle
A flagsToggle is a branching point that your code can utilize to determine whether or not a feature should be made available to one or more customers.Enable a feature for a specific set of users, or just your team for them to try it out before it's rolled out for everyone.
## Installation

Add this line to your application's Gemfile:


    gem 'featureToggle'


And then execute:

     $ bundle

Or install it yourself as:

    $ gem install featureToggle

## Usage
 Run "flags_toggle_config" command will generate under AppRoot/config//initializers/Flags.rb file.All configuration will be placed in this file.

 * This will generate file like this:

         FeatureSettings.config do |config|

             config.test_value = true
             config.app_id = 'Some_id'
             config.desktop_subdomain = 'www'
             config.enable_some_feature = true

           if Rails.env.production?
             config.test_value = false
             config.app_id = 'Production_id'
             config.enable_some_feature = false
           end

           if Rails.env.development?
           end

           if Rails.env.staging?
           config.desktop_subdomain = 'staging'
           end
         end

If your value is a boolean(PREDICATE) you will access them with question mark at the end:
          Feature.config.test_value?

If you value is string or number(NO PREDICATE) you will access on normal(Regular) way:
          Feature.config.app_id

* Use Feature in your production code
          desktop_subdomain = Feature.config.desktop_subdomain
or
          if Flags.config.enable_some_feature do
            #do something
          end    



## Contributing

* Fork the project.

* Make your feature addition or bug fix.

* Commit, do not mess with rakefile, version, or history. (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
