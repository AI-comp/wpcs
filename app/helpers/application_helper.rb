module ApplicationHelper
  def link_to_google_docs(id)
    link_to('https://docs.google.com/document/d/' + id)
  end

  def format_date(date_time, format = nil)
    format = "%Y/%m/%d %H:%M" unless format
    return date_time.strftime(format)
  end

end
