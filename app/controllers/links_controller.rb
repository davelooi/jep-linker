class LinksController < ApplicationController
  before_action :set_inputs, only: [:create]
  include Services
  def index
    @link = Link.new
    @shortened_link = Link.find_by_short_url(params[:id])
  end

  def show
    redirection_url = Link.find_by(short_url: params[:id])
    redirect_to redirection_url.long_url
  end

  def create
    @link = Services::Url.find_or_create(@inputs)
    if @link.valid?
      redirect_to links_path(id: @link)
    else
      flash[:error] = @link.errors.full_messages
      redirect_to root_path
    end
  end

  private

  def set_inputs
    @inputs = {long_url: params[:link][:long_url], short_url: params[:link][:short_url]}
  end

  def allowed_params
    params.require(:link).permit(:long_url, :short_url)
  end
end
