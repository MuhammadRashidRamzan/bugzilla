class AddCoulumnUserIdToBug < ActiveRecord::Migration
  def change
  	add_column :bugs , :user_id , :integer , default: nil
  end
end
