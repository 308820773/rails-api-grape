class CreateElements < ActiveRecord::Migration[5.2]
  def change
    create_table :elements do |t|
      t.string :name, comment: '标题'
      t.integer :lines_count

      t.timestamps
    end
  end
end
