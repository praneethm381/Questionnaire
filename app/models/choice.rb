class Choice < ApplicationRecord
  belongs_to :question

  validates :text, presence: true
  validates :correct, inclusion: { in: [true, false] }
  validates :question_id, presence: true, numericality: { only_integer: true }
end
