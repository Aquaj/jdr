require 'rails_helper'

RSpec.describe Character, type: :model do
  let :zendark  { find_or_create :zendark    }

  let :gay      { find_or_create(:gay)       }
  let :strong   { find_or_create(:strong_af) }

  let :dancing  { find_or_create(:dancing)   }
  let :punching { find_or_create(:punching)  }

  let :bull     { find_or_create(:farm_bull) }
  let :diva     { find_or_create(:diva)      }

  it 'doesn\'t need a player' do
    expect { create(:zendark, player: nil) }.to_not raise_error
  end

  it 'knows its encombrement' do
    expect(zendark.enc).to eq 10
  end

  it 'knows its max encombrement' do
    expect(zendark.max_enc).to eq 850
  end

  it 'knows how many HP it has' do
    expect(zendark.hp).to eq 12
  end

  it 'knows its current careers' do
    expect(zendark.careers).to contain_exactly diva, bull
  end

  it 'knows its talents' do
    expect(zendark.talents).to contain_exactly strong, gay
  end

  it 'knows its abilities' do
    expect(zendark.abilities).to contain_exactly dancing, punching
  end
end
