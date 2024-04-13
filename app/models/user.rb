class User < ApplicationRecord
  self.table_name = "poweru_users"

  has_one_attached :photo
  has_many :powers, foreign_key: "poweru_user_id"
  has_many :bookings, foreign_key: "poweru_user_id"
  has_many :bookings_as_owner, through: :powers, source: :bookings, foreign_key: "poweru_user_id"


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
