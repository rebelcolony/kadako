class AddSectorIdToHistories < ActiveRecord::Migration
  def self.up
    add_column :histories, :sector_id, :integer
  end

  def self.down
    remove_column :histories, :sector_id
  end
end
