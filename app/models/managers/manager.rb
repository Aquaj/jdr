module Managers
  class Manager
    attr_reader :owner

    def initialize owner
      @owner = owner
      self.class.enforce_contract_with! @owner
    end

    def self.managed_attribute
      name.match(/Managers::(\w+)Manager/)[1].downcase.pluralize
    end

    def self.needs_from_owner *attributes
      @needs ||= []
      @needs += attributes.each do |attribute|
        delegate attribute, to: :owner
        private attribute # Avoids endless loop of delegation.
      end
    end

    def self.enforce_contract_with! object
      breaking = @needs.reject { |need| object.respond_to? need }
      return true if breaking.empty?
      raise ContractBrokenException,
            "#{self.name} expected #{object} to define #{breaking}."
    end

    def method_defined? method_name
      methods.include? method_name
    end
  end
end

class ContractBrokenException < Exception; end
