class Flat < ActiveRecord::Base
  belongs_to :user
  has_many :bookings



  geocoded_by :address
  after_validation :geocode, if: ->(flat){ flat.street_changed? || flat.zip_code_changed? || flat.city_changed? }

  validates :property_type, presence: true, inclusion: {in:["Appartement", "Maison"]}
  validates :room_type, presence: true, inclusion: {in:["Logement entier", "Chambre privée", "Chambre partagée"]}
  validates :capacity, presence: true
  validates :city, presence: true
  validates :zip_code, presence: true
  validates :street, presence: true
  validates :price,presence: true

  has_attached_file :picture,
    styles: { medium: "353x235>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

  def address
    "#{street}, #{zip_code}, #{city}"
  end
end