class AddImageColumnToBugTable < ActiveRecord::Migration
   def up
    add_attachment :bugs, :image
  end

  def down
    remove_attachment :bugs, :image
  end
end
