# frozen_string_literal: true

class EventsController < ApplicationController
  def new
    @event = Event.new
  end
end
