class Flat < ActiveRecord::Base
  belongs_to :users

  validate :property_type, presence: true, inclusion: {in:["appartement", "maison"]}
  validate :room_type, presence: true, inclusion: {in:["logement entier", "chambre privée", "chambre partagée"]}
  validate :capacity, presence: true,
  validate :city, presence: true,
  validate :zip_code, presence: true,
  validate :street, presence: true,
  validate :price,presence: true,

end