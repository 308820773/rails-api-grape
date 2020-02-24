class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :title
      t.text :desc

      t.bigint :user_id
      t.bigint :book_id

      t.timestamps
    end
  end
end
