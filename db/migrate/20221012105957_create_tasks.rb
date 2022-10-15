class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name, null: false, comment: 'タスク名'
      t.integer :experience_point, null: false, default: 1, comment: '経験値'
      t.references :skill, foreign_key: true, comment: 'スキルID'
      t.references :rank, foreign_key: true, comment: 'ランクID'
      t.timestamp :completed_at, comment: '完了時刻'
      t.timestamp :invalidated_at, comment: '論理削除時刻'
      t.timestamps
    end
  end
end
