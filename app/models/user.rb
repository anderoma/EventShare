class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :event
  has_many :attendances, through: :events

  
  after_create :welcome_send
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
  
end
