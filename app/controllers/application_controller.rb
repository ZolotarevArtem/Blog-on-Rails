class ApplicationController < ActionController::Base
  
	layout :resolve_layout
  protect_from_forgery with: :exception

  private

  def resolve_layout
    if user_signed_in?
    	"user"
    else
    	"application"
    end
  end
  
end
