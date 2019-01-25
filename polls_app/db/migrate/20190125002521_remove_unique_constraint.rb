class RemoveUniqueConstraint < ActiveRecord::Migration[5.2]
  def change
    remove_index :polls, :author_id
    add_index :polls, :author_id
  end
end
