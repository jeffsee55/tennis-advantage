class User < ActiveRecord::Base
  has_many :addresses
  has_many :charges
  has_many :cart_items
  has_many :products, through: :cart_items

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  validates :first_name, presence: true

  def full_name
    self.first_name + " " + self.last_name
  end

  def new_items
     self.cart_items.where(purchased: false)
  end

  def new_products
    products = []
    self.new_items.each do |c|
      products << c.product
    end
    return products
  end

  def new_cart
    self.new_items
  end

  def cart_total
    new_products.sum(&:price)
  end

  def cart_total_in_cents
    cart_total*100
  end

  def reset_cart
    self.cart_items.each do |item|
      item.update(purchased: true)
    end
  end

  def make_admin
    self.update_attributes(admin: true)
  end
end
