class Order < ActiveRecord::Base
  attr_accessible :sandwich_id, :client_name, :variation 

  belongs_to :sandwich
end
