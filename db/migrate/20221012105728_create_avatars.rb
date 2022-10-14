class CreateAvatars < ActiveRecord::Migration[7.0]
  def change
    create_table :avatars do |t|
      t.string :name, null: false, comment: "名前" 
      t.references :customer, foreign_key: true, comment: "顧客ID"
      t.timestamp :invalidated_at, comment: "論理削除時刻"
      t.timestamps
    end
  end
end
