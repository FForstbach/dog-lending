class Request < ApplicationRecord
  belongs_to :dog
  belongs_to :user
  has_many :messages
end
