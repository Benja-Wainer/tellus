class Country < ApplicationRecord
  has_many :tags
  has_many :articles, through: :tags
  has_many :topics, through: :tags

  # acts_as_favoritable
  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [ :name ],
    using: {
      tsearch: {prefix: true }
    }
end
