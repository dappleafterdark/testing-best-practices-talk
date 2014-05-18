class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate!, only: [:index]

  protected

  def authenticate!
    authenticate_or_request_with_http_basic do |username, password|
      username == "crypt" && password == "currency"
    end
  end
end
