require 'rails_helper'

RSpec.describe Managers::Manager do
  let :owner do
    owner_class = Struct.new :name
    owner_class.new name: 'Mr Monopoly'
  end

  let :bad_owner do
    owner_class = Struct.new :title
    owner_class.new title: 'Lord Byron'
  end

  let :hello_manager_class do
    class Managers::HelloManager < Managers::Manager
      needs_from_owner :name

      def hello
        puts "Hello I manage for #{name}."
      end
    end

    Managers::HelloManager
  end

  let :hello_manager do
    hello_manager_class.new owner
  end

  it 'has an owner' do
    manager = Managers::Manager.new owner
    expect(manager.owner).to eq owner
  end

  it 'can declare a contract to fulfill by its owner' do
    expect(hello_manager_class.contract).to contain_exactly :name
  end

  it 'can raise errors if contract is not fulfilled' do
    expect { hello_manager.enforce_contract! }
      .not_to raise_error
    expect { hello_manager_class.new(bad_owner).enforce_contract! }
      .to raise_error ContractBrokenException

    expect { hello_manager_class.enforce_contract_with! owner     }
      .not_to raise_error
    expect { hello_manager_class.enforce_contract_with! bad_owner }
      .to raise_error ContractBrokenException
  end

  it 'knows what it manages' do
    expect(hello_manager.managed_attribute      ).to eq 'hellos'
    expect(hello_manager_class.managed_attribute).to eq 'hellos'
  end
end
