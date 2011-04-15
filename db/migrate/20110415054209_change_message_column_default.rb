class ChangeMessageColumnDefault < ActiveRecord::Migration
  def self.up
     change_column_default(:messages, :status, 'unread')
  end

  def self.down
    change_column_default(:messages, :status, '')
  end
end
