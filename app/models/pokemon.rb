class Pokemon < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :imgLink, presence: true
end
