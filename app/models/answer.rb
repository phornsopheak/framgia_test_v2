class Answer < ActiveRecord::Base
  belongs_to :result
  belongs_to :option

  scope :not_correct, ->result_id{joins(:option)
    .where("options.correct =? and result_id =?", false, result_id).count}
  scope :option_correct, ->result_id{joins(:option)
    .where("options.correct =? and result_id =?", true, result_id).count}

  def is_correct?
    option.correct? ? true : false if option
  end
end
