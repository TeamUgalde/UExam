class Exam < ActiveRecord::Base

  belongs_to :user
  has_many :items
  has_many :solved_exams

end
