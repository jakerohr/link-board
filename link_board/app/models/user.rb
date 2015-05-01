class User < ActiveRecord::Base

  has_secure_password
  #posts created by the user
  has_many :posts
  #votes ABOUT this user (via votable)
  has_many :votes, as: :votable
  #votes cast by the user (via user_id foreign key)
  has_many :ratings, class_name: 'Vote'
  has_many :comments


  validates :name,
    presence: true,
    length: { maximum: 20 }

  validates :email,
    presence: true,
    uniqueness: {case_sensitive: false}
    # email_format: { message: "Not a valid email address" }

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i


  validates :password,
    presence: true,
    :on => :create

  def self.authenticate email, password
    User.find_by_email(email).try(:authenticate, password)
  end

end
