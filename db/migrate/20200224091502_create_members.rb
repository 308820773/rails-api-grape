class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.bigint :user_id
      t.bigint :team_id

      t.string :type

      t.timestamps
    end
  end
end
