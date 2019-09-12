class CreateLines < ActiveRecord::Migration[5.2]
  def change
    create_table :lines do |t|
      t.text :desc, comment: '说明'
      t.decimal :score_cache, comment: '最终得分'

      t.integer :element_id
      t.integer :post_id

      t.timestamps
    end
  end
end
