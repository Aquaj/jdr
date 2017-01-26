require 'rails_helper'

RSpec.describe Character, type: :model do
  it 'doesn\'t need a player' do
    expect { create(:character, player: nil) }.to_not raise_error
  end

  it 'knows its encombrement' do
    expect(create(:zendark).enc).to eq(10)
  end

  it 'knows how many HP it has' do
    expect(create(:zendark).hp).to eq(12)
  end

  it 'knows its current careers' do
    expect(create(:zendark).careers)
      .to eq(Career.where(name: ['Diva', 'Farm Bull']))
  end

  it 'knows its talents' do
    expect(create(:zendark).talents)
      .to eq(Talent.where(name: ['Strong AF', 'Gay']))
  end

  it 'knows its abilities' do
    expect(create(:zendark).abilities)
      .to eq(Talent.where(name: ['Dancing', 'Punching']))
  end
end
