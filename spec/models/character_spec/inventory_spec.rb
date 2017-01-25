require 'rails_helper'

RSpec.describe Character, type: :model do
  it 'knows its inventory' do
    expect(create(:zendark).inventory)
      .to eq(Weapon.find_by_name('Big Mace'), 
             Armour.find_by_name('Plaid shirt'),
             Thing.find_by_name('Candles'))
  end

  it 'knows the weapons in its inventory' do
    expect(create(:zendark).weapons).to eq([Weapon.find_by_name('Big Mace')])
  end

  it 'knows the armours in its inventory' do
    expect(create(:zendark).armours).to eq([Armour.find_by_name('Plaid shirt')])
  end

  it 'knows the random stuff in its inventory' do
    expect(create(:zendark).things).to eq([Thing.find_by_name('Candles')])
  end

  it 'can add items to its inventory' do
  end
end
