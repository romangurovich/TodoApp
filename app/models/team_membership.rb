class TeamMembership < ActiveRecord::Base
  attr_accessible :team_id, :user_id
  validates :team_id, :user_id, presence: true

  belongs_to :team
  belongs_to :user
end
