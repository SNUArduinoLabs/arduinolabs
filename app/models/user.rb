class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :class_id, :department, :email, :first_name, :last_name, 
                  :password, :password_confirmation, :university, :about_me

  before_create { generate_token(:auth_token) }

  validates_presence_of :class_id, :first_name, :last_name, :university, :department


  has_many :submissions
  has_many :comments        # TODO
  has_many :source_codes 
  has_one :profile


  def full_name
    first_name + ' ' + last_name
  end

  def send_password_reset

  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

end
