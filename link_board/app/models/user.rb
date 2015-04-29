class User < ActiveRecord::Base
  has_secure_password

  validates :email,
    presence: true,
    uniqueness: {case_sensitive: false}

  validates :password,
    presence: true,
    :on => :create

  def self.authenticate email, password
    User.find_by_email(email).try(:authenticate, password)
  end

end
