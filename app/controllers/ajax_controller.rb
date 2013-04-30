class AjaxController < ApplicationController
  # before_filter :check_ajax
  # TODO
  # Add admin filter to upload_image

  def check_ajax
    return redirect_to '/404.html' unless request.xhr?
  end

  def convert_markdown
    md = params[:markdown]
    return redirect_to '/404.html' unless md

    html = Markdown.to_html(md)

    render text: html, layout: false
  end

  def upload_image
    image = Image.new(params[:image])
    image.save

    render text: { url: image.attachment.url, thumbnail: image.attachment.url(:thumbnail) }.to_json
  end

end
