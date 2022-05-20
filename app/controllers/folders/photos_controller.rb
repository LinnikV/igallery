# frozen_string_literal: true

module Folders
  class PhotosController < ApplicationController
    before_action :set_photo, only: %i[ show edit update destroy]
    before_action :set_folder, only: %i[  upvote new create show edit destroy]
    

    def upvote
      @photo = @folder.photos.find(params[:id])
      @photo.upvote! current_user
      redirect_to @folder
    end

    def index
      @photos = Photo.all
    end

    def show; end

    def new
      @photo = @folder.photos.new
    end

    def edit; end

    def create
      @photo = @folder.photos.new(photo_params)

      respond_to do |format|
        if @photo.save
          format.html { redirect_to @folder, notice: 'Photo was successfully created.' }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @photo.update(photo_params)
          format.html { redirect_to folder_photo_path, notice: 'Photo was successfully updated.' }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @photo.destroy

      respond_to do |format|
        format.html { redirect_to @folder, notice: 'Photo was successfully destroyed.' }
      end
    end

    private

    def set_photo
      @photo = Photo.find(params[:id])
    end

    def set_folder
      @folder = Folder.find(params[:folder_id])
    end

    def photo_params
      params.require(:photo).permit(:image).merge(user: current_user)
    end
  end
end
