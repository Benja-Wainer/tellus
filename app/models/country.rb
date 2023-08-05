class Country < ApplicationRecord
  has_many :articles, through: :tags
  has_many :tags
  has_many :topics, through: :tags

  # acts_as_favoritable
end
