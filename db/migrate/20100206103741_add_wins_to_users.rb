class AddWinsToUsers < ActiveRecord::Migration
  def self.up
    

      add_column  :users, :wins, :integer, :default => 0
      add_column  :users, :losses, :integer, :default => 0
    
  end
  def self.down
      remove_column :users, :wins
      remove_column :users, :losses
      
  end
end
