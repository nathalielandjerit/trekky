class AddAttachmentIllustrationToTravels < ActiveRecord::Migration
  def self.up
    add_column :travels, :illustration_file_name, :string
    add_column :travels, :illustration_content_type, :string
    add_column :travels, :illustration_file_size, :integer
    add_column :travels, :illustration_updated_at, :datetime
  end

  def self.down
    remove_column :travels, :illustration_file_name
    remove_column :travels, :illustration_content_type
    remove_column :travels, :illustration_file_size
    remove_column :travels, :illustration_updated_at
  end
end
