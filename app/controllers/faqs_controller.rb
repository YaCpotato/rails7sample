class FaqsController < ApplicationController
  def hello
    client = Slack::Web::Client.new
    client.chat_postMessage(
      channel: ENV.fetch("SLACK_CHANNEL"),
      blocks: [
        {
          "type": "section",
          "text": {
            "type": "mrkdwn",
            "text": "今日も暑いね:watermelon: 無理せずがんばろう:smile:"
          }
        },
        {
          "type": "header",
          "text": {
            "type": "plain_text",
            "text": "何をチェックする？",
            "emoji": true
          }
        },
        {
          "type": "actions",
          "elements": [
            {
              "type": "button",
              "text": {
                "type": "plain_text",
                "emoji": true,
                "text": "天気"
              },
              "style": "primary",
              "url": "https://www.jma.go.jp/jp/yoho/" # 気象庁HP
            },
            {
              "type": "button",
              "text": {
                "type": "plain_text",
                "emoji": true,
                "text": "カレンダー"
              },
              "style": "danger",
              "url": "https://calendar.google.com/" # Googleカレンダー
            },
            {
              "type": "button",
              "text": {
                "type": "plain_text",
                "emoji": true,
                "text": "ニュース"
              },
              "url": "https://news.google.co.jp/" # Googleニュース
            }
          ]
        }
      ]
    )

    redirect_to root_path
  end
end
