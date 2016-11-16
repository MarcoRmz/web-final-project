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

    if @character != nil 
      @owner = User.where(uid: @character["google_id"]).first
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
    end
    redirect_to url_for(:controller => :characters, :action => :show)
  end

  def toggle_hide
    if current_user != nil 
      current_user.update_attribute(:hidden, !current_user.hidden)
    end
    redirect_to url_for(:controller => :characters, :action => :show, :id => current_user.uid)
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
