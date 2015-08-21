class Exam < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject

  has_many :questions, through: :results
  has_many :results

  def start?
    Settings.status.start == status
  end
end
