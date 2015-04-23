class Flat < ActiveRecord::Base
  belongs_to :user

  validates :property_type, presence: true, inclusion: {in:["Appartement", "Maison"]}
  validates :room_type, presence: true, inclusion: {in:["Logement entier", "Chambre privée", "Chambre partagée"]}
  validates :capacity, presence: true
  validates :city, presence: true
  validates :zip_code, presence: true
  validates :street, presence: true
  validates :price,presence: true

  has_attached_file :picture,
    styles: { medium: "400x400>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

end