module Categories
  module Photos
    class CommentsController < ApplicationController
  
      def index
        @q = Comment.ransack(params[:q])
        @pagy, @comments = pagy(@q.result(distinct: true).order(created_at: :desc), utems: 20)
      end

      def create
        @category = Category.find(params[:category_id])
        @photo = Photo.find(params[:photo_id])
        @comment = @photo.comments.new(comment_params)

        respond_to do |format|
          if @comment.save
            format.turbo_stream do 
              render turbo_stream: [
                turbo_stream.update("new_comment", partial: "categories/photos/comments/form", locals:{comment: Comment.new} ),
                turbo_stream.prepend("comment", partial: "categories/photos/comments/comment", locals:{comment: @comment} )
              ]
            end
          else
            format.turbo_stream do 
              render turbo_stream: [
                turbo_stream.update("new_comment", partial: "categories/photos/comments/form", locals:{comment: @comment} )
              ]
            end
          end
        end
      end

      private

      def comment_params
        params.require(:comment).permit(:body).merge(user: current_user)
      end
    end
  end
end