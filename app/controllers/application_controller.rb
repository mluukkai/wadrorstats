class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate

  private

  def authenticate
    #return true if Rails.env.development?
    authenticate_or_request_with_http_basic do |username, password|
      ( username == ENV['USERNAME'] and password == ENV['PASSWORD'] ) or ( username == ENV['DOGE'] and password == ENV['DOGE_PASSWORD'] )
    end
  end
end
