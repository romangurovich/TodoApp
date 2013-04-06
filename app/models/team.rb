class Team < ActiveRecord::Base
  attr_accessible :name,:user_ids, :project_ids
  validates :name, presence: true

  has_many :projects, dependent: :destroy
  has_many :items, through: :projects
  has_many :team_memberships
  has_many :users, through: :team_memberships
end
