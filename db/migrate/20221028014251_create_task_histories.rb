class CreateTaskHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :task_histories do |t|
      t.references :task, foreign_key: true, comment: 'タスクID'
      t.references :avatar, foreign_key: true, comment: 'アバターID'
      t.timestamp :completed_at, comment: '完了時刻'
      t.timestamp :invalidated_at, comment: '論理削除時刻'
      t.timestamps
    end
  end
end
