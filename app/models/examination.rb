class Examination < ActiveRecord::Base
  belongs_to :subject
  belongs_to :user
  has_many :answer_sheets
end
