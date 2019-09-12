class AddCounterForUserMarks < ActiveRecord::Migration[5.2]
  def change
    add_column :marks, :likes_count, :integer, default: 0
    add_column :users, :like_marks_count, :integer, default: 0

    add_column :marks, :unlikes_count, :integer, default: 0
    add_column :users, :unlike_marks_count, :integer, default: 0
  end
end
