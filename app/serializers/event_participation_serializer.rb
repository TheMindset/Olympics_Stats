# frozen_string_literal: true

class EventParticipationSerializer
  include FastJsonapi::ObjectSerializer
  set_type :team_participation
  set_id :id

  attributes :participations_by_team
end
