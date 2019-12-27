# frozen_string_literal: true

module Api
  module V1
    class TeamEventParticipationController < ApplicationController
      def index
        teams = Team.all
        facade = TeamEventParticipationFacade.new(teams)
        render json: TeamEventParticipationSerializer.new(facade)
      end
    end
  end
end
