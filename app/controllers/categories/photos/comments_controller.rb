# frozen_string_literal: true

module Categories
  module Photos
    class CommentsController < ApplicationController
      def index
        @q = Comment.ransack(params[:q])
        @pagy, @comments = pagy(@q.result(distinct: true).order(created_at: :desc), utems: 20)
      end

      def create
        @photo = Photo.find(params[:photo_id])
        @comment = @photo.comments.new(comment_params)
        respond_to do |format|
          if @comment.save
            format.turbo_stream do
              render turbo_stream: [
                turbo_stream.prepend("photo_comment_#{@photo.id}", partial: 'categories/photos/comments/comment',
                                                             locals: { comment: @comment })
              ]
            end
          else
            render_turbo_stream_error
            format.turbo_stream do
              render turbo_stream: [
                turbo_stream.prepend("comment_errors_#{@photo.id}", partial: 'shared/flash')
              ]
            end
          end
        end
      end

      private

      def render_turbo_stream_error
        flash.now[:alert] = @comment.errors.full_messages.join(';')
      end

      def comment_params
        params.require(:comment).permit(:body).merge(user: current_user)
      end
    end
  end
end
