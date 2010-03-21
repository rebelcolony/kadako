class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string    :email,                  :null => false
      t.string    :crypted_password,       :null => false
      t.string    :password_salt,          :null => false
      t.string    :persistence_token,      :null => false
      t.integer   :login_count
      t.integer   :failed_login_count
      t.datetime  :last_login_at
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
