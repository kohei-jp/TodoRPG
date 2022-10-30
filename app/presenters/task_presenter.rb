class TaskPresenter < ModelPresenter
  def last_done
    object.task_histories.todays.order(:id).last
  end

  def today_done_count
    object.task_histories.todays.size
  end
end