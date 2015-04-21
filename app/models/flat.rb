class Flat < ActiveRecord::Base
  belongs_to :user

  validate :property_type, presence: true,
  validate :room_type, presence: true,
  validate :capacity, presence: true,
  validate :city, presence: true,
  validate :price, presence: true,
  validate :street, presence: true,
  validate :zip_code, presence: true,
end
