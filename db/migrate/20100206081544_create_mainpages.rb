class CreateMainpages < ActiveRecord::Migration
  def self.up
    create_table :mainpages do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :mainpages
  end
end
