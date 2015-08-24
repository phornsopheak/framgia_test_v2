class ExamsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @exam = Exam.new
    @subjects = Subject.order :name
    @exams = current_user.exams.page(params[:page]).order "created_at DESC"
  end

  def create
    @exam = current_user.exams.build exam_params
    if @exam.save
      flash[:notice] = flash_message("created")
    else
      flash[:alert] = flash_message("not_created")
    end
    redirect_to exams_path
  end

  private
  def exam_params
    params.require(:exam).permit :subject_id
  end
end
