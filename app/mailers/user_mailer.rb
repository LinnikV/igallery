# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def category_subscribe(user, subscribe)
    @user = user
    @subscribe_title = subscribe.category.title

    mail to: @user.email, subject: 'New subscribe'
  end

  def photo_create(user, subscribe, current_user)
    @user = user
    @current_user = current_user.email
    @subscribe = subscribe.category.title

    mail to: @user.email, subject: 'New photo'
  end
end
