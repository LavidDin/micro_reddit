class Post < ApplicationRecord
  validates :title, :body, presence: true
  validates :title, uniqueness: {scope: :title, message: "A post with this title already exists."}  

  belongs_to :author, class_name: :User
  has_many :comments, dependent: :destroy
end
