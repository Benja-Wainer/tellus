class Article < ApplicationRecord
  has_many :tags
  has_many :countries, through: :tags
  has_many :topics, through: :tags

  validates :title, :content, :url, presence: true

  acts_as_favoritable
end
