class StaticPageController < ApplicationController
  skip_before_action :authenticate_user!
  def home
    @subscribes = Subscribe.find_by(params[:subscribe_id])
    @category = Category.find_by(params[:category_id])
    @photos = Photo.all

  end
end
