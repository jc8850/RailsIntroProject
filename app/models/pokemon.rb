class Pokemon < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :imgLink, presence: true, uniqueness: true

  has_many :poke_types
  has_many :types, through: :poke_types

  def self.search(search)
    if search
      self.where('name LIKE ?', "%#{search}%")
    else
      find(:all)
    end
  end
  paginates_per 25

end
