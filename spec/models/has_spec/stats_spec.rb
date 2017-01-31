require 'rails_helper'

RSpec.describe Has::Stats do
  let :zendark { create :zendark }

  before do
    Character.include Has::Stats
  end

  it 'allows to fetch stat values transparently' do
    expect(zendark.hp).to eq 12
    expect(zendark.strength).to eq 85
  end

  it 'allows to fetch base_stat values transparently' do
    expect(zendark.base_hp).to eq 10
    expect(zendark.base_strength).to eq 65
  end

  it 'shouldn\'t try to get values of non-existent stats or base stats' do
    expect(zendark).to_not respond_to :schlagavuk
    expect(zendark).to_not respond_to :base_schlagavuk

    expect { zendark.schlagavuk      }.to raise_error NoMethodError
    expect { zendark.base_schlagavuk }.to raise_error NoMethodError
  end

  it 'sets up a relation to Stats' do
    expect(zendark).to respond_to :stats
  end

  it 'sets up a relation to BaseStats' do
    expect(zendark).to respond_to :base_stats
  end
end
