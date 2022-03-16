# frozen_string_literal: true

class Users::EditFormComponent < ViewComponent::Base
  def initialize(user:)
    @user = user
  end

end
