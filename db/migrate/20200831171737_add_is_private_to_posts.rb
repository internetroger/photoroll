class AddIsPrivateToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :is_private, :boolean
  end
end
