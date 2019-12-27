# frozen_string_literal: true

class TeamFormatEventParticipation
  def initialize(team)
    @team = team
  end

  def team_format
    {
      team: @team.name,
      event_participation: "#{Event.team_events(@team.id).count} of #{Event.count} events",
      events: Event.team_events(@team.id)
    }
  end
end
