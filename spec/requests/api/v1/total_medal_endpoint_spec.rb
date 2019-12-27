# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Total medals endpoint", type: :request do
  it "returns total medals for each team" do
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
    create(:competitor_event_with_medal, event: ev3, competitor: comp3)
    create(:competitor_event_with_medal, event: ev3, competitor: comp3)
    create(:competitor_event_with_medal, event: ev4, competitor: comp4)

    get '/api/v1/medal_count'

    expect(response).to be_successful

    teams = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
    team = teams[:team_medalists][0]
    team_medals = team[:medals]

    expect(teams.count).to eq(2)
    expect(team).to have_key(:team)
    expect(team).to have_key(:total_medal_count)
    expect(team_medals).to have_key(:bronze)
    expect(team_medals).to have_key(:silver)
    expect(team_medals).to have_key(:gold)
  end
end
