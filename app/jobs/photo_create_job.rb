class PhotoCreateJob < ApplicationJob
  queue_as :default

  def perform(user, subscribe, current_user)
    UserMailer.photo_create(user, subscribe, current_user).deliver_later 
  end
end
