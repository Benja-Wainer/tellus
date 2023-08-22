class Article < ApplicationRecord
  has_many :tags
  has_many :countries, through: :tags
  has_many :topics, through: :tags

  acts_as_favoritable

  validates :title, :content, :url, presence: true
  validates :title, uniqueness: true
end
