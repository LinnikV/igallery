class UserMailer < ApplicationMailer

  def category_subscribe(user, subscribe)
    @user = user
    @subscribe_title = subscribe.category.title
    
    mail to: @user.email, subject: "New subscribe"
  end

  def photo_create(user, subscribe)
    @user = user
    @subscribe = subscribe.category.photos
  
    mail to: @user.email, subject: "New photo"
  end
end


