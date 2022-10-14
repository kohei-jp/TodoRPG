class CreateSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :skills do |t|
      t.string :name, null: false, comment: "スキル名"
      t.timestamp :invalidated_at, comment: "論理削除時刻" 
      t.timestamps
    end
  end
end
