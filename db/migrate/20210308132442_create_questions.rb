class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.integer :best_answer_id
      t.integer :question_genre
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
