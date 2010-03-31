class AddUserIdHistories < ActiveRecord::Migration
  def self.up
    add_column :histories, :user_id, :integer
  end

  def self.down
    remove_column :histories, :user_id
  end
end
