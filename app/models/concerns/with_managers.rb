module WithManagers
  extend ActiveSupport::Concern

  included do
    singleton_class.instance_eval do
      attr_reader :manager_classes

      Managers.each do |manager|
        property = manager.managed_attribute.to_s
        resource = property.singularize

        define_method :"has_#{property}" do
          after_initialize :"set_#{resource}_manager"
          after_initialize :enforce_manager_contracts

          @manager_classes ||= []
          @manager_classes << manager

          define_method :"set_#{resource}_manager" do
            @managers ||= []
            @managers << manager.new(self)
          end
        end
      end
    end
  end

  def method_missing method_name, *args, &block
    manager = manager_for_method method_name
    return_value = manager&.send method_name, *args, &block
    return_value || super
  end

  def respond_to_missing? method_name, _include_private = false
    manager_for_method method_name
  end

  def manager_for_method method
    # First-pass w/ method_defined? to avoid the #method_missing calls
    manager = @managers&.find { |mngr| mngr.method_defined? method }
    manager || @managers&.find { |mngr| mngr.respond_to? method }
  end

  def enforce_manager_contracts
    return unless @managers.count == self.class.manager_classes.count
    @managers.each do |manager|
      manager.enforce_contract!
    end
  end
end
