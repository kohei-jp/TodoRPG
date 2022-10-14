class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :email, null: false, comment: "メールアドレス"
      t.string :family_name, null: false, comment: "姓"
      t.string :given_name, null: false, comment: "名"
      t.string :hashed_password, comment: "パスワード"
      t.timestamp :invalidated_at, comment: "論理削除時刻"
      t.timestamps
    end

    add_index :customers, "LOWER(email)", unique: true
    # add_index :customers, [ :family_name_kana, :given_name_kana ]
  end
end
