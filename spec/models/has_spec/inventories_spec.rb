require 'rails_helper'

RSpec.describe Has::Inventories, type: :model do
  let :zendark     { create(:zendark)     }
  let :candles     { find_or_create(:candles)     }
  let :burger_king { find_or_create(:burger_king) }
  let :big_mace    { find_or_create(:big_mace)    }
  let :plaid_shirt { find_or_create(:plaid_shirt) }

  before do
    Character.include Has::Inventories
  end

  it 'allows to list the items altogether' do
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

  it 'provides a weapon list' do
    expect(zendark.weapons).to contain_exactly big_mace
  end

  it 'provides an armour list' do
    expect(zendark.armours).to contain_exactly plaid_shirt
  end

  it 'provides a list of the other things' do
    expect(zendark.things).to contain_exactly candles
  end
end
