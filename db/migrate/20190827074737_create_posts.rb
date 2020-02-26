class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, comment: '标题'
      t.text :desc, comment: '说明'
      t.integer :user_id
      t.integer :lines_count

      t.bigint :created_user_id, comment: '创建人 ID'
      t.bigint :updated_user_id, comment: '修改人 ID'
      t.datetime :disabled_at, comment: '删除时间'

      t.timestamps
    end
  end
end
