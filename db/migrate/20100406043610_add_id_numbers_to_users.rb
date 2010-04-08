class AddIdNumbersToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :pcn_number, :string
    add_column :users, :other_body_id, :string
  end

  def self.down
    remove_column :users, :other_body_id
    remove_column :users, :pcn_number
  end
end
