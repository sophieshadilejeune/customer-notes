class Product < ApplicationRecord
  include PgSearch::Model
  # multisearchable against: [:name]
  pg_search_scope :search_for_product,
                  against: [:name]
  belongs_to :user
end
