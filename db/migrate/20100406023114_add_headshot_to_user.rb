class AddHeadshotToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :headshot_file_name, :string
    add_column :users, :headshot_content_type, :string
    add_column :users, :headshot_file_size, :integer
    add_column :users, :headshot_updated_at, :datetime

  end

  def self.down
    remove_column :users, :headshot_updated_at
    remove_column :users, :headshot_file_size
    remove_column :users, :headshot_content_type
    remove_column :users, :headshot_file_name
  end
end
