class Order < ActiveRecord::Base
  attr_accessible :sandwich_id, :client_name, :variation 

  belongs_to :sandwich

  validates :client_name, :presence => true, :length => {:maximum => 255}
  validates :sandwich_id, :presence => true
  
end
