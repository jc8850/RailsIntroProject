class PokeType < ApplicationRecord
  belongs_to :Pokemon
  belongs_to :Type
end
