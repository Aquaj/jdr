require 'rails_helper'

RSpec.describe Managers::ItemManager, type: :model do
  let :bag           { create         :bag                 }
  let :horsebags     { create         :horsebags           }
  let :candles       { find_or_create :candles             }
  let :big_mace      { find_or_create :big_mace            }
  let :plaid_shirt   { find_or_create :plaid_shirt         }

  let :bag_manager   { Managers::ItemManager.new bag       }
  let :horse_manager { Managers::ItemManager.new horsebags }

  it 'allows to list the items altogether' do
    expect(horse_manager.items)
      .to contain_exactly big_mace, plaid_shirt
  end

  it 'provides a way to get the enc due to a specific item' do
    expect(bag_manager.enc_for candles).to eq 5
  end

  it 'provides a way to know the total enc' do
    expect(horse_manager.enc).to eq 5
  end

  it 'provides the quantity of an item' do
    expect(horse_manager.quantity_of plaid_shirt).to eq 1
  end
end
