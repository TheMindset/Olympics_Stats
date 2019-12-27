# frozen_string_literal: true

class MedalistsSerializer
  include FastJsonapi::ObjectSerializer
  set_type :events
  set_id :id

  attributes :event_medalists
end
