require 'rails_helper'

RSpec.describe 'Has::Careers', type: :model do
  let :zendark { create         :zendark        }
  let :bull    { find_or_create :farm_bull      }
  let :tractor { find_or_create :actual_tractor }
  let :diva    { find_or_create :diva           }
  let :icon    { find_or_create :icon           }
  let :death   { find_or_create :death_itself   }
  let :secret  { find_or_create :secret_career  }
  let :player  { find_or_create :proplayer      }

  before do
    Character.include Has::Careers
  end

  it 'allows to get a list of current careers' do
    expect(zendark.careers).to contain_exactly diva, bull
  end

  describe '#switch_carrer' do
    it 'allows to switch to a new career' do
      zendark.switch_career(from: diva, to: icon)
      expect(zendark.reload.careers).to contain_exactly icon, bull
    end

    it 'errors when new career is not available' do
      expect { zendark.switch_career(from: diva, to: death) }
        .to raise_error CareerUnavailableException
    end

    it 'errors when first career doesn\'t lead to the new one' do
      expect { zendark.switch_career(from: diva, to: tractor) }
        .to raise_error NoCareerPathException
    end

    it 'errors when new career is not known' do
      expect { zendark.switch_career(from: diva, to: secret) }
        .to raise_error CareerUnknownException
    end

    it 'errors when switching from a career the character doesn\'t have' do
      expect { zendark.switch_career(from: death, to: icon) }
        .to raise_error NotOwnedCareerException
    end
  end

  describe '#becomes' do
    it 'allows to add a new career to the char' do
      zendark.becomes(player)
      expect(zendark.careers).to contain_exactly diva, bull, player
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