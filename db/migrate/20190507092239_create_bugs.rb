class CreateBugs < ActiveRecord::Migration
  def change
    create_table :bugs do |t|
      t.string :title
      t.text :description
      t.integer :status
      t.integer :project_id

      t.timestamps null: false
    end
  end
end
