class SubjectsController < ApplicationController
  load_and_authorize_resource

  def index
    @subjects = Subject.all
  end
end
