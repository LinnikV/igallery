# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/category_mailer
class CategoryMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/category_mailer/category_subscribe
  def category_subscribe
    CategoryMailer.category_subscribe
  end
end
