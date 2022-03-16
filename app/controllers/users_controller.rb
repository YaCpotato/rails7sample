class UsersController < ApplicationController
  skip_before_action :check_logged_in, only: :index
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attribute(:slack_webhook_url, user_params[:slack_webhook_url])
      flash[:success] = "Profile updated"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:slack_webhook_url)
  end
end
