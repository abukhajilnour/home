class Idea < ActiveRecord::Base

belongs_to :user
  has_many :comments, dependent: :destroy
  has_one :idea_detail

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user


  has_many :joins,dependent: :destroy
  has_many :joined_users, through: :joins, source: :user
  #validates_presence_of :title
   validates :title, presence: true, uniqueness: true

  validates_presence_of :description, message: "must be present"
 


  scope :recent, lambda {|x| order("created_at DESC").limit(x) }
  scope :recent_ten, -> { order("created_at DESC").limit(10) }


def self.recent_ten
    order("created_at DESC").limit(10)
  end

  def self.recent(x)
    order("created_at DESC").limit(x)
  end

  before_save :capitalize_title  

  def like_for(user)
    likes.find_by_user_id(user)
  end           # call the before_save action :capitalize_title


  def join_for(user)
    joins.find_by_user_id(user)
  end

  private

  def capitalize_title                 # create a method to capitalize the title before saving
    self.title.capitalize!
  end

  

end
