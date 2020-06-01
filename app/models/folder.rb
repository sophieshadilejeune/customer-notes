class Folder < ApplicationRecord
  has_many :customers
  belongs_to :user
end
