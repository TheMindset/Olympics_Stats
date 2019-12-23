# frozen_string_literal: true

# == Schema Information
#
# Table name: competitor_events
#
#  id            :bigint           not null, primary key
#  medal         :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  competitor_id :bigint
#  event_id      :bigint
#
# Indexes
#
#  index_competitor_events_on_competitor_id  (competitor_id)
#  index_competitor_events_on_event_id       (event_id)
#

FactoryBot.define do
  medals = ["NA", "Bronze", "Silver", "Gold"]

  factory :competitor_event do
    competitor { FactoryBot.create(:competitor) }
    event { FactoryBot.create(:event) }
    medal { medals.sample }
  end

  factory :competitor_event_with_medal, parent: :competitor_event do
    medals = ["Bronze", "Silver", "Gold"]

    medal { medals.sample }
  end

  factory :competitor_event_without_medal, parent: :competitor_event do
    medal { "NA" }
  end
end
