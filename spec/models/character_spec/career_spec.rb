require 'rails_helper'

RSpec.describe 'Character Skillset', type: :model do
  describe '#switches_carrer' do
    it 'switches to a new career' do
      zendark = create(:zendark)
      zendark.switch_career(from: 'Diva', to: 'Icon')
      expect(zendark.careers)
        .to eq(Career.where(name: ['Icon', 'Farm Bull']))
    end

    it 'errors when new career is not available' do
      expect { create(:zendark).switch_career(from: 'Diva', to: 'Death Itself') }
        .to raise_error CareerUnavailableException
    end

    it 'errors when new career is not known' do
      expect { create(:zendark).switch_career(from: 'Diva', to: 'Secret') }
        .to raise_error CareerUnknownException
    end

    it 'errors when new carrer doesn\'t exist' do
      expect { create(:zendark).switch_career(from: 'Diva', to: 'NonExistent') }
        .to raise_error NoCareerException
    end

    it 'errors when switching from a career the character doesn\'t have' do
      expect { create(:zendark).switch_career(from: 'Death Itself', to: 'Icon') }
        .to raise_error NoCareerException
    end
  end

  describe '#becomes' do
    it 'adds a new career to the char' do
      zendark = create(:zendark)
      zendark.becomes('Proplayer')
      expect(zendark.careers)
        .to eq(Career.where(name: ['Diva', 'Farm Bull', 'Proplayer']))
    end

    it 'errors when new career is not available' do
      expect { create(:zendark).becomes('Death Itself') }
        .to raise_error CareerUnavailableException
    end

    it 'errors when new career is not known' do
      expect { create(:zendark).becomes('Secret') }
        .to raise_error CareerUnknownException
    end

    it 'errors when new career doesn\'t exist' do
      expect { create(:zendark).becomes('NonExistent') }
        .to raise_error NoCareerException
    end
  end

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
