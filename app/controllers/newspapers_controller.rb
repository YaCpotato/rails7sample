class NewspapersController < ApplicationController
  before_action :check_for_slack_webhook_url

  def index
    @newspapers = Newspaper.all()
  end
end
