class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :check_logged_in

  def check_logged_in
    return if current_user

    redirect_to root_path
  end

  def check_for_slack_webhook_url
    return if current_user.slack_webhook_url

    redirect_back(fallback_location: root_path)
  end
end