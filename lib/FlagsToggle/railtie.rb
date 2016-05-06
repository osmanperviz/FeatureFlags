require "FlagsToggle"
module Flags
  class Railtie < Rails::Railtie
    railtie_name :Flags
     rake_tasks do
       load 'tasks/flags_toggle_config'
     end
  end   
end
