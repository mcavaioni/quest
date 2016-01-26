class Questionnaire < ActiveRecord::Base
  has_many :question_questionnaires
  has_many :questions, through: :question_questionnaires, dependent: :destroy
  accepts_nested_attributes_for :questions, reject_if: lambda {|attributes| attributes['title'].blank?}
  belongs_to :user
  validates :name, presence: true, uniqueness: true, length: {minimum: 3, maximum: 25}

end