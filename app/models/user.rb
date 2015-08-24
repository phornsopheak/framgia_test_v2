class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
    :rememberable, :trackable, :validatable, :recoverable

  has_many :exams
  has_many :questions
end
