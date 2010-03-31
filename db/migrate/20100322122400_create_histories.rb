class CreateHistories < ActiveRecord::Migration
  def self.up
    create_table :histories do |t|
      t.date :start
      t.date :end
      t.text :description
      t.text :equipment
      t.string :company
      t.string :position

      t.timestamps
    end
  end

  def self.down
    drop_table :histories
  end
end
