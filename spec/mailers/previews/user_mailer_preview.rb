# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/category_subscribe
  def category_subscribe
    UserMailer.category_subscribe
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/photo_create
  def photo_create
    UserMailer.photo_create
  end
end
