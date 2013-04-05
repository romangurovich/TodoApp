class TeamMembership < ActiveRecord::Base
  attr_accessible :team_id, :user_id
  validates :team_id, :user_d, presence: true

  belongs_to: team
  belongs_to: user
end
