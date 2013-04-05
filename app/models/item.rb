class Item < ActiveRecord::Base
  attr_accessible :completed, :description, :title, :project_id
  validates :completed, :title, :project_id, presence: true

  belongs_to :project

end
