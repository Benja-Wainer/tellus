class Tag < ApplicationRecord
  belongs_to :country, optional: true
  belongs_to :topic, optional: true
  belongs_to :article, optional: true
end
