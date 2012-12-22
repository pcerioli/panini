class Sandwich < ActiveRecord::Base
  attr_accessible :name, :description, :image, :remote_image_url

  mount_uploader :image, ImageUploader

  self.per_page = 15
  
end
