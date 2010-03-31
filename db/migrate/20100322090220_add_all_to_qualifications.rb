class AddAllToQualifications < ActiveRecord::Migration
  def self.up
    add_column :qualifications, :body_id, :integer
    add_column :qualifications, :category_id, :integer
    add_column :qualifications, :technique_id, :integer
  end

  def self.down
    remove_column :qualifications, :technique_id
    remove_column :qualifications, :category_id
    remove_column :qualifications, :body_id
  end
end
