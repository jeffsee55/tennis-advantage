class Address < ActiveRecord::Base
  belongs_to :location
  belongs_to :user
  has_many :charges
end
