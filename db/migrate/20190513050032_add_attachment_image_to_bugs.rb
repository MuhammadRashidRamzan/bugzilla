class AddAttachmentImageToBugs < ActiveRecord::Migration
  def self.up
  	 remove_attachment :bugs, :image
    change_table :bugs do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :bugs, :image
  end
end
