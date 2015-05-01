class Post < ActiveRecord::Base
  belongs_to :user
  has_many :votes, as: :votable
  has_many :comments

  validates :title,
    presence: true,
    length: { in: 1..100 }

  validates :link,
    presence: true,
    :format => URI::regexp(%w(http https))
end
