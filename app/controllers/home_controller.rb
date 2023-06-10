class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  respond_to :html, :json
  def index; end
end
