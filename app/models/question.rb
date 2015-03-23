class Question < ActiveRecord::Base
  belongs_to :subject
  has_many :answers, dependent: :destroy

  scope :create_questions, ->(subject){where("subject_id = ?", subject.id).limit(subject.number_questions).order("RAND()")}                             

end
