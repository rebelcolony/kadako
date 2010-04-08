class AddCertToQuals < ActiveRecord::Migration
  def self.up
    add_column :qualifications, :cert_file_name, :string
    add_column :qualifications, :cert_content_type, :string
    add_column :qualifications, :cert_file_size, :integer
    add_column :qualifications, :cert_update_at, :datetime
  end

  def self.down
    remove_column :qualifications, :cert_update_at
    remove_column :qualifications, :cert_file_size
    remove_column :qualifications, :cert_content_type
    remove_column :qualifications, :cert_file_name
  end
end
