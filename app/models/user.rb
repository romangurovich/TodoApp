class User < ActiveRecord::Base
  attr_accessible :username
  validates :username, presence: true, length: { min: 2 }

  has_many :team_memberships
  has_many :teams, through: :team_memberships
  has_many :projects, through: :teams
end
