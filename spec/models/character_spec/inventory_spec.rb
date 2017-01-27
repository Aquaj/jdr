require 'rails_helper'

RSpec.describe 'Character Inventory', type: :model do
  let(:zendark)     { Character.find_by_name('Zendark')  || create(:zendark) }
  let(:candles)     { Thing.find_by_name('Candles')      || create(:candles) }
  let(:burger_king) { Thing.find_by_name('Burger King')  || create(:burger_king) }
  let(:big_mace)    { Weapon.find_by_name('Big Mace')    || create(:big_mace) }
  let(:plaid_shirt) { Armour.find_by_name('Plaid Shirt') || create(:plaid_shirt) }

  it 'can be listed altogether' do
    expect(zendark.inventory).to eq [big_mace, plaid_shirt, candles]
  end

  it 'can be listed as various inventories based on location' do
    expect(zendark).to respond_to :inventories
  end

  it 'can be gotten as a specific location\'s inventory' do
    expect(zendark.inventory(:bag)).to eq [candles]
  end

  it 'can have some weapons' do
    expect(zendark.weapons).to eq [big_mace]
  end

  it 'can have armours' do
    expect(zendark.armours).to eq [plaid_shirt]
  end

  it 'can have random stuff' do
    expect(zendark.things).to eq [candles]
  end

  it 'can be added new items' do
    zendark.add_to_inventory :bag, burger_king
    expect(zendark.inventory(:bag)).to eq [candles, burger_king]
  end
end
