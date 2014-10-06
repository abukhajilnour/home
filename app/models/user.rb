class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :ideas
  has_many :comments
  

  has_many :likes,dependent: :destroy
  has_many :liked_ideas,through: :likes,source: :idea


  has_many :joins,dependent: :destroy
  has_many :joined_ideas,through: :joins,source: :idea

  def full_name
    if first_name || last_name
      "#{first_name} #{last_name}".squeeze.strip
    else
      email
    end
  end

end



