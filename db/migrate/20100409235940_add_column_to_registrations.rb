class AddColumnToRegistrations < ActiveRecord::Migration
  def self.up
    add_column :registrations, :operating_system, :string
  end

  def self.down
    remove_column :registrations, :operating_system
  end
end
