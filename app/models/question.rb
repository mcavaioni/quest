class Question < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, uniqueness: true, length: {minimum: 3, maximum: 25}
  validates :content, presence: true, uniqueness: true, length: {minimum: 3, maximum: 300}

end
