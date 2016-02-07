class AddApprovedToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :superadmin, :boolean, :default => false, :null => false
    add_column :admins, :approved, :boolean, :default => false, :null => false
    add_index :admins, :approved
  end

  def self.down
    remove_index :admins, :approved
    remove_column :admins, :approved
    remove_column :admins, :superadmin
  end
end
