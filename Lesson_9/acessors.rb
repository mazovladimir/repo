module Acessors
  def attr_accessor_with_history(*names)
    names.each do |name|
      var_name = "@#{name}".to_sym
      array_name = "@#{name}_array".to_sym
      define_method(name) { instance_variable_get(var_name) }
      define_method("#{name}=".to_sym) do |value| 
        instance_variable_set(array_name, []) unless instance_variable_defined?(array_name)
        instance_variable_get(array_name) << instance_variable_get(var_name) unless instance_variable_get(var_name).nil?
        instance_variable_set(var_name, value)
      end               
      define_method("#{name}_history".to_sym) { p instance_variable_get(array_name) }
    end
  end

  def strong_attr_acessor(attr, myclass)
    attr_name = "@#{attr}".to_sym
    class_name = "@#{myclass}"
    define_method(attr) { instance_variable_get(attr_name) }
    define_method("#{attr}=".to_sym) do |value| 
      instance_variable_set(attr_name, value) if instance_variable_get(attr_name).class == class_name
    end
  end
end

class Test
  extend Acessors

  attr_accessor_with_history :a, :b, :c
end
