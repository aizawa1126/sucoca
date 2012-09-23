class ApplicationController < ActionController::Base
  protect_from_forgery

  def login?
    session[:login].present?
  end

  def authenticate
    redirect_to(:controller => 'authentication', :action => 'index') and return false unless login?
  end
end
