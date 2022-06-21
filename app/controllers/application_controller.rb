class ApplicationController < ActionController::Base
    include Pagy::Backend
    before_action :authenticate_user!
    after_action :record_url


    def record_url
        if current_user
            @event = Event.new
            @event.url = request.url
            @event.user_id = current_user.id
            @event.save
        end
    end
end
