class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :class_id, :department, :email, :first_name, :last_name, 
                  :password, :password_confirmation, :university, :about_me

  before_create { generate_token(:auth_token) }

  validates_presence_of :class_id, :first_name, :last_name, :university, :department


  has_many :submissions, dependent: :destroy
  has_many :comments        # TODO
  has_many :source_codes, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_and_belongs_to_many :projects
  has_many :contributions


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
