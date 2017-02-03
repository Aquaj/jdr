class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.can_have property
    singleton_class.instance_eval do

      define_method :"has_#{property}" do
        resource = property.to_s.singularize
        after_initialize :"set_#{resource}_manager"

        define_method :"set_#{resource}_manager" do
          @managers ||= []
          manager_class = "managers/#{resource}_manager".classify.constantize
          @managers << manager_class.new(self)
        end
      end
    end
  end

  def method_missing method_name, *args, &block
    manager = manager_for_method method_name
    return_value = manager&.send method_name, *args, &block
    return_value || super
  end

  def respond_to_missing? method_name, _include_private = false
    manager_for_method method_name
  end

  def manager_for_method method_name
    @managers.find { |manager| manager.respond_to? method_name }
  end

  can_have :stats
  # can_have :inventories
  # can_have :items
  # can_have :careers
end
