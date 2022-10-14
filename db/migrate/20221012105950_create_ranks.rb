class CreateRanks < ActiveRecord::Migration[7.0]
  def change
    create_table :ranks do |t|
      t.string :grade, null: false, comment: "難易度"
      t.timestamp :invalidated_at, comment: "論理削除時刻"
      t.timestamps
    end
  end
end
