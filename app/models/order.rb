class Order < ActiveRecord::Base
  attr_accessible :sandwich_id, :client_name, :variation 

  belongs_to :sandwich

	counter_culture :sandwich

  validates :client_name, :presence => true, :length => {:maximum => 255}
  validates :sandwich_id, :presence => true


  after_create :send_order_by_email


  def send_order_by_email
    #Send Order to Sandwich Maker
    OrderMailer.order_confirmation(self).deliver

  end


end
