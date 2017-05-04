class Dog < ApplicationRecord
  belongs_to :user
  has_many :users

  geocoded_by :location
  after_validation :geocode, if: :location_changed?

  mount_uploader :photo, PhotoUploader

end
