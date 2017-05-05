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
    attributesForFaceting [:breed, :size]
    geoloc :latitude, :longitude
  end

  def url
    dog_url(id: self.id, host: ActionMailer::Base.default_url_options[:host])
  end
end
