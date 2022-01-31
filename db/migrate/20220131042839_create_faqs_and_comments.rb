class CreateFaqsAndComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :text
      t.belongs_to :user
      t.timestamps
    end

    create_table :faqs do |t|
      t.text :question_text
      t.text :answer
      t.integer :large_category
      t.integer :medium_category
      t.integer :small_category
      t.belongs_to :comment
      t.timestamps
    end
  end
end
