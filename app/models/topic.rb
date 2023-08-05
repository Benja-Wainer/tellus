class Topic < ApplicationRecord
  has_many :articles, through: :tags
  has_many :topics, through: :tags
end
