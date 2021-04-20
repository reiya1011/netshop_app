class UserMailer < ApplicationMailer

  def account_activation(user)
    @user = user
    mail to: user.email, subject: "アカウント有効化メール"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "パスワード再設定メール"
  end
end
