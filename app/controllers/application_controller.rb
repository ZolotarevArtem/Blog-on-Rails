class ApplicationController < ActionController::Base
	layout :resolve_layout
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def resolve_layout
    if session[:user] == nil
    	"application"
    else
    	"user"
    end
  end
end
