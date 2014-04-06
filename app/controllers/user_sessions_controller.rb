class UserSessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    user.authenticate(params[:password])
    redirect_to posts_path
  end
end
