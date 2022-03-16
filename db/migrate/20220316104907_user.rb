class User < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :slack_webhook_url, :string
  end
end
