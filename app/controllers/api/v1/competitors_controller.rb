# frozen_string_literal: true

module Api
  module V1
    class CompetitorsController < ApplicationController
      def index
        render json: CompetitorSerializer.new(
          Competitor.includes(
            :team,
            :events,
            :sports
          )
        )
      end
    end
  end
end
