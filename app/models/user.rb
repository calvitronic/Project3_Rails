class User < ApplicationRecord
  has_many :articles, dependent: :destroy

  validates :email, presence: true
end
