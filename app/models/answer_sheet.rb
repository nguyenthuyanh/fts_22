class AnswerSheet < ActiveRecord::Base
  belongs_to :examination
  belongs_to :question
  belongs_to :answer

  scope :correct, ->{where correct: true}

end
