30.times do
  Categories.create!(
    name: Faker::Lorem.word,
    size: Faker::Number.between(from:0, to:2),
  )
end

50.times do
  Faq.create!(
    question_text: Faker::Lorem.paragraph_by_chars,
    answer: Faker::Lorem.paragraph_by_chars,
    large_category_id: Categories.where( 'size = 0', rand(Categories.first.id..Categories.last.id) ).first,
    medium_category_id: Categories.where( 'size = 1', rand(Categories.first.id..Categories.last.id) ).first,
    small_category_id: Categories.where( 'size = 2', rand(Categories.first.id..Categories.last.id) ).first
  )
end

100.times do
  Comment.create!(
    text: Faker::Lorem.paragraph_by_chars,
    user_id: User.first
  )
end