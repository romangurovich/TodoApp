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
    @team.assign_attributes(params[:team])

    if @team.save
      redirect_to team_path(@team)
    else
      flash.notice << @team.errors.full_messages
      render :edit
    end
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(params[:team])

    if @team.save
      redirect_to team_path(@team)
    else
      flash.notice << @team.errors.full_messages
      render :new
    end
  end

  def destroy
    Team.find(params[:id]).destroy
    flash.notice << "Team deleted"
    redirect_to teams_path
  end
end
