class User < ApplicationRecord
  encrypts :slack_webhook_url

  SLACK_URL_REGEX = /(https:\/\/hooks.slack.com\/services)(.*)/
  validates :email, length: { maximum: 100 },
                    format: { with: SLACK_URL_REGEX },
                    uniqueness: true, acceptance: { message: 'must be abided' }
  
  class << self
    def find_or_create_from_auth_hash(auth_hash)
      user_params = user_params_from_auth_hash(auth_hash)
      find_or_create_by(email: user_params[:email]) do |user|
        user.update(user_params)
      end
    end
    
    private

    def user_params_from_auth_hash(auth_hash)
      {
        name: auth_hash.info.name,
        email: auth_hash.info.email,
        image: auth_hash.info.image,
      }
    end
  end
end