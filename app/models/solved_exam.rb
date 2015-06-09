class SolvedExam < ActiveRecord::Base

  belongs_to :user
  belongs_to :exam
  has_many :item_answers

end
