module Flags
  class Configuration

    def initialize()
      attributes = FeatureSettings.get_attributes
      attributes.each do |key,value|
        add_attr(key, value)
      end
      freeze
      #self.class.send(:private,*attributes.keys)
    end

private

    def add_attr(name, value)
      self.class.send(:attr_accessor, name)
      instance_variable_set("@#{name}", value)
      self.class.send(:alias_method,"#{name.to_sym}?",name) if [true, false].include? value
      self.class.send(:private,name) if [true, false].include? value
    end

  end
end
