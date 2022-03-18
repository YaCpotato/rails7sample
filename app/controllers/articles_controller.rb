class ArticlesController < ApplicationController
  before_action :check_for_slack_webhook_url, only: [:extra_news_send]
  before_action :fetch_article, only: [:extra_news_send, :edit, :update]

  def index
    @articles = Article.all()
  end

  def edit
    @user = @current_user
  end

  def update
    if @article.update!(article_params)
      redirect_to article_index_path
    else
      render 'edit'
    end
  end

  def extra_news_send
    message = {
      blocks: [
        {
          "type": "header",
          "text": {
            "type": "plain_text",
            "text": @article.title,
          }
        },
        {
          "type": "section",
          "text": {
            "type": "mrkdwn",
            "text": @article.content
          }
        }
      ]
    }
    SlackUtility.send(
      current_user.slack_webhook_url,
      message
    )

    redirect_to article_index_path
  end

  private

    def fetch_article
      @article = Article.find(params[:id])
    rescue => e
      render status: :not_found, json: { error: e }
    end

    def article_params
      params.require(:article).permit(:title, :content)
    end
end
