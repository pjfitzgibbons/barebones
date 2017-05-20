class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :author, class_name: User, foreign_key: :author_id

  validates :title, presence: true
  validates :body, presence: true
  validates :author_id, presence: true

  default_scope -> { order(publish_date: :desc) }


  def byline
    "By #{author.email} - #{publish_date}"
  end

end
