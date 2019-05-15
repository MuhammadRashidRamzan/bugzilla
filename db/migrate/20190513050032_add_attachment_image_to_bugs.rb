class AddAttachmentImageToBugs < ActiveRecord::Migration
  def self.up
    change_table :bugs do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :bugs, :image
  end
end
