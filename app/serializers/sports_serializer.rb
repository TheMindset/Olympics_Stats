# frozen_string_literal: true

class SportsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name

  attribute :events do |object|
    object.events.map(&:name)
  end
end
