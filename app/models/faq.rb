class Faq < ApplicationRecord
  has_many :comments
  has_many :categories
  enum rate:    [ :good, :normal, :bad ]
end
