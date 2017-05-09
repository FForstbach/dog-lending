class Dog < ApplicationRecord
  include Rails.application.routes.url_helpers
  belongs_to :user
  has_many :users

  geocoded_by :location
  after_validation :geocode, if: :location_changed?

  mount_uploader :photo, PhotoUploader

  include AlgoliaSearch


  algoliasearch per_environment: true do
    attribute :name, :description, :size, :age, :location, :breed, :url
    attribute :photo do
      self.photo_url
    end
    attributesForFaceting [:breed, :size]
    geoloc :latitude, :longitude
  end

  def url
    dog_path(id: self.id)
  end
end
