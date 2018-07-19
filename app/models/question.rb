class Question < ApplicationRecord
  has_many :choices

  validates :text, presence: true
end
