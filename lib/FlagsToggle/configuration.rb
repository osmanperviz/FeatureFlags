module Flags
  class Configuration

    def initialize()
      binding.pry
      attributes = FeatureSettings.get_attributes
      attributes.each do |key,value|
        add_attr(key, value)
      end

      override_with_envairments
      freeze
    end

private

    def add_attr(name, value)
      self.class.send(:attr_accessor, name)
      self.send("#{name}=",value)
      self.class.send(:alias_method,"#{name.to_sym}?",name) if [true, false].include? value
      self.class.send(:private,name.to_sym) if [true, false].include? value
    end

    def override_with_envairments
      ENV.to_hash.each do |key,value|
        self.send("#{key.downcase.to_sym}=",value) if self.respond_to?(key.downcase.to_sym)
      end
    end

  end
end
