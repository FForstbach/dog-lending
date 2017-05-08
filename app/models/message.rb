class Message < ApplicationRecord
  validates :request, :presence => true
  belongs_to :request
  belongs_to :user
end
