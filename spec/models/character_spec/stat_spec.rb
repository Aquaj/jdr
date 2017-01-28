require 'rails_helper'

RSpec.describe 'Character Stats', type: :model do
  let :zendark { find_or_create(:zendark) }

  it 'can list stats' do
    expect(zendark).to respond_to :stats
  end

  it 'can list base stats' do
    expect(zendark).to respond_to :base_stats
  end

  context 'using stat_for' do
    it 'can get the base_stat value' do
      expect(zendark.base_stat_for :strength).to_eq 65
    end

    it 'can get the stat\'s value' do
      expect(zendark.stat_for :strength).to_eq 85
    end
  end

  context 'using base_stat_of' do
    it 'can get the base_stat value' do
      expect(zendark.base_stat_of :strength).to_eq 65
    end

    it 'can get the base stat\'s value' do
      expect(zendark.stat_of :strength).to_eq 85
    end
  end
end
