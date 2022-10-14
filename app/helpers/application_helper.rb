module ApplicationHelper
  def document_title
    if @title.present?
      "#{@title} - ToDo RPG App"
    else
      "ToDo RPG App"
    end
  end
end
