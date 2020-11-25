class User < ApplicationRecord
  validates :username, :email, presence: true
  validates :username, length: {minimum: 3}
  validates :email, uniqueness: {scope: :email, message: "That email is already in use."}
  validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ , message: "Example email: sample_user@gmail.com"}    

  has_many :posts,
    foreign_key: :author_id,
    dependent: :destroy

  has_many :comments,
    foreign_key: :author_id,
    dependent: :destroy
end
