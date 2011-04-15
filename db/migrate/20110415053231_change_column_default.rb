class ChangeColumnDefault < ActiveRecord::Migration
  def self.up
     change_column_default(:stories, :status, 'Not Yet Started')
  end

  def self.down
    change_column_default(:stories, :status, '')
  end
end
