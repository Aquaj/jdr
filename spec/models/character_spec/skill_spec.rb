require 'rails_helper'

RSpec.describe 'Character Skills', type: :model do
  let :zendark { Character.find_by_name('Zendark') || create(:zendark) }

  describe '#gets_talent' do
    let :strong   { Talent.find_by_name('Strong AF') || create(:strong_af) }
    let :gay      { Talent.find_by_name('Gay')       || create(:gay) }
    let :fabulous { Talent.find_by_name('Fabulous')  || create(:fabulous) }
    let :lethal   { Talent.find_by_name('Lethal')    || create(:lethal) }
    let :secret   { Talent.find_by_name('Secret')    || create(:secret_talent) }

    it 'adds a new talent to the char' do
      zendark.gets_talent fabulous
      expect(zendark.talents).to eq [strong, gay, fabulous]
    end

    it 'errors when new talent is not available' do
      expect { zendark.gets_talent lethal }
        .to raise_error TalentUnavailableException
    end

    it 'errors when new talent is not known' do
      expect { zendark.gets_talent secret }
        .to raise_error TalentUnknownException
    end
  end

  describe '#gets_ability' do
    let :dancing    { Ability.find_by_name('Dancing')       || create(:dancing) }
    let :punching   { Ability.find_by_name('Punching')      || create(:punching) }
    let :sassy_snap { Ability.find_by_name('Sassy Snap')    || create(:sassy_snap) }
    let :death_snap { Ability.find_by_name('Snap of Death') || create(:snap_of_death) }
    let :secret     { Ability.find_by_name('Secret')        || create(:secret_ability) }

    it 'adds a new ability to the char' do
      zendark.gets_ability sassy_snap
      expect(zendark.abilities).to eq [dancing, punching, sassy_snap]
    end

    it 'errors when new ability is not available' do
      expect { create(:zendark).gets_ability death_snap }
        .to raise_error AbilityUnavailableException
    end

    it 'errors when new ability is not known' do
      expect { create(:zendark).gets_ability secret }
        .to raise_error AbilityUnknownException
    end
  end
end
