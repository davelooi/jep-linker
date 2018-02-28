class Api::LinksController < ApplicationController
  def index
    render json: Link.all
  end

end
