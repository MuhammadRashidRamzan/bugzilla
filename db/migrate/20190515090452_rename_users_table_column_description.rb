class RenameUsersTableColumnDescription < ActiveRecord::Migration
  def change

    rename_column :projects, :descrption, :description
  
  end
end
