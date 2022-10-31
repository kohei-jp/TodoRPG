class CreateExperienceTable < ActiveRecord::Migration[7.0]
  def change
    create_table :experience_tables do |t|
      t.string :name, null: false, comment: 'テーブル名'
      t.timestamp :invalidated_at, comment: '論理削除時刻'
      t.timestamps
    end
  end
end
