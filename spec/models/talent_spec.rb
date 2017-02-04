require 'rails_helper'

RSpec.describe Talent, type: :model do
  let :gay { find_or_create :gay }

  it 'is never secret' do
    expect(gay).not_to be_secret
  end
end
