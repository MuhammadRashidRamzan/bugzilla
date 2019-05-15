class AddNameColumnToUser < ActiveRecord::Migration
  def change
  	add_column :users ,:name, :string , default: 'Default'
  end
end
