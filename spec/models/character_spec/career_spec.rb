require 'rails_helper'

RSpec.describe 'Character Careers', type: :model do
  let(:zendark) { Character.find_by_name('Zendark')     || create(:zendark) }
  let(:bull)    { Career.find_by_name('Farm Bull')      || create(:farm_bull) }
  let(:tractor) { Career.find_by_name('Actual Tractor') || create(:actual_tractor) }
  let(:diva)    { Career.find_by_name('Diva')           || create(:diva) }
  let(:icon)    { Career.find_by_name('Icon')           || create(:icon) }
  let(:death)   { Career.find_by_name('Diva')           || create(:death_itself) }
  let(:secret)  { Career.find_by_name('Secret')         || create(:secret_career) }
  let(:player)  { Career.find_by_name('Proplayer')      || create(:proplayer) }

  describe '#switches_carrer' do
    it 'switches to a new career' do
      zendark.switch_career(from: diva, to: icon)
      expect(zendark.careers)
        .to eq([icon, bull])
    end

    it 'errors when new career is not available' do
      expect { zendark.switch_career(from: diva, to: death) }
        .to raise_error CareerUnavailableException
    end

    it 'errors when first career doesn\'t lead to the new one' do
      expect { zendark.switch_career(from: diva, to: tractor) }
        .to raise_error NoCareerPath
    end

    it 'errors when new career is not known' do
      expect { zendark.switch_career(from: diva, to: secret) }
        .to raise_error CareerUnknownException
    end

    it 'errors when switching from a career the character doesn\'t have' do
      expect { zendark.switch_career(from: death, to: icon) }
        .to raise_error NoCareerException
    end
  end

  describe '#becomes' do
    it 'adds a new career to the char' do
      zendark = zendark
      zendark.becomes(player)
      expect(zendark.careers)
        .to eq(Career.where(name: [diva, bull, player]))
    end

    it 'errors when new career is not available' do
      expect { zendark.becomes(death) }
        .to raise_error CareerUnavailableException
    end

    it 'errors when new career is not known' do
      expect { zendark.becomes(secret) }
        .to raise_error CareerUnknownException
    end
  end
end
