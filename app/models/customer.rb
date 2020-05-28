class Customer < ApplicationRecord
  has_rich_text :notes
  has_many_attached :photos
  belongs_to :user
  belongs_to :folder
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
