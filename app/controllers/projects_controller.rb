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
    @project.assign_attributes(params[:project])

    if @project.save
      flash.notice = "#{@project.name} updated"
      redirect_to project_path(@project)
    else
      flash.now.alert = @project.errors.full_messages
      render :edit
    end
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])

    if @project.save
      flash.notice = "#{@project.name} created"
      redirect_to project_path(@project)
    else
      flash.now.alert = @project.errors.full_messages
      render :new
    end
  end

  def destroy
    Project.find(params[:id]).destroy
    flash.notice = "Project deleted"
    redirect_to projects_path
  end

end
