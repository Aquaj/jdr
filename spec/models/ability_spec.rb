require 'rails_helper'

RSpec.describe Ability, type: :model do
  let :secret   { find_or_create :secret_ability }
  let :punching { find_or_create :punching       }

  it 'can be secret' do
    expect(secret  ).to     be_secret
    expect(punching).not_to be_secret
  end
end
