# frozen_string_literal: true

# == Schema Information
#
# Table name: competitor_sports
#
#  id            :bigint           not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  competitor_id :bigint
#  sport_id      :bigint
#
# Indexes
#
#  index_competitor_sports_on_competitor_id  (competitor_id)
#  index_competitor_sports_on_sport_id       (sport_id)
#

FactoryBot.define do
  factory :competitor_sport do
    competitor { FactoryBot.create(:competitor) }
    sport { FactoryBot.create(:sport) }
  end
end
