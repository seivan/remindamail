class RenameStatusToSentInMessages < ActiveRecord::Migration
  def self.up
    change_table :messages do |t|
      t.rename :status, :sent
    end
  end

  def self.down
    change_table :messages do |t|
      t.rename :sent, :status
    end
  end
end
