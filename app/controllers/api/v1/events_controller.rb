# frozen_string_literal: true

module Api
  module V1
    class EventsController < ApplicationController
      def index
        render json: SportsSerializer.new(Sport.includes(:events))
      end
    end
  end
end
