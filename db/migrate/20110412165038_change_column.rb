class ChangeColumn < ActiveRecord::Migration
  def self.up
    rename_column :connections, :type, :types
  end

  def self.down
    rename_column :connections, :types, :type
  end
end

