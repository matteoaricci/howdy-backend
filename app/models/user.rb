class User < ApplicationRecord
  attr_accessor :login
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  def self.find_for_database_authentication warden_condition
    conditions = warden_condition.dup
    login = conditions.delete(:login)
    where(conditions).where(["lower(username) = :value OR lower(email) = :value", {
      value: login.strip.downcase
    }]).first
  end

  
  has_many :messages
  has_many :rooms, through: :messages

  has_many :private_messages, class_name: "User", foreign_key: :sender_id
  has_many :private_messages, class_name: "User", foreign_key: :recipient_id 

end
