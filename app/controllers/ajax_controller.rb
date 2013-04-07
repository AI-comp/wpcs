require 'redcarpet'

class AjaxController < ApplicationController
  # before_filter :check_ajax

  def check_ajax
    return redirect_to '/404.html' unless request.xhr?
  end

  def convert_markdown
    md = params[:markdown]
    return redirect_to '/404.html' unless md

    renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    html = renderer.render(md)

    render text: html, layout: false
  end

end
