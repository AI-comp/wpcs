class ErrorsController < ApplicationController

  def routing
    @title = 'Routing Error'
    @params = request.params
    @session = session
    render file: "#{Rails.root}/public/404", status: 404, layout: false
  end

end
