class ProjectTeam < ActiveRecord::Base
  attr_accessible :project_id, :team_id
  belongs_to :team
  belongs_to :project
end
