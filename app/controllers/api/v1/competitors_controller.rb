# frozen_string_literal: true

module Api
  module V1
    class CompetitorsController < ApplicationController
      def index
        competitor_data = if params[:age]
                            if params[:age] == 'youngest'
                              Competitor.youngest_competitor
                            else
                              Competitor.oldest_competitor
                            end
                          else
                            Competitor.includes(
                              :team,
                              :events,
                              :sports
                            )
                          end
        render json: CompetitorSerializer.new(competitor_data)
      end
    end
  end
end
