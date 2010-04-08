class AddBioToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :name, :string
    add_column :users, :dob, :date
    add_column :users, :address, :text
    add_column :users, :passport_number, :string
    add_column :users, :passport_expires, :date
    add_column :users, :nationality, :string
    add_column :users, :contact_email, :string
    add_column :users, :home_phone, :string
    add_column :users, :mobile_phone, :string

  end

  def self.down

    remove_column :users, :mobile_phone
    remove_column :users, :home_phone
    remove_column :users, :contact_email
    remove_column :users, :nationality
    remove_column :users, :passport_expires
    remove_column :users, :passport_number
    remove_column :users, :address
    remove_column :users, :dob
    remove_column :users, :name
  end
end
