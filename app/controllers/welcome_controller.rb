class WelcomeController < ApplicationController
  def index
  	@announcements = JSON.parse(File.read("#{Rails.root}" + '/app/assets/javascripts/announcements.json'))
  end

  def about_us
  end

  def contact_us
  end
end
