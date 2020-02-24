class CreateUserAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :user_accounts do |t|
      t.bigint :user_id

      t.string :type
      t.string :openid
      t.string :nickname
      t.string :avatar_url
      t.text :info

      t.timestamps
    end
  end
end
