class Project < ActiveRecord::Base
  attr_accessible :name, :desription, :team_id
  validates :name, :team_id, presence: true

  belongs_to :team
  has_many :items, dependent: :destroy
  has_one :team
  has_many :users, through: :team
end
