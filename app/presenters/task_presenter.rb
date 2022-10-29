class TaskPresenter < ModelPresenter
  def last_commit
    object.task_histories.todays.order(:id).last
  end

  def today_commit_count
    object.task_histories.todays.size
  end
end