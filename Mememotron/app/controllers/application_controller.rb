class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate!, only: [:create]

  protected

  def authenticate!
    authenticate_or_request_with_http_basic do |username, password|
      username == "crypto" && password == "currency"
    end
  end
end
