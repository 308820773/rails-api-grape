class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.bigint :user_id
      t.bigint :team_id

      t.string :type

      t.bigint :created_user_id, comment: '创建人 ID'
      t.bigint :updated_user_id, comment: '修改人 ID'
      t.datetime :disabled_at, comment: '删除时间'

      t.timestamps
    end
  end
end
