class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tokens, dependent: :destroy
  has_one :business
  has_one_attached :photo
  has_one_attached :banner
  validates :username, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :account_type, presence: true, inclusion: { in: %w[business user] }
end
