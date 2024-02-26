# frozen_string_literal: true

module Categories
  class PhotosController < ApplicationController
    before_action :set_category, only: %i[upvote create]

    def upvote
      @photo = @category.photos.find(params[:id])
      @photo.upvote! current_user
      redirect_to request.referer
    end

    def index
      @q = Photo.ransack(params[:q])
      @pagy, @photos = pagy(@q.result(distinct: true).order(cached_votes_total: :desc), items: 18)
    end

    def create
      @photo = @category.photos.new(photo_params)
      respond_to do |format|
        if @photo.save
          User.find_each do |user|
            @category.subscribes.each do |subscribe|
              if subscribe.category_id == @category.id.to_s && subscribe.user_id == user.id.to_s
                PhotoCreateJob.perform_later(user, subscribe, current_user)
              end
            end
          end

          format.turbo_stream do
            render turbo_stream: [
              turbo_stream.update('new_photo', partial: 'categories/photos/form', locals: { photo: Photo.new })
            ]
          end
        else
          format.turbo_stream do
            render turbo_stream: [
              turbo_stream.update('new_photo', partial: 'categories/photos/form', locals: { photo: @photo })
            ]
          end
        end
      end
    end

    private

    def set_category
      @category = Category.find(params[:category_id])
    end

    def photo_params
      params.require(:photo).permit(:image).merge(user: current_user)
    end
  end
end
