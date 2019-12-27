# frozen_string_literal: true

class MedalCountFacade
  attr_reader :id

  def initialize(teams)
    @id = nil
    @teams = teams
  end

  def medals_by_team
    @teams.map do |team|
      FormatTeamMedalists.new(team).format_medal
    end
  end
end
