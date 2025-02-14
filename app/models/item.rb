class Item < ApplicationRecord
  belongs_to :supermarket
  has_many :customers 
  has_many :customer_items 
  has_many :customers, through: :customer_items 

  def cust_count 
    customers.count
  end
end