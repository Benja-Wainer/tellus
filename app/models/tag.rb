class Tag < ApplicationRecord
  belongs_to :country, optional: true
  belongs_to :topic, optional: true
  belongs_to :article, optional: true

  validates :country, :topic, :article,
            presence: true,
            unless: -> { !topic.blank? || !article.blank? || !country.blank? }

  validates :country, uniqueness: { scope: :article }, unless: -> { article.blank? }
end
