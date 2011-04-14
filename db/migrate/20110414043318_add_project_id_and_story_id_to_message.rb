class AddProjectIdAndStoryIdToMessage < ActiveRecord::Migration
  def self.up
    add_column :messages, :project_id, :integer
    add_column :messages, :story_id, :integer
  end

  def self.down
    remove_column :messages, :story_id
    remove_column :messages, :project_id
  end
end
