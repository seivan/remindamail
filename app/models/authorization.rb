class Authorization < ActiveRecord::Base
  belongs_to :user
  validates_uniqueness_of :uid, :scope => :provider
  
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
    user ||= User.create_from_auth_hash!(auth_hash)
    Authorization.create(:user => user, :uid => auth_hash['uid'], :provider => auth_hash['provider'])
  end
  
end
