class Request < ApplicationRecord
  belongs_to :dog
  belongs_to :user
  has_many :messages, :inverse_of => :request
  accepts_nested_attributes_for :messages
end
