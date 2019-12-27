# frozen_string_literal: true

class EventParticipationFacade
  attr_reader :id

  def initialize(teams)
    @id = nil
    @teams = teams
  end

  def participations_by_team
    @teams.map do |team|
      FormatEventParticipation.new(team).team_format
    end
  end
end
