# frozen_string_literal: true

module Api
  module V1
    class MedalCountController < ApplicationController
      def index
        teams = Team.all
        facade = MedalCountFacade.new(teams)
        render json: MedalCountSerializer.new(facade)
      end
    end
  end
end
