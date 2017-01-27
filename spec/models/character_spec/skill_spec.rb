require 'rails_helper'

RSpec.describe 'Character Skills', type: :model do
  describe '#gets_talent' do
    it 'adds a new talent to the char' do
      zendark = create(:zendark)
      zendark.gets_talent('Fabulous')
      expect(zendark.talents)
        .to eq(Talent.where(name: ['Strong AF', 'Gay', 'Fabulous']))
    end

    it 'errors when new talent is not available' do
      expect { create(:zendark).gets_talent('Lethal') }
        .to raise_error TalentUnavailableException
    end

    it 'errors when new talent is not known' do
      expect { create(:zendark).gets_talent('Secret') }
        .to raise_error TalentUnknownException
    end

    it 'errors when new talent doesn\'t exist' do
      expect { create(:zendark).gets_talent('NonExistent') }
        .to raise_error NoTalentException
    end
  end

  describe '#gets_ability' do
    it 'adds a new ability to the char' do
      zendark = create(:zendark)
      zendark.gets_ability('Sassy Snap')
      expect(zendark.abilities)
        .to eq(Abilities.where(name: ['Dancing', 'Punching', 'Sassy Snap']))
    end

    it 'errors when new ability is not available' do
      expect { create(:zendark).gets_ability('Snap of Death') }
        .to raise_error AbilityUnavailableException
    end

    it 'errors when new ability is not known' do
      expect { create(:zendark).gets_ability('Secret') }
        .to raise_error AbilityUnknownException
    end

    it 'errors when new ability doesn\'t exist' do
      expect { create(:zendark).gets_ability('NonExistent') }
        .to raise_error NoAbilityException
    end
  end
end
