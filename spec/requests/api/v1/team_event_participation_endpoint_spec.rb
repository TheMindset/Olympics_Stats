# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Event particiaption endpoint", type: :request do
  it "returns event_count where each team participated" do
    team1 = create(:team)
    team2 = create(:team)

    comp1 = create(:competitor, team: team1)
    comp2 = create(:competitor, team: team1)
    comp3 = create(:competitor, team: team2)
    comp4 = create(:competitor, team: team2)

    ev1 = create(:event, name: 'Musculation')
    ev2 = create(:event, name: 'Cross-fit')
    ev3 = create(:event, name: 'Boxe-Thai')
    ev4 = create(:event, name: 'Karate')

    create(:competitor_event_with_medal, event: ev1, competitor: comp1)
    create(:competitor_event_with_medal, event: ev1, competitor: comp1)
    create(:competitor_event_with_medal, event: ev2, competitor: comp2)
    create(:competitor_event_with_medal, event: ev3, competitor: comp1)
    create(:competitor_event_with_medal, event: ev3, competitor: comp3)
    create(:competitor_event_with_medal, event: ev4, competitor: comp4)
    create(:competitor_event_with_medal, event: ev4, competitor: comp4)

    get '/api/v1/event_participation'

    expect(response).to be_successful

    event_participations = JSON.parse(response.body, symbolize_names: true)[:data][:attributes][:participations_by_team]
    first_team = event_participations[0]

    expect(first_team).to have_key(:team)
    expect(first_team).to have_key(:team_event_participation)
    expect(first_team).to have_key(:events)
    expect(first_team[:events].count).to eq(3)
  end
end
