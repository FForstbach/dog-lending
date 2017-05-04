class Dog < ApplicationRecord
  belongs_to :user

  geocoded_by :location
  after_validation :geocode, if: :location_changed?

  mount_uploader :photo, PhotoUploader

  include AlgoliaSearch

  algoliasearch do
    attribute :name, :description, :size, :age, :location, :breed
    attributesForFaceting [:breed, :size]
    geoloc :latitude, :longitude
  end

end
