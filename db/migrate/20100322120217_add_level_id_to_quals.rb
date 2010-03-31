class AddLevelIdToQuals < ActiveRecord::Migration
  def self.up
    add_column :qualifications, :level_id, :integer
  end

  def self.down
    remove_column :qualifications, :level_id
  end
end
