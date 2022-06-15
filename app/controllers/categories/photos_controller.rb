module Categories
  class PhotosController < ApplicationController
    before_action :set_category, only: %i[ upvote create show ]
    

    def upvote
      @photo = @category.photos.find(params[:id])
      @photo.upvote! current_user
      redirect_to request.referrer
    end

    def index
      @q = Photo.ransack(params[:q])
      @pagy, @photos = pagy(@q.result(distinct: true).order(cached_votes_total: :desc), items: 18)
    end

    def show
      @photo = Photo.find(params[:id])
    end


    def create
      @photo = @category.photos.new(photo_params)

      respond_to do |format|
        if @photo.save

            current_user.subscribes.each do |subscribe|
            if (subscribe.category_id) == (@category.id).to_s
                UserMailer.photo_create(current_user, subscribe).deliver_later 
               end
            end

          format.turbo_stream do 
            render turbo_stream: [
              turbo_stream.update("new_photo", partial: "categories/photos/form", locals:{photo: Photo.new} )
            ]
          end
        else
          format.turbo_stream do 
            render turbo_stream: [
              turbo_stream.update("new_photo", partial: "categories/photos/form", locals:{photo: @photo} )
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


