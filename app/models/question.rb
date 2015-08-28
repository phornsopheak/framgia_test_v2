class Question < ActiveRecord::Base
  include RailsAdminQuestion

  belongs_to :subject
  belongs_to :user

  enum state: [:waiting, :accepted, :rejected]

  has_many :options, dependent: :destroy
  has_many :exams, through: :results
  has_many :results

  validates :content, presence: true

  accepts_nested_attributes_for :options, allow_destroy: true

  def is_type? type
    type == question_type
  end

  scope :systems, ->{where user_id: User.select(:id).where(admin: true)}
  scope :suggestion, ->{where user_id: User.select(:id).where(admin: false)}
  scope :rejected, ->{where state: 2}
  scope :waiting, ->{where state: 0}
end
