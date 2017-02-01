require 'rails_helper'

RSpec.describe Has::Inventories, type: :model do
  let :zendark     { create         :zendark     }
  let :candles     { find_or_create :candles     }
  let :burger_king { find_or_create :burger_king }
  let :big_mace    { find_or_create :big_mace    }
  let :plaid_shirt { find_or_create :plaid_shirt }

  before do
    Character.include Has::Inventories
  end

  it 'should include Has::Items when included' do
    expect(Character.included_modules).to include Has::Items
  end

  it 'allows to list the items altogether regardless of inventory' do
    expect(zendark.inventory).to contain_exactly big_mace, plaid_shirt, candles
  end

  it 'adds a relation to inventories' do
    expect(zendark).to respond_to :inventories
  end

  it 'adds a relation to get the inventory changes' do
    expect(zendark).to respond_to :inventory_changes
  end

  it 'allows to get a specific inventory\'s items by location' do
    expect(zendark.inventory :bag).to contain_exactly candles
  end

  it 'allows us to add items to an inventory' do
    zendark.add_to_inventory :bag, burger_king => 15
    expect(zendark.inventory :bag).to include burger_king
  end
end
