class Admin < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :rememberable

  # メール認証を無効化し、usernameで認証
  # def email_required?
  #   false
  # end
  #
  # def email_changed?
  #   false
  # end
  #
  # def will_save_change_to_email?
  #   false
  # end

  # username で認証するための設定
  # def self.find_for_database_authentication(warden_conditions)
  #   find_by(username: warden_conditions[:username])
  # end
end
