class ChangeWeightDataType < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.change :weight, :float
    end
  end

  def self.down
    change_table :users do |t|
      t.change :weight, :integer
    end
  end
end
