# frozen_string_literal: true

class Newspapers::ListComponent < ViewComponent::Base
  def initialize(newspapers:)
    @newspapers = newspapers
  end

end
