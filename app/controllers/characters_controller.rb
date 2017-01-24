class CharactersController < ApplicationController
  def index
    @characters = policy_scope Character
  end
end
