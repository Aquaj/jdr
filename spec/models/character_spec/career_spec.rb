require 'rails_helper'

RSpec.describe 'Character Careers', type: :model do
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
end
