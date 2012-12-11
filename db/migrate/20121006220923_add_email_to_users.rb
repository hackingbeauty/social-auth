class AddEmailToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :email, :string
    
  end

  def self.down
    remove_column :email
  end
end
