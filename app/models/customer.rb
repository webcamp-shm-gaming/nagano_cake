class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy

<<<<<<< HEAD
  validates :first_name, :last_name, :first_name_kana, :last_name_kana, :post_code, :phone_number, :address, presence: true
  has_many :orders, dependent: :destroy

=======
  has_many :orders, dependent: :destroy

  validates :first_name, :last_name, :first_name_kana, :last_name_kana, :post_code, :phone_number, :address, presence: true
>>>>>>> develop
end
