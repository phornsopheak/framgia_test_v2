class Subject < ActiveRecord::Base
  include RailsAdminSubject

  has_many :exams
  has_many :questions
end
