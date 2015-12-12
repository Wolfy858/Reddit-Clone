class Sub < ActiveRecord::Base

  validates :name, :description, presence: true
  validates :name, uniqueness: true

  belongs_to :moderator,
  primary_key: :id,
  foreign_key: :moderator_id,
  class_name: "User",
  inverse_of: :subs

  has_many :posts,
  primary_key: :id,
  foreign_key: :sub_id,
  class_name: "Post",
  inverse_of: :subreddit

end
