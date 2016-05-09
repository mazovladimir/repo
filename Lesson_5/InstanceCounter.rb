module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def instances
      puts "Total count of instances: #{ObjectSpace.each_object(self).count}"
    end
  end

  module InstanceMethods
    def register_instance
      instance_increase = ObjectSpace.each_object(self.class).count
      instance_increase+=1
      puts "Instance count was increased by 1 now it is - #{instance_increase}, but was - #{ObjectSpace.each_object(self.class).count}"
    end
  end
end
