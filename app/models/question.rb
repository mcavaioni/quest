class Question < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true, length: {minimum: 3, maximum: 25}
  validates :content, presence: true, uniqueness: true, length: {minimum: 3, maximum: 300}

end
