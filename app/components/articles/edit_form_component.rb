# frozen_string_literal: true

class Articles::EditFormComponent < ViewComponent::Base
  def initialize(article:)
    @article = article
  end
end
