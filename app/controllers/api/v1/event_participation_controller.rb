# frozen_string_literal: true

module Api
  module V1
    class EventParticipationController < ApplicationController
      def index
        teams = Team.all
        facade = EventParticipationFacade.new(teams)
        render json: EventParticipationSerializer.new(facade)
      end
    end
  end
end
