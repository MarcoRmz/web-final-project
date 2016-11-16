class CharactersController < ApplicationController
  def highscores
    @characters = HTTParty.get(master_server + '/highscores/experience.json')
  end

  def show
    if params[:id].length <= 10
      @character = HTTParty.get(master_server + '/character/' + params[:id] + '.json')
    else 
      @character = HTTParty.get(master_server + '/claim/' + params[:id] + '.json')
    end
  end
end
