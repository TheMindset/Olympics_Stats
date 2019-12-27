# frozen_string_literal: true

class FormatTeamMedalists
  def initialize(team)
    @team = team
  end

  def format_medal
    {
      team: @team.name,
      total_medal_count: @team.total_medal,
      medals: {
        bronze: @team.count_medal('Bronze'),
        silver: @team.count_medal('Silver'),
        gold: @team.count_medal('Gold')
      }
    }
  end
end
