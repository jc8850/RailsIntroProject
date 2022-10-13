class Type < ApplicationRecord
  validates :name, presence true, uniqueness: true

  has_many :poke_types
  has_many :pokemons, through: :poke_types
end
