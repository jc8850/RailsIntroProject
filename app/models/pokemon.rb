class Pokemon < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :imgLink, presence: true, uniqueness: true

  has_many :poke_types
  has_many :types, through: :poke_types
end
