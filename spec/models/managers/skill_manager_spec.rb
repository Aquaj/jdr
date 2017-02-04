require 'rails_helper'

RSpec.describe Managers::SkillManager, type: :model do
  let :zendark { create :zendark                     }
  let :manager { Managers::SkillManager.new zendark  }

  describe '#gets_talent' do
    let :strong   { find_or_create :strong_af        }
    let :gay      { find_or_create :gay              }
    let :fabulous { find_or_create :fabulous         }
    let :lethal   { find_or_create :lethal           }

    it 'adds a new talent to the char' do
      manager.gets_talent fabulous
      zendark.reload
      expect(zendark.talents).to contain_exactly strong, gay, fabulous
    end

    it 'errors when new talent is not available' do
      expect { manager.gets_talent lethal }
        .to raise_error TalentUnavailableException
    end
  end

  describe '#gets_ability' do
    let :dancing    { find_or_create :dancing        }
    let :punching   { find_or_create :punching       }
    let :sassy_snap { find_or_create :sassy_snap     }
    let :death_snap { find_or_create :snap_of_death  }
    let :secret     { find_or_create :secret_ability }

    it 'adds a new ability to the char' do
      manager.gets_ability sassy_snap
      zendark.reload
      expect(zendark.abilities).to contain_exactly dancing, punching, sassy_snap
    end

    it 'errors when new ability is not available' do
      expect { manager.gets_ability death_snap }
        .to raise_error AbilityUnavailableException
    end

    it 'errors when new ability is not known' do
      expect { manager.gets_ability secret }
        .to raise_error AbilityUnknownException
    end
  end
end
