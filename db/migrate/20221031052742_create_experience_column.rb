class CreateExperienceColumn < ActiveRecord::Migration[7.0]
  def change
    create_table :experience_columns do |t|
      t.references :experience_table, foreign_key: true, comment: 'テーブルID'
      t.integer :level, null: false, default: 1, comment: 'レベル'
      t.integer :required_experience_point, null: false, default: 1, comment: '必要な経験値'
      t.integer :accumulation_experience_point, null: false, default: 1, comment: '累積経験値'
      t.timestamp :invalidated_at, comment: '論理削除時刻'
      t.timestamps
    end
  end
end
