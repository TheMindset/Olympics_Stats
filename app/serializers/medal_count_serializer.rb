# frozen_string_literal: true

class MedalCountSerializer
  include FastJsonapi::ObjectSerializer
  set_type :teams
  set_id :id

  attributes :medals_by_team
end
