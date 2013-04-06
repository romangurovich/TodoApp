class Project < ActiveRecord::Base
  attr_accessible :name, :description, :team_id, :item_ids
  validates :name, :team_id, presence: true

  belongs_to :team
  has_many :items, dependent: :destroy
  has_many :users, through: :team
end
