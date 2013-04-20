require 'redcarpet'

class Markdown

  def self.to_html(md)
    Redcarpet::Markdown.new(Redcarpet::Render::HTML).render(md)
  end

end
