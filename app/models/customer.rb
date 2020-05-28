class Customer < ApplicationRecord
  has_rich_text :notes
  has_many_attached :photos
  belongs_to :user
  belongs_to :folder
end
