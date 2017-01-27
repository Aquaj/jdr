require 'rails_helper'

RSpec.describe 'Character Inventory', type: :model do
  it 'can be listed altogether' do
    expect(create(:zendark).inventory)
      .to eq([Weapon.find_by_name('Big Mace'), 
              Armour.find_by_name('Plaid shirt'),
              Thing.find_by_name('Candles')])
  end

  it 'can be listed as various inventories based on location' do
    expect(create(:zendark)).to respond_to(:inventories)
  end

  it 'can be gotten as a specific location\'s inventory' do
    expect(create(:zendark).inventory(:bag))
      .to eq([Thing.find_by_name('Candles')])
  end

  it 'can have some weapons' do
    expect(create(:zendark).weapons).to eq([Weapon.find_by_name('Big Mace')])
  end

  it 'can have armours' do
    expect(create(:zendark).armours).to eq([Armour.find_by_name('Plaid shirt')])
  end

  it 'can have random stuff' do
    expect(create(:zendark).things).to eq([Thing.find_by_name('Candles')])
  end

  it 'can be added new items' do
    zendark = create(:zendark)
    zendark.add_to_inventory(:bag, create(:burger_king))
    expect(zendark.inventory_at(:bag))
      .to eq([Thing.find_by_name('Candles'),
              Thing.find_by_name('Burger King')])
  end
end
