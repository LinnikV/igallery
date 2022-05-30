class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show subscribe unsubscribe edit update destroy ]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
    
  end

  def show; end

  def edit; end

  def create
    @category = current_user.categories.new(category_params)

    respond_to do |format|
      if @category.save
    
        format.html { redirect_to category_url(@category), notice: "Category was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to category_url(@category), notice: 'Category was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
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
    @subscribe = @category.subscribes.new
    @subscribe.category_id = @category.id
    @subscribe.user_id = current_user.id

    respond_to do |format|
      if @subscribe.save
    
        format.html { redirect_to category_url, notice: "Subscribe was successfully created." }
      else
        format.html { redirect_to category_url, notice: 'You are already subscribed to the category!' }
      end
    end
  end

  def unsubscribe
    @subscribe = Subscribe.find_by(params[:subscribe_id])
    @subscribe.destroy

    respond_to do |format|
      format.html { redirect_to category_url, notice: 'Unsubscribe!' }
    end

  end

  private

  def render_turbo_stream_error
    flash.now[:alert] = @category.errors.full_messages.join('; ')
  end

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title, :user_id)
  end
end