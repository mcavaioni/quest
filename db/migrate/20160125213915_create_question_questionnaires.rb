class CreateQuestionQuestionnaires < ActiveRecord::Migration
  def change
    create_table :question_questionnaires do |t|
      t.integer :question_id
      t.integer :questionnaire_id
    end
  end
end
