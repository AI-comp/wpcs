# -*- coding: utf-8 -*-

require 'redcarpet'

class Markdown < Settingslogic

  source "#{Rails.root}/lib/autoload/markdown_example.yml"
  namespace Rails.env

  def self.to_html(md)
    Redcarpet::Markdown.new(Redcarpet::Render::HTML, {
      no_intra_emphasis: true,
      tables: true,
      fenced_code_blocks: true,
      autolink: true,
      strikethrough: true,
      lax_spacing: true,
      space_after_headers: true,
      superscript: true,
    }).render(md)
  end

end
