class Genre < ApplicationRecord
<<<<<<< HEAD
  has_many :items

  validates :name, presence: true

=======
  has_many :items, dependent: :destroy
>>>>>>> develop
end
