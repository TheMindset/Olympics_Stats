# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Events endpoint', type: :request do
  it "returns the events associate of each Sport" do
    sport1, sport2, sport3, sport4 = create_list(:sport, 4)

    create(:event, sport: sport1)
    create(:event, sport: sport1)
    create(:event, sport: sport1)
    create(:event, sport: sport2)
    create(:event, sport: sport2)
    create(:event, sport: sport4)
    create(:event, sport: sport4)
    create(:event, sport: sport3)

    get '/api/v1/events'

    expect(response).to be_successful

    events_by_sport = JSON.parse(response.body, symbolize_names: true)[:data]
    last_sport_events = events_by_sport.last[:attributes]

    expect(events_by_sport.count).to eq(4)
    expect(last_sport_events[:events]).to be_an(Array)
    expect(last_sport_events[:events].count).to eq(2)
  end
end
