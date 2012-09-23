class AuthenticationController < ApplicationController
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def login
    if user = User.authenticate(params[:user])
      session[:login] = user
      redirect_to root_path, notice: 'Success Login.'
    else
      redirect_to '/authentication', notice: 'Failed.'
    end
  end

  def logout
    reset_session
    redirect_to root_path
  end
end
