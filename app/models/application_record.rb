class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.can_have property
    singleton_class.instance_eval do

      define_method :"has_#{property}" do
        module_name = property.to_s.capitalize
        prop_module = Has.const_get module_name

        include prop_module
      end
    end
  end

  can_have :stats
  can_have :inventories
  can_have :items
  can_have :careers
end
