require 'rails_helper'

RSpec.describe Career, type: :model do
  let :diva   { find_or_create :diva          }
  let :icon   { find_or_create :icon          }
  let :secret { find_or_create :secret_career }

  it 'lists its exits' do
    expect(diva.exits).to contain_exactly icon, secret
  end

  it 'says if it\'s a secret classes or not' do
    expect(secret).to   be_secret
    expect(diva).not_to be_secret
  end

  it 'says if it\'s an advanced career of not' do
    expect(diva).to be_basic
    expect(icon).to be_advanced

    expect(icon).not_to be_basic
    expect(diva).not_to be_advanced
  end

  it 'lists its abilities' do
    expect(diva.skills).to
      contain_exactly dancing, sassy_snap
  end

  it 'lists its talents' do
    expect(diva.skills).to
      contain_exactly fabulous
  end

  it 'lists its skills' do
    expect(diva.skills).to
      contain_exactly dancing, sassy_snap, fabulous
  end
end
