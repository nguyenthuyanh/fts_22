class Examination < ActiveRecord::Base
  belongs_to :subject
  belongs_to :user
  has_many :answer_sheets
  has_many :questions, through: :answer_sheets
  has_many :answers, through: :answer_sheets

  accepts_nested_attributes_for :answer_sheets

  before_update :update_score

  scope :in_order, ->(user){where("user_id = ?", user.id).order("created_at desc")}

  private

  def update_score
    score = 0
    results = self.answer_sheets
    results.each do |result|
      if result.answer.present? && result.answer.correct
        result.correct = true
        score = score + 1
      end
    end
    self.number_correct = score
  end

end
