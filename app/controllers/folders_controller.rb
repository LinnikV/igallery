# frozen_string_literal: true

class FoldersController < ApplicationController
  before_action :set_folder, only: %i[show edit update destroy]

  def index
    @folders = Folder.all
  end

  def show; end

  def edit; end

  def create
    @folder = current_user.folders.new(folder_params)

    respond_to do |format|
      if @folder.save
        format.turbo_stream do render turbo_stream: [
          turbo_stream.update('new_photo', partial: 'folders/photos/form', locals: {photo: Photo.new}),
          turbo_stream.prepend('folders', partial: 'folders/folder', locals: {folder: @folder})

        ]
      end
        format.html { redirect_to folder_url(@folder), notice: 'Folder was successfully created.' }
      else
        format.turbo_stream do render turbo_stream: turbo_stream.update('new_photo', partial: 'folders/photos/form', locals: {photo: Photo.new})
      end
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @folder.update(folder_params)
        format.html { redirect_to folder_url(@folder), notice: 'Folder was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @folder.destroy

    respond_to do |format|
      format.html { redirect_to folders_url, notice: 'Folder was successfully destroyed.' }
    end
  end

  private

  def set_folder
    @folder = Folder.find(params[:id])
  end

  def folder_params
    params.require(:folder).permit(:title, :user_id)
  end
end
