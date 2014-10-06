class Post
  include Mongoid::Document
  field :title, type: String
  field :description, type: String


  validates_presence_of :title
  #embeds :comment
  has_many :remarks
end
