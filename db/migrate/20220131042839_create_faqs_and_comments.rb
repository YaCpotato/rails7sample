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
      t.belongs_to :large_category
      t.belongs_to :medium_category
      t.belongs_to :small_category
      t.belongs_to :comment
      t.timestamps
    end

    create_table :categories do |t|
      t.string :name
      t.integer :size
      t.timestamps
    end
  end
end
