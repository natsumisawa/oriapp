class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_attached_file :icon, styles: { medium: "300x300>", thumb: "100x100>"}
  validates_attachment_content_type :icon, content_type: ["image/jpg","image/jpeg","image/png"]
  has_many :reviews
  has_many :items,through: :reviews
end
