class RenameUsersTableColumnDescription < ActiveRecord::Migration
  def change

    rename_column :users, :descrption, :description
  
  end
end
