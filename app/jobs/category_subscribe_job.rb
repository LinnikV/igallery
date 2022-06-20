class CategorySubscribeJob < ApplicationJob
  queue_as :default

  def perform(current_user, subscribe)
    UserMailer.category_subscribe(current_user, subscribe).deliver_later
  end
end
