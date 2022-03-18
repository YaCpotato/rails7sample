class NewspapersController < ApplicationController
  before_action :check_for_slack_webhook_url

  def index
    @newspapers = Newspaper.all()
  end

  def news_send
    notifier = Slack::Notifier.new(
      current_user.slack_webhook_url,
      username: '社内新聞'
    )
    notifier.ping '総天然色の青春グラフィティや一億総プチブルを私が許さないことくらいオセアニアじゃあ常識なんだよ'
    
    redirect_to root_path
  end
end
