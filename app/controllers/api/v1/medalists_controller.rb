# frozen_string_literal: true

module Api
  module V1
    class MedalistsController < ApplicationController
      def index
        events = Event.all
        facade = MedalistFacade.new(events)
        render json: MedalistsSerializer.new(facade)
      end
    end
  end
end
