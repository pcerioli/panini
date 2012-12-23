class Sandwich < ActiveRecord::Base
  attr_accessible :name, :description, :image, :remote_image_url, :orders_attributes

  mount_uploader :image, ImageUploader

  self.per_page = 15
  
  has_many :orders, dependent: :destroy

  accepts_nested_attributes_for :orders #, :reject_if => lambda { |a| a[:client_name].blank? }, :allow_destroy => true 

end
