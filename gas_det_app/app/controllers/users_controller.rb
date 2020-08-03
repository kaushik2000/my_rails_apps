class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    render "new"
  end

  def create
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email_id: params[:email_id],
      password: params[:password],
    )
    user.save
    redirect_to new_session_path 
  end
end
