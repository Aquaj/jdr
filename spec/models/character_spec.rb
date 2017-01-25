require 'rails_helper'

RSpec.describe Character, type: :model do
  it 'doesn\'t need a player' do
    expect { create(:character, player: nil) }.to_not raise_error
  end

  it 'knows its encombrement' do
  end

  it 'knows how many HP it has' do
  end
end
