# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Competitor Stats', type: :request do
  before do
    create(:competitor, sex: 'F', age: 18, height: 159, weight: 61)
    create(:competitor, sex: 'M', age: 35, height: 181, weight: 75)
    create(:competitor, sex: 'F', age: 27, height: 162, weight: 65)
    create(:competitor, sex: 'M', age: 18, height: 174, weight: 69)
    create(:competitor, sex: 'F', age: 16, height: 159, weight: 57)
    create(:competitor, sex: 'F', age: 26, height: 174, weight: 61)
    create(:competitor, sex: 'F', age: 31, height: 179, weight: 63)
  end

  it 'returns stats on all Competitors' do
    get '/api/v1/competitor_stats'

    expect(response).to be_successful

    competitor_stats = JSON.parse(response.boby, symbolize_names: true)[:data]
    competitor_average_weight = competitor_stats[:average_weight]
    competitor_average_height = competitor_stats[:average_height]

    expect(competitor_stats[:total_competitors]).to eq(7)
    expect(competitor_stats[:average_age]).to eq(25)

    expect(competitor_average_weight[:units]).to eq('kg')
    expect(competitor_average_weight[:female_average]).to eq(24)
    expect(competitor_average_weight[:male_average]).to eq(27)

    expect(competitor_average_height[:units]).to eq('cm')
    expect(competitor_average_height[:female_average]).to eq(62)
    expect(competitor_average_height[:male_average]).to eq(72)
  end
end
