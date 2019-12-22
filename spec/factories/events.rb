# frozen_string_literal: true

# == Schema Information
#
# Table name: events
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  sport_id   :bigint
#
# Indexes
#
#  index_events_on_sport_id  (sport_id)
#
# Foreign Keys
#
#  fk_rails_...  (sport_id => sports.id)
#

FactoryBot.define do
  factory :event do
    name { ["Gymnastics Men's Floor Exercise", "Athletics Men's 5,000 metres"].sample }
    sport { FactoryBot.create(:sport) }
  end
end
