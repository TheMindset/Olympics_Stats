# frozen_string_literal: true

class MedalistFacade
  attr_reader :id

  def initialize(events)
    @events = events
  end

  def event_medalists
    @events.map do |event|
      medalists = medalists_by_event(event.id)

      {
        event_name: event.name,
        medalists: format_medalists(medalists)
      }
    end
  end

  def format_medalists(medalists)
    medalists.map do |medalist|
      FormatMedalists.new(medalist).format_madalists_by_events
    end
  end

  def medalists_by_event(event_id)
    Competitor.medalists_competitors(event_id)
  end
end
