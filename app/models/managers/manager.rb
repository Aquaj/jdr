module Managers
  class Manager
    attr_reader :owner

    def initialize boss
      @owner = boss
    end

    def self.managed_attribute
      name.match(/Managers::(\w+)Manager/)[1].downcase.pluralize
    end

    def self.needs_from_owner *attributes
      attributes.each do |attribute|
        delegate attribute, to: :owner
        private attribute # Avoids endless loop of delegation.
      end
    end

    def method_defined? method_name
      methods.include? method_name
    end
  end
end
