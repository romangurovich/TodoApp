class Project < ActiveRecord::Base
  attr_accessible :name, :description, :team_ids, :item_ids
  validates :name, presence: true

  has_many :project_teams
  has_many :teams, through: :project_teams
  has_many :users, through: :teams

  has_many :items, dependent: :destroy

end
