class AddUserIdToProfiles < ActiveRecord::Migration
  def self.up
    add_column :qualifications, :profile_id, :integer
  end

  def self.down
    remove_column :qualifications, :profile_id
  end
end
