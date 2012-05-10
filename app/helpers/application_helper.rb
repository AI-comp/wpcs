module ApplicationHelper
  def link_to_google_docs(id)
    link_to('https://docs.google.com/document/d/' + id)
  end

  def format_date(date_time)
    return date_time.strftime("%Y/%m/%d %H:%M")
  end

end
