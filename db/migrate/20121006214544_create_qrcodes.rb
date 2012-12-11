class CreateQrcodes < ActiveRecord::Migration
  def self.up
    create_table :qrcodes do |t|
      t.string :path
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :qrcodes
  end
end
