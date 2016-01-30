class Question < ActiveRecord::Base
  # belongs_to :user
  has_many :survey_questions
  has_many :surveys, through: :survey_questions
  has_many :answers

  validates :title, presence: true, uniqueness: true, length: {minimum: 3, maximum: 25}
  validates :content, presence: true, uniqueness: true, length: {minimum: 3, maximum: 300}

end
