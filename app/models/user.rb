class User < ActiveRecord::Base
  has_many :authorizations
  has_many :messages
  
  
  def self.create_from_auth_hash!(auth_hash)
    User.create(:name => auth_hash['user_info']['name'])
  end
end