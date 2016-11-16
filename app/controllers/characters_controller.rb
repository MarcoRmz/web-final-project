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
    if current_user != nil
      @following = get_users(current_user.characters_followed)
    end
  end

  def search
    @characters = HTTParty.get(master_server + '/search.json?name=' + params[:name] + '&button=')
    render :characters
  end

  def follow
    if current_user != nil && !current_user.character_followed?(params[:id])
      current_user.update_attribute(:following, current_user.following + " " + params[:id])
      @following = get_users(current_user.characters_followed)
    end
    @character = HTTParty.get(master_server + '/character/' + params[:id] + '.json')
    render :show
  end

  private 

    def get_users(ids)
      characters ||= []
      ids.each do |id|
        json = JSON.parse(HTTParty.get(master_server + '/character/' + id + '.json').body)
        characters.push(json)
      end
      characters
    end
end
