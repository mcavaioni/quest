class Survey < ActiveRecord::Base
  has_many :survey_questions
  has_many :questions, through: :survey_questions
  belongs_to :user

  accepts_nested_attributes_for :questions, reject_if: lambda {|attributes| attributes['title'].blank?}

  validates :name, presence: true, length: {minimum: 3, maximum: 25}
  validates :product, presence: true, length: {minimum: 3, maximum: 25}
  validates :deadline, presence: true

end