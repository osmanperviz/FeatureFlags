require "FlagsToggle/version"
require "FlagsToggle/feature_settings"
require "FlagsToggle/configuration"

require 'pry'

module Flags
 class << self
   attr_accessor :config

   def config
     @config ||= Configuration.new()
   end

 end
end
