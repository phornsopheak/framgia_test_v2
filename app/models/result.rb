class Result < ActiveRecord::Base
  belongs_to :exam
  belongs_to :question

  has_many :answers
  has_many :options, through: :answers

  after_create :create_answers

  accepts_nested_attributes_for :answers

  def create_answers
    answers.create unless question.is_type? Settings.exam.question_type.multiple_choice
  end
end
