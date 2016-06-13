class User < ActiveRecord::Base
  has_many :carts
  has_many :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



  def current_cart=(cart)

    self.carts << cart
  end

  def current_cart 
    self.carts.last
  end


end
