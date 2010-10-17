class AddEmailAndProfileUrlToAuthorization < ActiveRecord::Migration
  def self.up
    add_column :authorizations, :email, :string
    add_column :authorizations, :profile_url, :string
  end

  def self.down
    remove_column :authorizations, :profile_url
    remove_column :authorizations, :email
  end
end
