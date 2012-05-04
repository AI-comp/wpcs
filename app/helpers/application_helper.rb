module ApplicationHelper
  def link_to_google_docs(id)
    link_to('https://docs.google.com/document/d/' + id)
  end
end
