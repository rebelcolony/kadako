class CreateBodies < ActiveRecord::Migration
  def self.up
    create_table :bodies do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :bodies
  end
end
