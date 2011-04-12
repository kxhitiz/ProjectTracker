class UpdateColumn < ActiveRecord::Migration
  def self.up
    change_column :projects, :points, :integer, :default => 0
  end

  def self.down
      change_column :projects, :points, :integer
  end
end
