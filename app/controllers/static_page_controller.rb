# frozen_string_literal: true

class StaticPageController < ApplicationController
  skip_before_action :authenticate_user!
  def home
    @photos = Photo.limit(20)
  end
end
