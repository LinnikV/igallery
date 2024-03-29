# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show subscribe unsubscribe edit update destroy]

  def index
    @q = Category.ransack(params[:q])
    @pagy, @categories = pagy(@q.result(distinct: true).order(title: :asc), items: 12)
  end

  def show; end

  def new
    @category = Category.new
  end

  def edit
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.update(@category, partial: 'categories/form', locals: { category: @category })
        ]
      end
    end
  end

  def create
    @category = current_user.categories.new(category_params)
    respond_to do |format|
      if @category.save
        flash.now[:notice] = 'Category was successfully created.'
      else
        render_turbo_stream_error
      end
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.prepend('flash', partial: 'shared/flash')
        ]
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update(@category, partial: 'categories/category', locals: { category: @category })
          ]
        end
      else
        render_turbo_stream_error
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.prepend('flash', partial: 'shared/flash')
          ]
        end
      end
    end
  end

  def destroy
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
    end
  end

  def subscribe
    @subscribe = current_user.subscribes.new
    @subscribe.category_id = @category.id
    @subscribe.user_id = current_user.id
    respond_to do |format|
      if @subscribe.save
        CategorySubscribeJob.perform_later(current_user, @subscribe)
        format.html { redirect_to categories_url, notice: 'Subscribe was successfully created.' }
      else
        format.html { redirect_to categories_url, notice: 'You are already subscribed to the category!' }
      end
    end
  end

  def unsubscribe
    @subscribe = current_user.subscribes.find_by(category_id: @category.id)
    @subscribe.destroy

    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Unsubscribe!' }
    end
  end

  private

  def render_turbo_stream_error
    flash.now[:alert] = @category.errors.full_messages.join(';')
  end

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title, :user_id)
  end
end
