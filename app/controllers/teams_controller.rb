class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    @team.update_attributes(params[:team])
    redirect_to team_path(@team)
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new
    @team.name = params[:team][:name]
    if @team.save
      redirect_to team_path(@team)
    else
      flash.now.notice = @team.errors.full_messages
      render :new
    end
  end

  def destroy
    Team.find(params[:id]).destroy
  end
end
