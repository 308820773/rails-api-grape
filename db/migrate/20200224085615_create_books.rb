class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.text :desc

      t.bigint :user_id
      t.bigint :team_id

      t.timestamps
    end
  end
end
