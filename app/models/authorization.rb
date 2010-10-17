class Authorization < ActiveRecord::Base
  #scopes
  scope :facebook, where(:provider => "facebook").first
  scope :twitter, where(:provider => "twitter").first
  belongs_to :user
  
  validates :user_id,
            :presence => true

  validates :uid,
            :presence => true,
            :uniqueness => {:scope => :provider}
            
  validates :provider,
            :presence => true            

  def self.find_from_auth_hash(auth_hash)
    Authorization.find_by_provider_and_uid(auth_hash['provider'], auth_hash['uid'])
  end

  def self.create_from_auth_hash(auth_hash, user = nil)
    user_info = auth_hash['user_info']
    user ||= User.create_from_auth_hash!(auth_hash)
    provider = auth_hash['provider']
    profile = nil

    if provider == "twitter"
      profile = "http://twitter.com/#{user_info['nickname']}"
      Authorization.create(:user => user, 
                           :uid => auth_hash['uid'], 
                           :provider => provider, 
                           :profile_url => profile)

    elsif provider == "facebook"
      profile = user_info['urls']['Facebook']
      Authorization.create(:user => user, 
                           :uid => auth_hash['uid'], 
                           :provider => provider, 
                           :profile_url => profile, 
                           :email => auth_hash['extra']['user_hash']['email'] )
    end
    
    
  end
  
end
