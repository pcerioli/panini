class User < ActiveRecord::Base
  attr_accessible :email, :fullname, :password, :password_confirmation

  has_secure_password

  has_many :orders
  
  validates :fullname, :presence => true
  validates :password, 
            :on => :create,
  					:format => {:with => /^(?=.*[a-zA-Z])(?=.*[0-9]).{6,}$/, message: "must be at least 6 characters and include one number and one letter."}
  validates :email,   
            :presence => true,   
            :uniqueness => true,   
            :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i } 


  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

end

