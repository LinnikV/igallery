module Categories
  module Photos
    class CommentsController < ApplicationController
      before_action :set_comment, only: %i[edit update destroy]
      before_action :set_photo, only: %i[ new create update show edit destroy]
      before_action :set_category, only: %i[ new create update show edit destroy]

      def index
        @comments = Comment.all
      end

      def edit
        respond_to do |format|
          format.turbo_stream do 
            render turbo_stream: [
            turbo_stream.update(@comment, partial: "categories/photos/comments/form", locals:{comment: @comment})
          ]
          end
        end
      end

      def create
        @comment = @photo.comments.new(comment_params)

        respond_to do |format|
          if @comment.save
            format.turbo_stream do 
              render turbo_stream: [
                turbo_stream.update("new_comment", partial: "categories/photos/comments/form", locals:{comment: Comment.new} ),
                turbo_stream.prepend("comment", partial: "categories/photos/comments/comment", locals:{comment: @comment} )
              ]
            end
            format.html { redirect_to category_photo_path(@category, @photo), notice: 'Comment was successfully created.' }
          else
            format.turbo_stream do 
              render turbo_stream: [
                turbo_stream.update("new_comment", partial: "categories/photos/comments/form", locals:{comment: @comment} )
              ]
            end
            format.html { render :new, status: :unprocessable_entity }
          end
        end
      end

      def update
        respond_to do |format|
          if @comment.update(comment_params)
            format.turbo_stream do 
              render turbo_stream: [
              turbo_stream.update(@comment, partial: "categories/photos/comments/comment", locals:{comment: @comment})
            ]
            end
            format.html { redirect_to category_photo_path, notice: 'Comment was successfully updated.' }
          else
            format.turbo_stream do 
              render turbo_stream: [
              turbo_stream.update(@comment, partial: "categories/photos/comments/form", locals:{comment: @comment})
            ]
            end
            format.html { render :edit, status: :unprocessable_entity }
          end
        end
      end

      def destroy
        @comment.destroy

        respond_to do |format|
          format.turbo_stream {render turbo_stream: turbo_stream.remove(@comment)}
          format.html { redirect_to category_photo_path(@category, @photo), notice: 'Comment was successfully destroyed.' }
        end
      end

      private

      def set_comment
        @comment = Comment.find(params[:id])
      end

      def set_photo
        @photo = Photo.find(params[:photo_id])
      end

      def set_category
        @category = Category.find(params[:category_id])
      end

      def comment_params
        params.require(:comment).permit(:body).merge(user: current_user)
      end
    end
  end
end