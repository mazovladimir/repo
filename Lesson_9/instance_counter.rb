module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def instances
    end
  end

  module InstanceMethods
    def register_instance
      @instance_increase = ObjectSpace.each_object(self.class).count
      @instance_increase += 1
    end
  end
end
