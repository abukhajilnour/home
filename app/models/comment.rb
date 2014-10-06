class Comment < ActiveRecord::Base
  belongs_to :idea
  belongs_to :user
  # has_many :remarks, dependent: :destroy

  validates_presence_of :body

  scope :ordered_by_creation, -> { order("created_at DESC")}
end
