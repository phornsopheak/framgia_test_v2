class Question < ActiveRecord::Base
  belongs_to :subject
  belongs_to :user

  enum state: [:waiting, :accepted, :rejected]

  has_many :options, dependent: :destroy
  has_many :exams, through: :results
  has_many :results

  validates :content, presence: true

  accepts_nested_attributes_for :options, allow_destroy: true


  before_update :change_state

  accepts_nested_attributes_for :options, allow_destroy: true

  def is_type? type
    type == question_type
  end

  private
  def change_state
    self.state = 0 if state == Settings.questions.state.rejected
  end
end
