class SlackUtility
  def self.send(webhook_url, message, channel = '#公園')
    notifier = Slack::Notifier.new(
      webhook_url,
      channel: channel,
      username: "社内新聞"
    )
    notifier.ping message
  end
end