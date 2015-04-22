class Flat < ActiveRecord::Base
  belongs_to :user

  validates :property_type, presence: true, inclusion: {in:["appartement", "maison"]}
  validates :room_type, presence: true, inclusion: {in:["logement entier", "chambre privée", "chambre partagée"]}
  validates :capacity, presence: true
  validates :city, presence: true
  validates :zip_code, presence: true
  validates :street, presence: true
  validates :price,presence: true

end