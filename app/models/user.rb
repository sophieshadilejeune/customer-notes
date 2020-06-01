class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :customers, dependent: :destroy
  has_many :folders, dependent: :destroy
  has_many :customer_products, through: :customers
  has_many :products, dependent: :destroy
end
