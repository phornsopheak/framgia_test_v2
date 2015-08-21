class ExamsController < ApplicationController
  load_and_authorize_resource

  def index
    @exams = current_user.exams.page(params[:page]).order "created_at DESC"
  end
end
