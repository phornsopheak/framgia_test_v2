class Option < ActiveRecord::Base
  belongs_to :question

  validates :content, presence: true
  has_many :answers

  scope :count_correct_option, ->(question_id){where("question_id =? and correct =?", question_id, true).count}
  scope :correct_option, ->option_id{where("id =? and correct =?", option_id, true)}
end
