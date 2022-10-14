class CreateOwnedSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :owned_skills do |t|
      t.references :avatar, foreign_key: true, comment: "アバターID"
      t.references :skill, foreign_key: true, comment: "スキルID"
      t.integer :level, null: false, default: 1, comment: "レベル"
      t.integer :experience_point, null: false, default: 1, comment: "経験値"
      t.timestamp :invalidated_at, comment: "論理削除時刻"
      t.timestamps
    end
  end
end
