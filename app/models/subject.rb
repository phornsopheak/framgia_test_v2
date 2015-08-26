class Subject < ActiveRecord::Base
  has_many :exams
  has_many :questions

  validates :chatwork_room_id, presence: true
end
