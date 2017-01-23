class AddAttachmentImageToAssignments < ActiveRecord::Migration
  def self.up
    change_table :assignments do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :assignments, :image
  end
end
