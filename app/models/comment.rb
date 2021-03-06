class Comment < ActiveRecord::Base
  belongs_to :post

  belongs_to :author, class_name: User, foreign_key: :author_id

  validates :body, presence: true
  validates :author, presence: true
  validates :post, presence: true

  default_scope -> { order created_at: :desc }
  def byline
    "By #{author.email} - #{created_at}"
  end
end
