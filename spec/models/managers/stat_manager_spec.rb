require 'rails_helper'

RSpec.describe Managers::StatManager do
  let :zendark { create :zendark                   }
  let :manager { Managers::StatManager.new zendark }

  it 'allows to fetch stat values transparently' do
    expect(manager.hp).to eq 12
    expect(manager.strength).to eq 85
  end

  it 'allows to fetch base_stat values transparently' do
    expect(manager.base_hp).to eq 10
    expect(manager.base_strength).to eq 65
  end

  it 'shouldn\'t try to get values of non-existent stats or base stats' do
    expect(manager).to_not respond_to :schlagavuk
    expect(manager).to_not respond_to :base_schlagavuk

    expect { manager.schlagavuk      }.to raise_error NoMethodError
    expect { manager.base_schlagavuk }.to raise_error NoMethodError
  end
end
