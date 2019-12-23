# frozen_string_literal: true

require 'rails_helper'

RSpec.descrice 'Competitor endpoint', type: :request do
  it 'returnses the list of all competitor' do
    create_list(:competitor, 8)

    get 'api/v1/competitor'

    expect(response).to be_successful

    competitors = JSON.parse(response.body, symbolize: true)[:data]

    expect(competitors.count).to eq(8)

    expect(competitors[0]).to have_key(:age)
    expect(competitors[0]).to have_key(:name)
    expect(competitors[0]).to have_key(:sport)
    expect(competitors[0]).to have_key(:team)
    expect(competitors[0]).to have_key(:total_medal_won)
  end
end
