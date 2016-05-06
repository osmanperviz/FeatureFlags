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

       if Rails.env.production?
         config.test_value = false
         config.app_id = 'Production_id'
       end

       if Rails.env.development?

       end

       if Rails.env.test?

       end
     end
If your value is a boolean you will access them with question mark at the end:
    Feature.config.test_value?
    
If you value is string or number you will access on normal(Regular) way:
    Feature.config.app_id  




## Contributing

* Fork the project.

* Make your feature addition or bug fix.

* Commit, do not mess with rakefile, version, or history. (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
