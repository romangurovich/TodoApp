class Team < ActiveRecord::Base
  attr_accessible :name
  validates :name, presence: true

  has_many :projects, dependent: :destroy
  has_many :team_memberships
  has many :users, through: :team_memberships
end
