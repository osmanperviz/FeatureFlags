class FeatureSettings

  class << self

    def configure
      yield(self)
    end

    def method_missing(m, *args, &block)
     name = m.to_s
     aname = name.sub("=","")

     self.class.module_eval do
        attr_accessor aname
     end
     send name, args.first unless aname == name
    end

    def get_attributes
      attrs = Hash.new
      instance_variables.each do |var|
        str = var.to_s.gsub /^@/, ''
        if respond_to? "#{str}="
          attrs[str.to_sym] = instance_variable_get var
        end
      end
      attrs
    end
  end
end
