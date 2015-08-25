class Question < ActiveRecord::Base
  belongs_to :subject
  belongs_to :user

  has_many :options
  has_many :exams, through: :results
  has_many :results

  validates :content, presence: true

  accepts_nested_attributes_for :answers, allow_destroy: true
end
