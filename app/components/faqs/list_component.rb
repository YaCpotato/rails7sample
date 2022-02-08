# frozen_string_literal: true

class Faqs::ListComponent < ViewComponent::Base
  def initialize(faqs:)
    @faqs = faqs
  end

end
