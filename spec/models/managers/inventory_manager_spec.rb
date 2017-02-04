require 'rails_helper'

RSpec.describe Managers::InventoryManager, type: :model do
  let :zendark     { create         :zendark                }
  let :candles     { find_or_create :candles                }
  let :burger_king { find_or_create :burger_king            }
  let :big_mace    { find_or_create :big_mace               }
  let :plaid_shirt { find_or_create :plaid_shirt            }

  let :manager     { Managers::InventoryManager.new zendark }

  it 'allows to list the items altogether regardless of inventory' do
    expect(manager.inventory).to contain_exactly big_mace, plaid_shirt, candles
  end

  it 'allows to get a specific inventory\'s items by location' do
    expect(manager.inventory :bag).to contain_exactly candles
  end

  it 'allows us to add items to an inventory' do
    manager.add_to_inventory :bag, burger_king => 15
    expect(manager.inventory :bag).to include burger_king
  end
end
