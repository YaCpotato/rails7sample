# frozen_string_literal: true

class Articles::ListComponent < ViewComponent::Base
  def initialize(articles:)
    @articles = articles
  end

end
