class User < ActiveRecord::Base

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def characters_followed
    self.following.gsub(/\s+/m, ' ').strip.split(" ")
  end

  def character_followed?(id)
    self.characters_followed.include?(id)
  end

end
