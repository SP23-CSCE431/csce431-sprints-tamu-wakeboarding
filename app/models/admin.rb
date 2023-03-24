class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :omniauthable, omniauth_providers: [:google_oauth2]
  def self.from_google(email:, full_name:, uid:, avatar_url:)
    return nil unless email =~ /@tamu.edu\z/ || email == 'tamuwakeuser@gmail.com'
    create_with(uid: uid,first_name: full_name.split[0],last_name: full_name.split[1], avatar_url: avatar_url).find_or_create_by!(email: email)
  end

  has_many :wakeboard_set

end
