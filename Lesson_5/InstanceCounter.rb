module InstanceCounter
  module ClassMethods
    def instances
      puts "Total count of instances: #{ObjectSpace.each_object(self).count}"
    end
  end

  module InstanceMethods
    def register_instance
      i_count = ObjectSpace.each_object(self).count
      i_count+=1
      puts "Instance was increased by 1 now - #{i_count}"
    end
  end
end
