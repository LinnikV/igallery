module Categories
  class PhotosController < ApplicationController
    before_action :set_photo, only: %i[ show edit update destroy]
    before_action :set_category, only: %i[  upvote update new create show edit destroy]
    

    def upvote
      @photo = @category.photos.find(params[:id])
      @photo.upvote! current_user
      redirect_to request.referrer
    end

    def index
      @q = Photo.ransack(params[:q])
      @pagy, @photos = pagy(@q.result(distinct: true).order(cached_votes_total: :desc), items: 20)
    end

    def show; end

    def edit
      respond_to do |format|
        format.turbo_stream do 
          render turbo_stream: [
          turbo_stream.update(@photo, partial: "categories/photos/form", locals:{photo: @photo})
        ]
        end
      end
    end

    def create
      @photo = @category.photos.new(photo_params)

      respond_to do |format|
        if @photo.save
          format.turbo_stream do 
            render turbo_stream: [
              turbo_stream.update("new_photo", partial: "categories/photos/form", locals:{photo: Photo.new} )
            ]
          end
          format.html { redirect_to @category, notice: 'Photo was successfully created.' }
        else
          format.turbo_stream do 
            render turbo_stream: [
              turbo_stream.update("new_photo", partial: "categories/photos/form", locals:{photo: @photo} )
            ]
          end
        end
      end
    end

    def update
      respond_to do |format|
        if @photo.update(photo_params)
          format.turbo_stream do 
            render turbo_stream: [
            turbo_stream.update(@photo, partial: "categories/photos/photo", locals:{photo: @photo})
          ]
          end
          format.html { redirect_to category_photo_path, notice: 'Photo was successfully updated.' }
        else
          format.turbo_stream do 
            render turbo_stream: [
            turbo_stream.update(@photo, partial: "categories/photos/form", locals:{photo: @photo})
          ]
          end
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @photo.destroy

      respond_to do |format|
        #format.turbo_stream {render turbo_stream: turbo_stream.remove(@photo)}
        format.html { redirect_to @category, notice: 'Photo was successfully destroyed.' }
      end
    end

    private

    def set_photo
      @photo = Photo.find(params[:id])
    end

    def set_category
      @category = Category.find(params[:category_id])
    end

    def photo_params
      params.require(:photo).permit(:image).merge(user: current_user)
    end
  end
end


