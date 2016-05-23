module Acessors
  def attr_accessor_with_history(*names)
    names.each do |name|
      var_name = "@#{name}".to_sym
      define_method(name) { instance_variable_get(var_name) }
      define_method("#{name}=".to_sym) { |value| instance_variable_set(var_name, value); @array_name = [] if @array_name.nil?; @array_name << instance_variable_get(var_name) }
      define_method("#{name}_history".to_sym) { puts @array_name.inspect }
    end
  end
end

class Test
  extend Acessors

  attr_accessor_with_history :a, :b, :c
end
