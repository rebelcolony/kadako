class AddProfileIdToHistories < ActiveRecord::Migration
  def self.up
    add_column :histories, :profile_id, :integer
  end

  def self.down
    remove_column :histories, :profile_id
  end
end
