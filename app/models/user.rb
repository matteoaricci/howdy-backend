class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :messages
  has_many :rooms, through: :messages

  has_many :private_messages, class_name: "User", foreign_key: :sender_id
  has_many :private_messages, class_name: "User", foreign_key: :recipient_id 
end
