class Customer < ApplicationRecord
  include PgSearch::Model

  # multisearchable against: [:company_name]
  pg_search_scope :search_for_customer,
                  against: [:company_name],
                  using: {
                    tsearch: { prefix: true }
                  }
  has_rich_text :notes
  has_many_attached :photos
  belongs_to :user
  belongs_to :folder
  has_many :customer_products, dependent: :destroy
  has_many :products, through: :customer_products
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
