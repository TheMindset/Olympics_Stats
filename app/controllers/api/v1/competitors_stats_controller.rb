# frozen_string_literal: true

module Api
  module V1
    class CompetitorsStatsController < ApplicationController
      def index
        render json: CompetitorsStatsSerializer.new(CompetitorStatFacade.new)
      end
    end
  end
end
