# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Competitor endpoint', type: :request do
  it 'returns the list of all competitors' do
    create_list(:competitor, 8)

    get '/api/v1/competitors'

    expect(response).to be_successful

    competitors = JSON.parse(response.body, symbolize_names: true)[:data]
    first_competitor = competitors[0][:attributes]
    expect(competitors.count).to eq(8)

    expect(first_competitor).to have_key(:age)
    expect(first_competitor).to have_key(:name)
    expect(first_competitor).to have_key(:sports)
    expect(first_competitor).to have_key(:team)
    expect(first_competitor).to have_key(:total_medal_count)
  end

  it 'returns the youngest oompetitor' do
    create(:competitor, age: 19)
    create_list(:competitor, 4)

    get '/api/v1/competitors?age=youngest'

    expect(response).to be_successful

    youngest_competitor = JSON.parse(response.body, symbolize_names: true)[:data][0][:attributes]

    expect(youngest_competitor[:age]).to eq(19)
  end
end
