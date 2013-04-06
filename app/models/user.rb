class User < ActiveRecord::Base
  attr_accessible :username, :team_ids, :project_ids
  validates :username, presence: true, length: { minimum: 2 }

  has_many :team_memberships
  has_many :teams, through: :team_memberships
  has_many :projects, through: :teams
  has_many :items, through: :projects
end
