class Tag < ApplicationRecord
  belongs_to :country
  belongs_to :topic
  belongs_to :article

  validates :topic, :country, :article, presence: true
end
