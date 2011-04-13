class CreateConnections < ActiveRecord::Migration
  def self.up
    create_table :connections do |t|
      t.integer :person_id
      t.integer :project_id
      t.string :type

      t.timestamps
    end
  end

  def self.down
    drop_table :connections
  end
end
