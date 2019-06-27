class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist


  has_many :portfolios
  has_many :assets, through: :portfolios

  def is_admin?
    user_type == 'admin'
  end

  def is_user?
    user_type == 'user'
  end

end
