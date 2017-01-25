require 'rails_helper'

RSpec.describe Character, type: :model do
  subject(:character) { create(:character) }
  it { should respond_to(:stats) }
  it { should respond_to(:base_stats) }

  context 'using stat_for' do
    it 'can get the base_stat value' do
      expect(create(:zendark).base_stat_for :strength)
          .to_eq 65
    end

    it 'can get the stat\'s value' do
      expect(create(:zendark).base_stat_for :strength)
          .to_eq 85
    end
  end

  context 'using base_stat_of' do
    it 'can get the base_stat value' do
      expect(create(:zendark).base_stat_of :strength)
          .to_eq 65
    end

    it 'can get the stat\'s value' do
      expect(create(:zendark).base_stat_of :strength)
          .to_eq 85
    end
  end
end
