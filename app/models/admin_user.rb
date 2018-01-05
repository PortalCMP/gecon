class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :rememberable, :trackable, :validatable, :authentication_keys => [:username]
	validates :email,uniqueness: true
	validates :username,uniqueness: true

	# desse jeito abaixo funciona OK
  # ROLES = %w[superadmin admin user inactive deleted].freeze
  # teste com enum
  enum role: [:superadmin, :admin, :user, :inactive, :deleted]

  def email_required?
    false
  end

  def email_changed?
    false
  end
  
  # use this instead of email_changed? for rails >= 5.1
  def will_save_change_to_email?
    false
  end


end
