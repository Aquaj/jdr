require 'rails_helper'

RSpec.describe Has::Items, type: :model do
  let :bag         { create         :bag         }
  let :horsebags   { create         :horsebags   }
  let :candles     { find_or_create :candles     }
  let :big_mace    { find_or_create :big_mace    }
  let :plaid_shirt { find_or_create :plaid_shirt }

  before do
    Inventory.include Has::Inventories
  end

  it 'allows to list the items altogether' do
    expect(horsebags.items).to contain_exactly big_mace, plaid_shirt
  end

  it 'provides a weapon list' do
    expect(horsebags.weapons).to contain_exactly big_mace
  end

  it 'provides an armour list' do
    expect(horsebags.armours).to contain_exactly plaid_shirt
  end

  it 'provides a list of the other things' do
    expect(bag.things).to contain_exactly candles
  end
end
