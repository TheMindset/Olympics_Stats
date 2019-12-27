# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Medalists competitors endpoint', type: :request do
  it "returns the medalists competitors by sport" do
    comp1, comp2, comp3, comp4 = create_list(:competitor, 4)

    ev1 = create(:event, name: 'Musculation')
    ev2 = create(:event, name: 'Cross-fit')
    ev3 = create(:event, name: 'Boxe-Thai')
    ev4 = create(:event, name: 'Karate')

    create(:competitor_event_with_medal, event: ev1, competitor: comp1)
    create(:competitor_event_with_medal, event: ev1, competitor: comp1)
    create(:competitor_event_with_medal, event: ev2, competitor: comp2)
    create(:competitor_event_with_medal, event: ev3, competitor: comp3)
    create(:competitor_event_with_medal, event: ev3, competitor: comp3)
    create(:competitor_event_with_medal, event: ev4, competitor: comp4)

    get 'api/v1/medalists'

    expect(response).to be_successful

    events = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
    event = events[0]
    first_event_medalists = event[:medalists]

    expect(events.count).to eq(4)
    expect(event).to have_key(:event_name)

    expect(first_event_medalists).to have_key(:name)
    expect(first_event_medalists).to have_key(:age)
    expect(first_event_medalists).to have_key(:team)
    expect(first_event_medalists).to have_key(:medal)
  end
end
