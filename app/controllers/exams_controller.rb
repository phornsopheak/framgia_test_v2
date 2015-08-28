class ExamsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :correct_user?, only: [:show, :update]

  def index
    @exam = Exam.new
    @subjects = Subject.order :name
    @exams = current_user.exams.page(params[:page]).order "created_at DESC"
  end

  def show
    @subject = @exam.subject
    if @exam.exam_status? Settings.status.start
      @exam.create_result @subject
      @exam.update_attribute :status, Settings.status.testing
    end
    @duration = @subject.duration * 60 - (Time.zone.now -
      @exam.results.first.created_at).to_i
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

  def update
    @exam.update_attributes time: @exam.spent_time
    if @exam.time_out?
      @exam.update_attributes status: Settings.status.unchecked
    end

    if @exam.update_attributes exam_params
      flash[:notice] = t "flashs.messages.submit_success"
    else
      flash[:alert] = t "flashs.messages.invalid"
    end
    redirect_to exams_url
  end


  private
  def exam_params
    params.require(:exam).permit :subject_id,
      results_attributes: [:id, option_ids: [], answers_attributes: [:id, :content, :option_id]]
  end

  def correct_user?
    redirect_to root_path unless current_user == @exam.user
  end
end
