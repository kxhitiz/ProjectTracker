class ProjectsController < ApplicationController
  before_filter

  def index
    @projects = Project.all
  end

  def show
  end

  def new
  end

  def edit
  end

end

