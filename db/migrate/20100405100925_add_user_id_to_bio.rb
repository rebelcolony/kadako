class AddUserIdToBio < ActiveRecord::Migration
  def self.up
    add_column :bios, :user_id, :integer
  end

  def self.down
    remove_column :bios, :user_id
  end
end
