class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  default_scope -> { order(created_at: :desc) }

  validates :content, presence: true
  validates :title, presence: true

  has_many :covers
  accepts_nested_attributes_for :covers, allow_destroy: true
  
end
