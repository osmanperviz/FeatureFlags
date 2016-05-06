# featureToggle
A flagsToggle is a branching point that your code can utilize to determine whether or not a feature should be made available to one or more customers.This simple gem allow you to enable a feature for a specific set of users, or just your team for them to try it out before it's rolled out for everyone.
## Installation

Add this line to your application's Gemfile:


    gem 'featureToggle'


And then execute:

     $ bundle

Or install it yourself as:

    $ gem install featureToggle

## Usage
 Run "rake flags_toggle_config" command will generate under AppRoot/config/initializers/Flags.rb file.All configuration will be placed in this file.You may also specify a Rails environment to use a new feature (eg.  in all environments, but not in production):

 * This will generate file like this:

         FeatureSettings.config do |config|

             config.app_id = 'Some_id'
             config.enable_some_feature = true
             config.desktop_subdomain = 'Some default subdomain'

           if Rails.env.production?
             config.app_id = 'Production_id'
             config.enable_some_feature = false
             config.desktop_subdomain = 'www'
           end

           if Rails.env.development?
           end

           if Rails.env.staging?
             config.desktop_subdomain = 'staging'
           end
         end

If your value is a boolean(PREDICATE) you will access them with question mark at the end:

          Feature.config.test_value? # true/false

If you value is string or number(NON PREDICATE) you will access on normal(Regular) way:

          Feature.config.app_id # some string or number

## Use Feature in your production code

          desktop_subdomain = Feature.config.desktop_subdomain # eg. 'www'

or

          if Flags.config.enable_some_feature? do
            #do something
          end    

## Environment variable overriding
In flagsToggle gem environment variable automatically override you custom configuration.


## Contributing

* Fork the project.

* Make your feature addition or bug fix.

* Commit, do not mess with rakefile, version, or history. (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
