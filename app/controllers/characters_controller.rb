class CharactersController < ApplicationController
  def highscores
    @characters = HTTParty.get('http://127.0.0.1:3000/highscores/experience.json')
  end

  def show
  end
end
