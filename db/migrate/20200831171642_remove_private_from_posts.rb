class RemovePrivateFromPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :private, :boolean
  end
end
