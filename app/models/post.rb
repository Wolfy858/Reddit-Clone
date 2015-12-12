class Post < ActiveRecord::Base

  validates :title, :user_id, :post_id, :url, presence: true

  belongs_to :author,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: "User",
  inverse_of: :posts

  belongs_to :subreddit,
  primary_key: :id,
  foreign_key: :sub_id,
  class_name: "Sub",
  inverse_of: :posts


end
