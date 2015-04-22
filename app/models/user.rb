class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :flats
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :picture,
    styles: { medium: "300x300!", thumb: "30x30!" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

  # after_create :send_welcome_email

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver
  end

end
