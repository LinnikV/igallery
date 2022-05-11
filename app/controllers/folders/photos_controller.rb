class Folders::PhotosController < ApplicationController
  before_action :set_folder


  def new
    @photo = @folder.photos.new
  end


  def create
    @photo = @folder.photos.new(photo_params)

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @folder, notice: "Photo was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_folder
      @folder = Folder.find(params[:folder_id])
    end

    def photo_params
      params.require(:photo).permit(:img).merge(user: current_user)
    end
end
