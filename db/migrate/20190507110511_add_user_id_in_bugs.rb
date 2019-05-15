class AddUserIdInBugs < ActiveRecord::Migration
  def change
  	 def change
    add_column :bugs, :user_id, :integer
  end
  end
end
