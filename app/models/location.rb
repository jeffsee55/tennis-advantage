class Location < ActiveRecord::Base
  has_one :address
  accepts_nested_attributes_for :address, allow_destroy: true
  store :address, accessors: [:street, :township, :city, :country, :zip]


  def mapify(item)
    self.address[item.to_sym].downcase.tr!(" ", "+")
  end

end
