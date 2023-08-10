class Topic < ApplicationRecord
  has_many :tags
  has_many :articles, through: :tags
  has_many :countries, through: :tags

  acts_as_favoritable
end
