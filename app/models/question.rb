class Question < ActiveRecord::Base
  has_many :question_questionnaires
  has_many :questionnaires, through: :question_questionnaires

  validates :title, presence: true, uniqueness: true, length: {minimum: 3, maximum: 25}
  validates :content, presence: true, uniqueness: true, length: {minimum: 3, maximum: 300}

end
