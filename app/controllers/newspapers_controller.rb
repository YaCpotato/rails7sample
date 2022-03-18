class NewspapersController < ApplicationController
  before_action :check_for_slack_webhook_url
  before_action :fetch_newspaper, only: [:extra_news_send]

  def index
    @newspapers = Newspaper.all()
  end

  def extra_news_send
    message = {
      blocks: [
        {
          "type": "header",
          "text": {
            "type": "plain_text",
            "text": @newspaper.title,
          }
        },
        {
          "type": "section",
          "text": {
            "type": "mrkdwn",
            "text": @newspaper.content
          }
        }
      ]
    }
    SlackUtility.send(
      current_user.slack_webhook_url,
      message
    )

    redirect_to newspaper_index_path
  end

  private

    def fetch_newspaper
      @newspaper = Newspaper.find(params[:id])
    rescue => e
      render status: :not_found, json: { error: e }
    end
end
