class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update_attributes(params[:project])
    redirect_to project_path(@project)
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new
    @project.name = params[:project][:name]
    @project.description = params[:project][:description]
    @project.team_id = params[:project][:team_id]
    if @project.save
      redirect_to project_path(@project)
    else
      flash.now.notice = @project.errors.full_messages
      render :new
    end
  end

  def destroy
    Project.find(params[:id]).destroy
  end

end
