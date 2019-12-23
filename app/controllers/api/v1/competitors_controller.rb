# frozen_string_literal: true

module Api
  module V1
    class CompetitorsController < ApplicationController
      def index
        render json: CompetitorSerializer.new(Competitor.all)
      end
    end
  end
end
