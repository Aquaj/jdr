require 'rails_helper'

RSpec.describe 'Character Inventory', type: :model do
  let :zendark     { find_or_create(:zendark)     }
  let :candles     { find_or_create(:candles)     }
  let :burger_king { find_or_create(:burger_king) }
  let :big_mace    { find_or_create(:big_mace)    }
  let :plaid_shirt { find_or_create(:plaid_shirt) }

  it 'can be listed altogether' do
    expect(zendark.inventory).to contain_exactly big_mace, plaid_shirt, candles
  end

  it 'can be listed as various inventories based on location' do
    expect(zendark).to respond_to :inventories
  end

  it 'can be gotten as a specific location\'s inventory' do
    expect(zendark.inventory(:bag)).to contain_exactly candles
  end

  it 'can have some weapons' do
    expect(zendark.weapons).to contain_exactly big_mace
  end

  it 'can have armours' do
    expect(zendark.armours).to contain_exactly plaid_shirt
  end

  it 'can have random stuff' do
    expect(zendark.things).to contain_exactly candles
  end

  it 'can be added new items' do
    zendark.add_to_inventory :bag, burger_king
    expect(zendark.inventory(:bag)).to contain_exactly candles, burger_king
  end
end
