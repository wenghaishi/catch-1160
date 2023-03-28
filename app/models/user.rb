class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tokens, dependent: :destroy
  has_one :business
  has_one_attached :photo
  has_one_attached :banner
  validates :eth_address, presence: true
  validates :username, presence: true, uniqueness: true
  validates :account_type, presence: true, inclusion: { in: %w[business user] }

  def sign_up_params
    params.require(:user).permit(:eth_address, :email, :passsword, :username, :account_type, :photo, :banner)
  end
end
