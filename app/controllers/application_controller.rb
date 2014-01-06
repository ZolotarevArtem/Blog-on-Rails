class ApplicationController < ActionController::Base
	layout :resolve_layout
  protect_from_forgery with: :exception

  private

  def resolve_layout
    if session[:user] == nil
    	"application"
    else
    	"user"
    end
  end

  def login?
    session[:user] != nil
  end

end
