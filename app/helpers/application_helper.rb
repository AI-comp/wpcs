module ApplicationHelper
  def link_to_google_docs(id)
    link_to('https://docs.google.com/document/d/' + id)
  end

  def format_date(date_time)
    # date_time = (date_time + 7.hour).new_offset(Rational(9, 24))
    return date_time.localtime.strftime("%Y/%m/%d %H:%M")
  end

end
