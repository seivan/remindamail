class User < ActiveRecord::Base
  has_many :authorizations
  has_many :messages
  
  validates :name,
            :presence => true
  
  def self.create_from_auth_hash!(auth_hash)
    user_info = auth_hash['user_info']
    User.create(:name => user_info['name'])
  end
end
