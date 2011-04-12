class CreateStories < ActiveRecord::Migration
  def self.up
    create_table :stories do |t|
      t.string :title
      t.string :description
      t.integer :project_id
      t.integer :weight
      t.integer :person_id

      t.timestamps
    end
  end

  def self.down
    drop_table :stories
  end
end