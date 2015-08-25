class QuestionsController < ApplicationController
  load_and_authorize_resource

  def new
    @question.answers.build
    @subjects = Subject.all
  end

  def create
    @question = current_user.questions.new question_params
    if @question.save
      redirect_to root_path, notice: flash_message("suggested")
    else
      render :new
    end
  end

  private
  def question_params
    params.require(:question).permit :content, :subject_id, :user_id,
      :state, :question_type, answers_attributes: [:id, :content, :correct, :_destroy]
  end
end
