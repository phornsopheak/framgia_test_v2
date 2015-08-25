class Exam < ActiveRecord::Base
  include RailsAdminExam

  belongs_to :user
  belongs_to :subject

  enum status: [:start, :testing, :checked, :unchecked]

  has_many :questions, through: :results
  has_many :results

  accepts_nested_attributes_for :results

  scope :select_random_question, ->subject{subject.questions
    .limit(subject.number_of_question)
    .order("RAND()")}

  def create_result subject
    question_ids = Exam.select_random_question(subject).pluck :id
    self.question_ids = question_ids
  end

  def time_out?
    if results.count > 0
      created_time = results.first.created_at
      Time.zone.now > created_time + subject.duration.minutes
    end
  end

  def exam_status? exam_status
    exam_status == status
  end

  def spent_time
    interval = Time.zone.now - results.first.created_at
    time = interval > subject.duration * 60 ? subject.duration * 60 : interval
  end

  def update_status_exam
    update_attribute :status, Settings.status.unchecked  if time_out? && exam_status?(Settings.status.testing)
  end

  def send_score_to_chatwork user
    ChatWork.api_key = user.chatwork_api_key
    room_id = subject.chatwork_room_id
    body = I18n.t("exam.labels.score_inform", score: score, total: subject.number_of_question,
      to_id: user.chatwork_id, user_name: user.name)
    ChatWork::Message.create room_id: room_id, body: body
  end

  def calculate_score
    results.where(correct: true).count
  end
end
