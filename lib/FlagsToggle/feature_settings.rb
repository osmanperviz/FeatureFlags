class FeatureSettings

  def self.configure
    yield(self)
  end


  def self.method_missing(m, *args, &block)

   name = m.to_s
   aname = name.sub("=","")

   self.class.module_eval do
      attr_accessor aname
   end
   send name, args.first unless aname == name
  end

  def self.get_attributes
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
