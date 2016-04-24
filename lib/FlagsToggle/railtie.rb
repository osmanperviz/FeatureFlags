require "FlagsToggle"
require 'rails'
module Flags
  railtie_name :Flags
   rake_tasks do
     load 'tasks/flags_toggle_config'
   end
end
